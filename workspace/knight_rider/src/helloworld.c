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
#include "xscugic.h"
#include "xil_exception.h"

#include "led_drv.h"

// Parameter definitions
#define INTC_DEVICE_ID         XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID         XPAR_AXI_GPIO_0_DEVICE_ID
#define SWS_DEVICE_ID          XPAR_AXI_GPIO_1_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR

#define BTN_INT                XGPIO_IR_CH1_MASK
#define LED_ADDR               XPAR_LED_DRV_0_S00_AXI_BASEADDR

XGpio SWSInst, BTNInst;
XScuGic INTCInst;
static int switch_data = 1;
static int btn_value = 1;

// Prototype Functions
static void BTN_Intr_Handler(void *);
static int InterruptSystemSetup(XScuGic *);
static int IntcInit(u16, XGpio *);

//----------------------------------------------------
// MAIN FUNCTION
//----------------------------------------------------
int main(void)
{
	int status;
	printf("Knight rider started\r\n");

	//----------------------------------------------------
	// INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
	//----------------------------------------------------
	// Initialize switches
	status = XGpio_Initialize(&SWSInst, SWS_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;
	// Initialize Push Buttons
	status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
	if(status != XST_SUCCESS) return XST_FAILURE;
	// Set switches direction to outputs
	XGpio_SetDataDirection(&SWSInst, 1, 0xFF);
	// Set all buttons direction to inputs
	XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

	// Initialize interrupt controller
	status = IntcInit(INTC_DEVICE_ID, &BTNInst);
	if(status != XST_SUCCESS) return XST_FAILURE;
	while(1);
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

	// right to left and left to right
	if(btn_value == 1)
	{
		// Get switch value
		switch_data = XGpio_DiscreteRead(&SWSInst, 1);
		printf("Switch Data is %x\r\n", switch_data);
		LED_DRV_mWriteReg(LED_ADDR, 0, switch_data);
	}
	else if(btn_value == 2)
	{
		// shift led_drv reg, a write to slv_reg1
		LED_DRV_mWriteReg(LED_ADDR, 4, 0);

		// read slv_reg2 connects to led_drv reg
		xil_printf("%x\r\n", (unsigned int)LED_DRV_mReadReg(LED_ADDR, 8));
		sleep(1);
	}
	//XGpio_DiscreteWrite(&LEDInst, 1, led_data);
	(void)XGpio_InterruptClear(&BTNInst, BTN_INT);

	// Enable GPIO interrupts
	XGpio_InterruptEnable(&BTNInst, BTN_INT);
}

//----------------------------------------------------
// INITIAL SETUP FUNCTIONS
//----------------------------------------------------
int InterruptSystemSetup(XScuGic *XScuGicInstancePtr)
{
	// Enable interrupt
	XGpio_InterruptEnable(&BTNInst, BTN_INT);
	XGpio_InterruptGlobalEnable(&BTNInst);
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			XScuGicInstancePtr);
	Xil_ExceptionEnable();
	return XST_SUCCESS;
}

int IntcInit(u16 DeviceId, XGpio *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Call to interrupt setup
	status = InterruptSystemSetup(&INTCInst);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
			INTC_GPIO_INTERRUPT_ID,
			(Xil_ExceptionHandler)BTN_Intr_Handler,
			(void *)GpioInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;

	// Enable GPIO interrupts interrupt
	XGpio_InterruptEnable(GpioInstancePtr, 1);
	XGpio_InterruptGlobalEnable(GpioInstancePtr);

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);
	return XST_SUCCESS;
}
