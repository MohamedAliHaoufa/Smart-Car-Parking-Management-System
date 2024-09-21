/**
 * @file           ecu.c
 * @author         Mohamed Ali Haoufa
 * @brief          Contains the main program logic for managing STM32F401xx MCU-based peripherals.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file includes the initialization and control logic for peripherals
 * such as LEDs, LCDs, UART, PIR sensors, and servo motors. It operates
 * the system based on a state machine, managing various hardware components.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 */

#include "app_states.h"

/**
 * @brief The main entry point of the application.
 * 
 * This function initializes the system and enters an infinite loop where
 * the application state handler function, `fp_App_State_Handler`, is called
 * repeatedly. The system's operation is driven by a state machine, so no
 * additional initialization or processing is performed in this function.
 * 
 * @return int This function does not return under normal operation, as it
 * operates in an infinite loop.
 */
int main(void)
{
    /* The system will initialize and run based on a state machine; no need 
       to do anything in main */
    while (1) {
        fp_App_State_Handler();
    }
    return 0;
}

