/**
 * @file           led_driver.h  
 * @author         Mohamed Ali Haoufa
 * @brief          Header file for the STM32F401xx microcontroller LED driver.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file provides the necessary definitions, macros, and function prototypes
 * for controlling LEDs connected to the STM32F401xx microcontroller. It includes
 * configurations for LED modes and APIs for initializing and manipulating LEDs.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 */

/**
 * @defgroup LED_Driver LED Driver
 * @brief LED driver for STM32F401xx MCUs.
 * @{
 */

#ifndef INC_LED_DRIVER_H_
#define INC_LED_DRIVER_H_

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx_gpio_driver.h"

//----------------------------------------------
// Section: User Type Definitions
//----------------------------------------------

/**
 * @defgroup LED_MODES Enum for specifying the LED mode.
 * @{
 */
typedef enum {
    LED_Active_High, /**< LED is active when the GPIO pin is high. */
    LED_Active_Low,  /**< LED is active when the GPIO pin is low. */
    LED_Mode_max     /**< Maximum value for LED mode enumeration. */
} LED_Mode_t;
/** @} */

/**
 * @defgroup LED_Structure_Config Structure for configuring an LED.
 * @{
 */
typedef struct {
    GPIO_TypeDef*    LED_Port; /**< GPIO port for the LED. */
    GPIO_PinConfig_t LED_Pin;  /**< GPIO pin configuration for the LED. */
    LED_Mode_t       LED_Mode; /**< LED mode configuration. */
} LED_cfg_t;
/** @} */

/**
 * @defgroup LED_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the LED with the specified configuration.
 * 
 * This function configures the GPIO pin according to the settings provided
 * in the `led_cfg` structure. The LED is initially off after initialization.
 * 
 * @param [in]  led_cfg: Pointer to the structure holding the LED configuration.
 * 
 * @return     None
 * 
 * @note       Ensure that the GPIO port and pin configuration in `led_cfg`
 *             are correctly set before calling this function.
 */
void LED_Init(const LED_cfg_t* led_cfg);

/**
 * @brief Turns on the LED.
 * 
 * This function sets the GPIO pin to the appropriate state to turn on the LED
 * based on the configuration provided in `led_cfg`.
 * 
 * @param [in]  led_cfg: Pointer to the structure holding the LED configuration.
 * 
 * @return     None
 * 
 * @note       The behavior of this function depends on the LED mode configured
 *             in `led_cfg`. For `LED_Active_High`, the pin is set high; for
 *             `LED_Active_Low`, the pin is set low.
 */
void LED_TurnOn(const LED_cfg_t* led_cfg);

/**
 * @brief Turns off the LED.
 * 
 * This function sets the GPIO pin to the appropriate state to turn off the LED
 * based on the configuration provided in `led_cfg`.
 * 
 * @param [in]  led_cfg: Pointer to the structure holding the LED configuration.
 * 
 * @return     None
 * 
 * @note       The behavior of this function depends on the LED mode configured
 *             in `led_cfg`. For `LED_Active_High`, the pin is set low; for
 *             `LED_Active_Low`, the pin is set high.
 */
void LED_TurnOff(const LED_cfg_t* led_cfg);

/**
 * @brief Toggles the state of the LED.
 * 
 * This function changes the LED state from on to off or off to on by toggling
 * the GPIO pin according to the configuration provided in `led_cfg`.
 * 
 * @param [in]  led_cfg: Pointer to the structure holding the LED configuration.
 * 
 * @return     None
 * 
 * @note       The behavior of this function depends on the LED mode configured
 *             in `led_cfg`. For `LED_Active_High`, the pin is toggled between
 *             high and low; for `LED_Active_Low`, the pin is toggled between low
 *             and high.
 */
void LED_Toggle(const LED_cfg_t* led_cfg);
/** @} */

#endif /* INC_LED_DRIVER_H_ */

/** @} */