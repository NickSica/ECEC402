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
#include "platform.h"
#include "xscutimer.h"
#include "xparameters.h"
#include "xscugic.h"
#include "xgpio.h"

#define COUNT_MAX 3
#define COUNTS_PER_SECOUND XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ / 2

#define BTNS_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define LEDS_DEVICE_ID XPAR_AXI_GPIO_1_DEVICE_ID

#define INTC_GPIO_INTERRUPT_ID XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define BTN_INT XGPIO_IR_CH1_MASK

// declare LED and button instances
XGpio LEDInst, BTNInst;

// declare variables
static volatile int btn_value = 1;
static volatile int state = 1; // state variable for the lock

// XscTimer snoop controller unit timer interrupt prototype
static void TimerInst_Intr_handler(void *CallBackRef);
static volatile int count = 0; // variable number of XScuTimer interrupts

// declare button interrupt prototype
static void BTN_Intr_Handler(void *baseaddr_p);

int main()
{
    init_platform();
    int status;

    // Initialize LEDs
    status = XGpio_Initialize(&LEDInst, LEDS_DEVICE_ID);
    if(status != XST_SUCCESS) return XST_FAILURE;

    // Set LEDs direction to outputs
    XGpio_SetDataDirection(&LEDInst, 1, 0x00);

    // Initialize Push Buttons
    status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
    if(status != XST_SUCCESS) return XST_FAILURE;

    // Set all buttons direction to inputs
    XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

    /* Declare ScuTimer Instance and Configuration*/
    XScuTimer TimerInst;
    XScuTimer_Config *Timer_Config;

    /* Declare Interrupt Controller XScuGic instance and configuration */
    XScuGic INTCInst;
    XScuGic_Config *INTC_Config;
    INTC_Config = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);

    /* Instantiate Interrupt Controller */
    status = XScuGic_CfgInitialize(&INTCInst, INTC_Config, INTC_Config->CpuBaseAddress);

    /* Instantiate XScuTimer */
    Timer_Config = XScuTimer_LookupConfig(XPAR_PS7_SCUTIMER_0_DEVICE_ID);
    status = XScuTimer_CfgInitialize(&TimerInst, Timer_Config, Timer_Config->BaseAddr);

    /* XScuGic interrupt register */
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
            (Xil_ExceptionHandler)XScuGic_InterruptHandler, &INTCInst);

    /* XScuTimer: connect interrupt controller and TimerInst_Intr_handler*/
    status = XScuGic_Connect(&INTCInst, XPAR_SCUTIMER_INTR,
            (Xil_ExceptionHandler)TimerInst_Intr_handler,
            (void *)&TimerInst);
    XScuGic_Enable(&INTCInst, XPAR_SCUTIMER_INTR);

    // Enable XScuTimer instance
    XScuTimer_EnableInterrupt(&TimerInst);
    Xil_ExceptionEnable();

    // Button: connect interrupt controller and button interrupt handler
    status = XScuGic_Connect(&INTCInst,
            INTC_GPIO_INTERRUPT_ID,
            (Xil_ExceptionHandler)BTN_Intr_Handler,
            (void *)&BTNInst);
    if(status != XST_SUCCESS) return XST_FAILURE;

    // Enable GPIO interrupts interrupt
    XGpio_InterruptEnable(&BTNInst, 1);
    XGpio_InterruptGlobalEnable(&BTNInst);

    // Enable GPIO and timer interrupts in the controller
    XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);

    /* XScuTimer clock */
    XScuTimer_LoadTimer(&TimerInst, COUNTS_PER_SECOUND);
    XScuTimer_EnableAutoReload(&TimerInst);
    XScuTimer_Start(&TimerInst);

    // LED 1 on
    XGpio_DiscreteWrite(&LEDInst, 1, 1);
    while(1)
    {
        if (count >= COUNT_MAX) break;
    }

    printf(" End Program\n\r");
    Xil_ExceptionDisable();
    XScuGic_Disconnect(&INTCInst, XPAR_SCUTIMER_INTR);
    cleanup_platform();
    return 0;
}

static void TimerInst_Intr_handler(void *CallBackRef)
{
    XScuTimer *This_TimerInst = (XScuTimer *) CallBackRef;
    if (XScuTimer_IsExpired(This_TimerInst))
        count++;
}
void BTN_Intr_Handler(void *InstancePtr)
{
    // Disable GPIO interrupts
    XGpio_InterruptDisable(&BTNInst, BTN_INT);

    // Ignore additional button presses
    if ((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT) != BTN_INT)
    {
        return;
    }
    if (count < COUNT_MAX)
    {
        btn_value = XGpio_DiscreteRead(&BTNInst, 1);
        if(state == 1 && btn_value == 1)
            state = 3;
        else if(state == 3 && btn_value == 2)
            state = 7;
        else if(state == 7 && btn_value == 4)
            state = 15;
        XGpio_DiscreteWrite(&LEDInst, 1, state);
    }
    (void)XGpio_InterruptClear(&BTNInst, BTN_INT);
    // Enable GPIO interrupts
    XGpio_InterruptEnable(&BTNInst, BTN_INT);
}
