/**
 * @file led_driver.c
 * @author Mohamed Ali Haoufa
 * @brief LED Driver Functions for STM32F401xx MCU
 * @version 0.1
 * @date 2024-09-21
 *
 * This file provides functions to initialize and control LEDs connected to the STM32F401xx microcontroller.
 * It includes functions to initialize the LED, turn it on or off, and toggle its state.
 *
 * @copyright Copyright (c) 2024
 */

#include "led_driver.h"

/**
 * @brief Initializes the LED according to the provided configuration.
 * @param [in] led_cfg Pointer to the structure holding the LED configuration.
 * @return None
 * 
 * This function initializes the LED by configuring the GPIO pin according to the settings specified
 * in the `led_cfg` structure. The LED is initially turned off based on its mode (active high or active low).
 * 
 * - If the LED mode is `LED_Active_High`, the LED is turned off by setting the GPIO pin to reset.
 * - If the LED mode is `LED_Active_Low`, the LED is turned off by setting the GPIO pin to set.
 */
void LED_Init(const LED_cfg_t *led_cfg) {
    /* Validate that led_cfg is not a NULL pointer */
    if (NULL != led_cfg) {
        MCAL_GPIO_Init(led_cfg->LED_Port, (GPIO_PinConfig_t*)&(led_cfg->LED_Pin));
        /* Set LED initial state */
        if (led_cfg->LED_Mode == LED_Active_High) {
            MCAL_GPIO_WritePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber, GPIO_PIN_RESET);
        } else if (led_cfg->LED_Mode == LED_Active_Low) {
            MCAL_GPIO_WritePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber, GPIO_PIN_SET);
        } else {
            /* Do Nothing */
        }
    } else {
        /* Do Nothing */
    }
}

/**
 * @brief Turns on the LED.
 * @param [in] led_cfg Pointer to the structure holding the LED configuration.
 * @return None
 * 
 * This function turns on the LED based on its mode. If the mode is active high, the GPIO pin is set.
 * If the mode is active low, the GPIO pin is reset.
 */
void LED_TurnOn(const LED_cfg_t *led_cfg) {
    /* Validate that led_cfg is not a NULL pointer */
    if (NULL != led_cfg) {
        if (led_cfg->LED_Mode == LED_Active_High) {
            MCAL_GPIO_WritePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber, GPIO_PIN_SET);
        } else if (led_cfg->LED_Mode == LED_Active_Low) {
            MCAL_GPIO_WritePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber, GPIO_PIN_RESET);
        } else {
            /* Do Nothing */
        }
    } else {
        /* Do Nothing */
    }
}

/**
 * @brief Turns off the LED.
 * @param [in] led_cfg Pointer to the structure holding the LED configuration.
 * @return None
 * 
 * This function turns off the LED based on its mode. If the mode is active high, the GPIO pin is reset.
 * If the mode is active low, the GPIO pin is set.
 */
void LED_TurnOff(const LED_cfg_t *led_cfg) {
    /* Validate that led_cfg is not a NULL pointer */
    if (NULL != led_cfg) {
        if (led_cfg->LED_Mode == LED_Active_High) {
            MCAL_GPIO_WritePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber, GPIO_PIN_RESET);
        } else if (led_cfg->LED_Mode == LED_Active_Low) {
            MCAL_GPIO_WritePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber, GPIO_PIN_SET);
        } else {
            /* Do Nothing */
        }
    } else {
        /* Do Nothing */
    }
}

/**
 * @brief Toggles the status of the LED.
 * @param [in] led_cfg Pointer to the structure holding the LED configuration.
 * @return None
 * 
 * This function toggles the state of the LED by changing the state of the GPIO pin. The LED's state
 * is switched between on and off.
 */
void LED_Toggle(const LED_cfg_t *led_cfg) {
    /* Validate that led_cfg is not a NULL pointer */
    if (NULL != led_cfg) {
        MCAL_GPIO_TogglePin(led_cfg->LED_Port, led_cfg->LED_Pin.GPIO_PinNumber);
    } else {
        /* Do Nothing */
    }
}

