/**
 * @file           Servo_Motor.h  
 * @author         Mohamed Ali Haoufa
 * @brief          Header file for controlling servo motors on the STM32F401xx microcontroller.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file provides definitions, macros, and function prototypes for controlling
 * servo motors used in gate mechanisms. It includes functions for initializing
 * and operating servo motors for both entry and exit gates.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 */

/**
 * @defgroup SERVO_MOTOR_Driver SERVO MOTOR Driver
 * @brief SERVO MOTOR driver for STM32F401xx MCUs.
 * @{
 */

#ifndef INC_SERVO_MOTOR_DRIVER_H_
#define INC_SERVO_MOTOR_DRIVER_H_

#include "stm32f401xx.h"
#include "stm32f401xx_gpio_driver.h"
#include "stm32f401xx_timer_driver.h"

//----------------------------------------------
// Section: Macros
//----------------------------------------------

/**
 * @defgroup Macro_Definitons Macros for the servo motor directions
 * @{
 */

/**
 * @brief Macro for the servo motor direction to move the gate upwards.
 */
#define SERVO_UP        0

/**
 * @brief Macro for the servo motor direction to move the gate downwards.
 */
#define SERVO_DOWN      1
/** @} */

//----------------------------------------------
// Section: Function Prototypes
//----------------------------------------------

/**
 * @defgroup SERVO_MOTOR_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the servo motor for the entry gate.
 * 
 * This function configures the necessary GPIO and timer settings for controlling
 * the servo motor associated with the entry gate.
 * 
 * @return None
 * 
 * @note This function must be called before operating the entry gate servo motor.
 */
void Servo1_Entry_Gate_Init(void);

/**
 * @brief Controls the servo motor for the entry gate.
 * 
 * This function sets the servo motor to the specified direction (up or down) based
 * on the `Direction` parameter.
 * 
 * @param [in]  Direction: Specifies the direction of the servo motor. This can be
 *                          either `SERVO_UP` to move the gate upwards or
 *                          `SERVO_DOWN` to move the gate downwards.
 * 
 * @return None
 * 
 * @note Ensure that `Servo1_Entry_Gate_Init()` is called prior to using this function.
 */
void Servo1_Entry_Gate(uint8 Direction);

/**
 * @brief Initializes the servo motor for the exit gate.
 * 
 * This function configures the necessary GPIO and timer settings for controlling
 * the servo motor associated with the exit gate.
 * 
 * @return None
 * 
 * @note This function must be called before operating the exit gate servo motor.
 */
void Servo2_Exit_Gate_Init(void);

/**
 * @brief Controls the servo motor for the exit gate.
 * 
 * This function sets the servo motor to the specified direction (up or down) based
 * on the `Direction` parameter.
 * 
 * @param [in]  Direction: Specifies the direction of the servo motor. This can be
 *                          either `SERVO_UP` to move the gate upwards or
 *                          `SERVO_DOWN` to move the gate downwards.
 * 
 * @return None
 * 
 * @note Ensure that `Servo2_Exit_Gate_Init()` is called prior to using this function.
 */
void Servo2_Exit_Gate(uint8 Direction);
/** @} */

#endif /* INC_SERVO_MOTOR_DRIVER_H_ */

/** @} */