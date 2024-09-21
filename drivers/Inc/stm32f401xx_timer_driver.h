/**
 * @file stm32f401xx_timer_driver.h
 * @author Mohamed Ali Haoufa
 * @brief 
 *    Header file providing timer functionalities for the STM32F401xx MCU. 
 *    This file contains the necessary definitions, macros, and functions 
 *    to manage Timer 2 (TIM2) in the STM32F401xx microcontroller.
 * @version 0.1
 * @date 2024-09-21
 * 
 * This file is part of the STM32F401xx peripheral driver library, which
 * offers low-level control of the MCU's timers, specifically Timer 2 (TIM2).
 * It provides initialization functions for TIM2, along with delay 
 * functionalities in microseconds and milliseconds.
 * 
 * @copyright
 *    Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 *    This software is provided "as is," without warranty of any kind, 
 *    express or implied, including but not limited to the warranties 
 *    of merchantability, fitness for a particular purpose, and noninfringement.
 */

#ifndef INC_STM32F401XX_TIMER_DRIVER_H_
#define INC_STM32F401XX_TIMER_DRIVER_H_

/**
 * @defgroup TIMER_Driver TIMER Driver
 * @brief TIMER driver APIs for STM32F401xx MCU.
 * @{
 */

#include "stm32f401xx.h"
#include "stm32f401xx_gpio_driver.h"

/**
 * @defgroup TIM2_Register TIM2 Register group
 * @brief TIM2 Register group
 * @{
 */

/** 
 * @brief Enable the APB1 peripheral clock for TIM2.
 */
#define RCC_APB1ENR *(volatile uint32 *)(RCC_BASE + 0x40)

/** 
 * @brief Enable the APB2 peripheral clock for TIM2.
 */
#define RCC_APB2ENR *(volatile uint32 *)(RCC_BASE + 0x44)

/** 
 * @brief TIM2_Register TIM2 Register Base Addresses and Offsets
 */
#define TIM2_TIMER_BASE 0x40000000  /**< Base address of TIM2 */

/** 
 * @brief Control register 1 (CR1) for TIM2.
 */
#define TIM2_CR1 *(volatile uint32 *)(TIM2_TIMER_BASE + 0x00)

/** 
 * @brief DMA/interrupt enable register (DIER) for TIM2.
 */
#define TIM2_DIER *(volatile uint32 *)(TIM2_TIMER_BASE + 0x0C)

/** 
 * @brief Status register (SR) for TIM2.
 */
#define TIM2_SR *(volatile uint32 *)(TIM2_TIMER_BASE + 0x10)

/** 
 * @brief Counter register (CNT) for TIM2.
 */
#define TIM2_CNT *(volatile uint32 *)(TIM2_TIMER_BASE + 0x24)

/** 
 * @brief Prescaler register (PSC) for TIM2.
 */
#define TIM2_PSC *(volatile uint32 *)(TIM2_TIMER_BASE + 0x28)

/** 
 * @brief Auto-reload register (ARR) for TIM2.
 */
#define TIM2_ARR *(volatile uint32 *)(TIM2_TIMER_BASE + 0x2C)

/** @} */ // end of TIM2_Register group

/**
 * @defgroup TIMER_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initialize Timer 2 (TIM2) for basic timing functionalities.
 *
 * This function configures the TIM2 peripheral with the necessary prescaler and 
 * auto-reload values, enabling it to function as a basic timer for timing and 
 * delay applications.
 */
void Timer2_init(void);

/**
 * @brief Delay execution for a specified number of microseconds.
 *
 * This function uses TIM2 to generate a delay in microseconds.
 * @param us Number of microseconds to delay.
 */
void dus(int us);

/**
 * @brief Delay execution for a specified number of milliseconds.
 *
 * This function uses TIM2 to generate a delay in milliseconds.
 * @param ms Number of milliseconds to delay.
 */
void dms(int ms);
/** @} */


#endif /* INC_STM32F401XX_TIMER_DRIVER_H_ */

/** @} */
