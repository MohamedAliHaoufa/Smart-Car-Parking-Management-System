/**
 * @file           keypad_driver.c  
 * @author         Mohamed Ali Haoufa
 * @brief          Source file for the keypad driver, implementing functionality 
 *                 to initialize and read input from a keypad connected to the STM32F401xx MCU.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file contains the implementation of functions for initializing the keypad
 * and reading the pressed key values. It includes definitions and configurations 
 * for keypad rows and columns, as well as utility functions to interface with the 
 * hardware.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 * 
 */

#include "keypad_driver.h"

//----------------------------------------------
// Section: Keypad Configuration
//----------------------------------------------

/**
 * @brief Array holding the characters of the keypad in a 2D matrix format.
 * 
 * This array defines the mapping of characters to the rows and columns of the keypad.
 */
static uint8 Keypad_Buttons[KEYPAD_ROWS][KEYPAD_COLS] = {
    { '*' , '0' , '#' },
    { '7' , '8' , '9' },
    { '4' , '5' , '6' },
    { '1' , '2' , '3' }
};

/**
 * @brief Array holding the GPIO pin numbers for keypad rows.
 */
static uint16 Keypad_ROWS_GPIO[KEYPAD_ROWS] = {ROW0, ROW1, ROW2, ROW3};

/**
 * @brief Array holding the GPIO pin numbers for keypad columns.
 */
static uint16 Keypad_COLS_GPIO[KEYPAD_COLS] = {COL0, COL1, COL2};

//----------------------------------------------
// Section: Function Definitions
//----------------------------------------------

/**
 * @brief Initializes the keypad by configuring the GPIO pins.
 * 
 * This function sets up the GPIO pins for keypad rows as outputs and columns as inputs.
 * It also sets the default state of the rows to low and configures pull-down resistors 
 * for the column pins.
 * 
 * @return None
 * 
 * @note User must define GPIO pins for rows and columns in @ref Keypad_PINS_define.
 */
void keypad_init(void) {
    GPIO_PinConfig_t Pin_Cfg;

    // Configure rows as outputs
    Pin_Cfg.GPIO_MODE = GPIO_MODE_OUT;
    Pin_Cfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
    Pin_Cfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    Pin_Cfg.GPIO_PinSpeed = GPIO_SPEED_FAST;

    for (uint8 i = 0; i < KEYPAD_ROWS; i++) {
        Pin_Cfg.GPIO_PinNumber = Keypad_ROWS_GPIO[i];
        MCAL_GPIO_Init(KEYPAD_PORT, &Pin_Cfg);
        MCAL_GPIO_WritePin(KEYPAD_PORT, Keypad_ROWS_GPIO[i], GPIO_PIN_RESET);
    }

    // Configure columns as inputs with pull-down resistors
    Pin_Cfg.GPIO_MODE = GPIO_MODE_IN;
    Pin_Cfg.GPIO_PinPuPdControl = GPIO_PIN_PD;

    for (uint8 i = 0; i < KEYPAD_COLS; i++) {
        Pin_Cfg.GPIO_PinNumber = Keypad_COLS_GPIO[i];
        MCAL_GPIO_Init(KEYPAD_PORT, &Pin_Cfg);
    }
}

/**
 * @brief Reads the pressed key from the keypad.
 * 
 * This function scans the keypad to detect any pressed key and returns the corresponding
 * character. If no key is pressed, it returns 'F'.
 * 
 * @return Value of the pressed key, or 'F' if no key is pressed.
 */
uint8 keypad_Get_Pressed_Key(void) {
    uint8 return_char = 'F';
    uint8 row_index, col_index;

    for (row_index = 0; row_index < KEYPAD_ROWS; row_index++) {
        // Set current row to high
        MCAL_GPIO_WritePin(KEYPAD_PORT, Keypad_ROWS_GPIO[row_index], GPIO_PIN_SET);

        for (col_index = 0; col_index < KEYPAD_COLS; col_index++) {
            if (MCAL_GPIO_ReadPin(KEYPAD_PORT, Keypad_COLS_GPIO[col_index]) == GPIO_PIN_SET) {
                // Wait for key release
                while (MCAL_GPIO_ReadPin(KEYPAD_PORT, Keypad_COLS_GPIO[col_index]) == GPIO_PIN_SET);

                // Return the pressed key character
                return_char = Keypad_Buttons[row_index][col_index];
                MCAL_GPIO_WritePin(KEYPAD_PORT, Keypad_ROWS_GPIO[row_index], GPIO_PIN_RESET);
                return return_char;
            }
        }

        // Reset row to low
        MCAL_GPIO_WritePin(KEYPAD_PORT, Keypad_ROWS_GPIO[row_index], GPIO_PIN_RESET);
    }

    return return_char;
}

