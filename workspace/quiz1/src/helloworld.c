#include <unistd.h>
#include <stdio.h>

#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xil_exception.h"

// Parameter definitions
#define BTNS_DEVICE_ID         XPAR_AXI_GPIO_0_DEVICE_ID
#define LED_DEVICE_ID          XPAR_AXI_GPIO_1_DEVICE_ID

#define BTN_INT                XGPIO_IR_CH1_MASK
#define DOUBLE_CLICK_INTERVAL  500000

XGpio LEDInst, BTNInst;
static int led_data = 0;

int main()
{
    int status;
    init_platform();
    print("Midterm project started\n\r");

    //----------------------------------------------------
    // INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
    //----------------------------------------------------
    // Initialize LEDs
    status = XGpio_Initialize(&LEDInst, LED_DEVICE_ID);
    if(status != XST_SUCCESS) return XST_FAILURE;
    // Initialize Push Buttons
    status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
    if(status != XST_SUCCESS) return XST_FAILURE;
    // Set LEDs direction to outputs
    XGpio_SetDataDirection(&LEDInst, 1, 0x00);
    // Set all buttons direction to inputs
    XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

    while(1)
    {
        xil_printf("***** start *****\r\n");
        while(XGpio_DiscreteRead(&BTNInst, 1) == 0);
        usleep(10000);
        while(XGpio_DiscreteRead(&BTNInst, 1) == 1);
        xil_printf("One click\r\n");
        int second_press = 0;
        int time_expired = 0;
        int i = 0;
        while((time_expired == 0) && (second_press == 0))
        {
            i++;
            if(XGpio_DiscreteRead(&BTNInst, 1) == 1)
            {
                second_press = 1;
                usleep(10000);
                while(XGpio_DiscreteRead(&BTNInst, 1) == 1);
            }
            else if(i > DOUBLE_CLICK_INTERVAL)
                time_expired = 1;
        }

        if(second_press == 1)
            led_data ^= 0b1;
        XGpio_DiscreteWrite(&LEDInst, 1, led_data);
    }

    cleanup_platform();
    return 0;
}
