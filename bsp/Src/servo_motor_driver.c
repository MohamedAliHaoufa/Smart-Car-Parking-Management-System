/**
 * @file Sorce_Motor.c
 * @author Mohamed Ali Haoufa
 * @brief Servo Motor Driver Functions for STM32F401xx MCU
 * @version 0.1
 * @date 2024-09-21
 *
 * This file provides functions to initialize and control servo motors connected to the STM32F401xx microcontroller.
 * It includes functions for setting up and controlling two servo motors used for gate operations.
 *
 * @copyright Copyright (c) 2024
 */

#include "servo_motor_driver.h"

/**
 * @brief Initializes the servo motor connected to pin B8 for entry gate operations.
 * @param None
 * @return None
 * 
 * This function configures the GPIO pin B8 as an output pin to control Servo Motor 1. 
 * The pin configuration includes setting the mode to output, push-pull operation type, no pull-up/pull-down,
 * and fast speed.
 */
void Servo1_Entry_Gate_Init(void)
{
    GPIO_PinConfig_t PinCinfg;
    PinCinfg.GPIO_PinNumber = GPIO_PIN_8;
    PinCinfg.GPIO_MODE = GPIO_MODE_OUT;
    PinCinfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
    PinCinfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    PinCinfg.GPIO_PinSpeed = GPIO_SPEED_FAST;

    MCAL_GPIO_Init(GPIOB, &PinCinfg);
}

/**
 * @brief Moves the entry gate servo motor to the specified direction.
 * @param [in] Direction Direction for the servo motor movement (SERVO_UP or SERVO_DOWN).
 * @return None
 * 
 * This function controls the servo motor connected to pin B8 to either move the entry gate up or down.
 * - If `Direction` is `SERVO_UP`, the servo moves to +90 degrees.
 * - If `Direction` is `SERVO_DOWN`, the servo moves to -90 degrees.
 * The movement duration is controlled by setting the pin high, waiting for the required duration, and then setting the pin low.
 */
void Servo1_Entry_Gate(uint8 Direction)
{
    if(Direction == SERVO_UP)
    {
        // Move servo1 to +90 degrees
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_8, 1);
        dus(500);
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_8, 0);
    }
    else if(Direction == SERVO_DOWN)
    {
        // Move servo1 to -90 degrees
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_8, 1);
        dus(2994);
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_8, 0);
    }
}

/**
 * @brief Initializes the servo motor connected to pin B9 for exit gate operations.
 * @param None
 * @return None
 * 
 * This function configures the GPIO pin B9 as an output pin to control Servo Motor 2. 
 * The pin configuration includes setting the mode to output, push-pull operation type, no pull-up/pull-down,
 * and fast speed.
 */
void Servo2_Exit_Gate_Init(void)
{
    GPIO_PinConfig_t PinCinfg;
    PinCinfg.GPIO_PinNumber = GPIO_PIN_9;
    PinCinfg.GPIO_MODE = GPIO_MODE_OUT;
    PinCinfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
    PinCinfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    PinCinfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
    
    MCAL_GPIO_Init(GPIOB, &PinCinfg);
}

/**
 * @brief Moves the exit gate servo motor to the specified direction.
 * @param [in] Direction Direction for the servo motor movement (SERVO_UP or SERVO_DOWN).
 * @return None
 * 
 * This function controls the servo motor connected to pin B9 to either move the exit gate up or down.
 * - If `Direction` is `SERVO_UP`, the servo moves to +90 degrees.
 * - If `Direction` is `SERVO_DOWN`, the servo moves to -90 degrees.
 * The movement duration is controlled by setting the pin high, waiting for the required duration, and then setting the pin low.
 */
void Servo2_Exit_Gate(uint8 Direction)
{
    if(Direction == SERVO_UP)
    {
        // Move servo2 to +90 degrees
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, 1);
        dus(500);
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, 0);
    }
    else if(Direction == SERVO_DOWN)
    {
        // Move servo2 to -90 degrees
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, 1);
        dus(2994);
        MCAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, 0);
    }
}

