/**
 * @file           keypad_driver.h
 * @author         Mohamed Ali Haoufa
 * @brief          Header file for the STM32F401xx microcontroller keypad driver.
 * @version        0.1
 * @date           2024-09-21
 *
 * This header file provides the necessary definitions, macros, and function
 * prototypes for interfacing with a keypad connected to the STM32F401xx
 * microcontroller. It includes definitions for keypad rows and columns, as well
 * as APIs for initializing the keypad and reading the pressed key.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 */

/**
 * @defgroup KEYPAD_Driver KEYPAD Driver
 * @brief Driver for interfacing with a keypad for STM32F401xx MCUs.
 * @{
 */

#ifndef INC_KEYPAD_DRIVER_H_
#define INC_KEYPAD_DRIVER_H_

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx_gpio_driver.h"

//----------------------------------------------
// Section: Macros Configuration
//----------------------------------------------
// @ref Keypad_PINS_define

/**
 * @brief Defines the GPIO port and pins for the keypad.
 * 
 * The following macros are used to configure the keypad:
 * - @ref KEYPAD_PORT: GPIO port used for the keypad.
 * - @ref KEYPAD_ROWS: Number of rows in the keypad.
 * - @ref ROW0, ROW1, ROW2, ROW3: GPIO pins for each row.
 * - @ref KEYPAD_COLS: Number of columns in the keypad.
 * - @ref COL0, COL1, COL2: GPIO pins for each column.
 */
#define KEYPAD_PORT    GPIOE
#define KEYPAD_ROWS    4
#define ROW0           GPIO_PIN_0
#define ROW1           GPIO_PIN_1
#define ROW2           GPIO_PIN_3
#define ROW3           GPIO_PIN_4
#define KEYPAD_COLS    3
#define COL0           GPIO_PIN_5
#define COL1           GPIO_PIN_6
#define COL2           GPIO_PIN_7

/*
 * =============================================
 * APIs Supported by "Keypad"
 * =============================================
 */

/**
 * @defgroup KEYPAD_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the keypad.
 * 
 * This function configures the GPIO pins for the keypad as defined by the
 * macros in the "Macros Configuration" section. It sets up the keypad
 * for operation by initializing the necessary hardware.
 * 
 * @param[in]  None
 * @param[out] None
 * @return     None
 * @note       User must define GPIO pins for rows and columns in @ref Keypad_PINS_define.
 */
void keypad_init(void);

/**
 * @brief Checks for a pressed key and returns its value.
 * 
 * This function scans the keypad to determine if any key is pressed and
 * returns the corresponding key value. If no key is pressed, it returns
 * the value 'F'.
 * 
 * @param[in]  None
 * @param[out] None
 * @return     uint8 Value of the pressed key, or 'F' if no key is pressed.
 * @note       None
 */
uint8 keypad_Get_Pressed_Key(void);
/** @} */

#endif /* INC_KEYPAD_DRIVER_H_ */

/** @} */