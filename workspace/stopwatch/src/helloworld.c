/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <unistd.h>

#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xtmrctr.h"
#include "xscugic.h"
#include "xil_exception.h"

#define INTC_DEVICE_ID         XPAR_PS7_SCUGIC_0_DEVICE_ID
#define TMR_DEVICE_ID          XPAR_TMRCTR_0_DEVICE_ID
#define BTNS_DEVICE_ID         XPAR_AXI_GPIO_0_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define INTC_TMR_INTERRUPT_ID  XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR

#define BTN_INT                XGPIO_IR_CH1_MASK
#define TMR_LOAD			   0xFF000000
#define TMR_FREQ               XPAR_TMRCTR_0_CLOCK_FREQ_HZ

XGpio BTNInst;
XScuGic INTCInst;
XTmrCtr TMRInst;
static int count = 0;
static int btn_value = 1;

// Prototype Functions
static void BTN_Intr_Handler(void *);
static void TMR_Intr_Handler(void *);
static int IntcInit(u16, XTmrCtr *, XGpio *);

//----------------------------------------------------
// MAIN FUNCTION
//----------------------------------------------------
int main(void)
{
	init_platform();
	int status;
	printf("Stopwatch program started\r\n");

	//----------------------------------------------------
	// INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
	//----------------------------------------------------
	// Initialize Push Buttons
	status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;
	// Set all buttons direction to inputs
	XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

	//----------------------------------------------------
	// SETUP THE TIMER
	//----------------------------------------------------
	status = XTmrCtr_Initialize(&TMRInst, TMR_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;
	XTmrCtr_SetHandler(&TMRInst, TMR_Intr_Handler, &TMRInst);
	XTmrCtr_SetResetValue(&TMRInst, 0, TMR_LOAD);
	XTmrCtr_SetOptions(&TMRInst, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	XTmrCtr_Reset(&TMRInst, 0);

	// Initialize interrupt controller
	status = IntcInit(INTC_DEVICE_ID, &TMRInst, &BTNInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	while(1);

	cleanup_platform();
	return 0;
}

//----------------------------------------------------
// INTERRUPT HANDLER FUNCTIONS
// - called by the timer, button interrupt, performs
// - Knight rider LEDs
//----------------------------------------------------
void BTN_Intr_Handler(void *InstancePtr)
{
	// Disable GPIO interrupts
	XGpio_InterruptDisable(&BTNInst, BTN_INT);

	// Ignore additional button presses
	if((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT) != BTN_INT) return;
	btn_value = XGpio_DiscreteRead(&BTNInst, 1);
	//xil_printf("Button Value: %x.\r\n", btn_value);
	if(btn_value == 1)
	{
		// If running or not running
		if(TMRInst.IsStartedTmrCtr0)
		{
			XTmrCtr_Stop(&TMRInst, 0);
			unsigned int curr_val = XTmrCtr_GetValue(&TMRInst, 0);
			double seconds = ((count * 0xFFFFFF) + (curr_val - TMR_LOAD)) / (double)TMR_FREQ;
			xil_printf("Stopwatch Stopped\r\n");
			printf("Time: %f seconds.\r\n", seconds);
		}
		else
		{
			XTmrCtr_SetResetValue(&TMRInst, 0, XTmrCtr_GetValue(&TMRInst, 0));
			XTmrCtr_Start(&TMRInst, 0);
			XTmrCtr_SetResetValue(&TMRInst, 0, TMR_LOAD);
			xil_printf("Stopwatch Started.\r\n");
		}
	}
	else if(btn_value == 2)
	{
		XTmrCtr_Stop(&TMRInst, 0);
		count = 0;
		XTmrCtr_Reset(&TMRInst, 0);
		xil_printf("Stopwatch Stopped and Reset.\r\n");
	}

	(void)XGpio_InterruptClear(&BTNInst, BTN_INT);

	// Enable GPIO interrupts
	XGpio_InterruptEnable(&BTNInst, BTN_INT);
}

void TMR_Intr_Handler(void *data)
{
	if(XTmrCtr_IsExpired(&TMRInst, 0))
	{
		XTmrCtr_Stop(&TMRInst, 0);
		count++;
		XTmrCtr_Reset(&TMRInst, 0);
		XTmrCtr_Start(&TMRInst, 0);
	}
}

//----------------------------------------------------
// INITIAL SETUP FUNCTIONS
//----------------------------------------------------
int IntcInit(u16 DeviceId, XTmrCtr* TmrInstancePtr, XGpio* GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Enable exceptions
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			&INTCInst);
	Xil_ExceptionEnable();

	// Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
			INTC_GPIO_INTERRUPT_ID,
			(Xil_ExceptionHandler)BTN_Intr_Handler,
			(void *)GpioInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Enable GPIO interrupts interrupt
	XGpio_InterruptEnable(GpioInstancePtr, 1);
	XGpio_InterruptGlobalEnable(GpioInstancePtr);

	// Connect timer interrupt to handler
	status = XScuGic_Connect(&INTCInst,
			INTC_TMR_INTERRUPT_ID,
			(Xil_ExceptionHandler)TMR_Intr_Handler,
			(void *)TmrInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);
	XScuGic_Enable(&INTCInst, INTC_TMR_INTERRUPT_ID);
	return XST_SUCCESS;
}
