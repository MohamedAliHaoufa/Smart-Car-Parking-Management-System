/**
 * @file stm32f401xx_systick_driver.h
 * @author Mohamed Ali Haoufa
 * @brief 
 *    Header file for configuring and controlling the SysTick timer in the STM32F401xx MCU.
 *    This file contains the necessary structures, macros, and function prototypes for 
 *    SysTick initialization, configuration, and handling delays.
 * @version 0.1
 * @date 2024-09-21
 * 
 * This file is part of the STM32F401xx peripheral driver library, focusing on the 
 * SysTick timer. The driver allows users to configure SysTick as a periodic or 
 * one-shot timer, handle interrupt configuration, and generate delays.
 * 
 * @copyright
 *    Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 *    This software is provided "as is," without warranty of any kind, 
 *    express or implied, including but not limited to the warranties 
 *    of merchantability, fitness for a particular purpose, and noninfringement.
 */

#ifndef INC_STM32F401XX_SYSTICK_DRIVER_H_
#define INC_STM32F401XX_SYSTICK_DRIVER_H_

/**
 * @defgroup SYSTICK_Driver SYSTICK Driver
 * @brief SYSTICK driver APIs for STM32F401xx MCU.
 * @{
 */

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx.h"

//----------------------------------------------
// Section: User Type Definitions
//----------------------------------------------

/**
 * @brief SysTick Configuration Structure Definition
 * 
 * This structure contains the configuration options for the SysTick timer,
 * including the running mode, clock source, interrupt configuration, and 
 * reload value. A callback function can also be specified to handle the SysTick
 * interrupt.
 */
typedef struct {
    uint8 running_mode;      /**< @ref stk_running_mode_define - Running mode of the SysTick timer */
    uint8 clock_config;      /**< @ref stk_clock_config_define - Clock source for the SysTick timer */
    uint8 interrupt_config;  /**< @ref stk_interrupt_config_define - Interrupt enable/disable configuration */
    uint32 reload_value;     /**< Reload value to define the SysTick timer's duration */
    void (*Callback_Function)(void);  /**< Pointer to the callback function for SysTick interrupt */
} STK_config_t;

//----------------------------------------------
// Section: Macros Configuration References
//----------------------------------------------

/** 
 * @brief Interrupt enable/disable mask for the SysTick timer. 
 */
#define STK_INTERRUPT_MASK    0x02UL

/** 
 * @brief Clock source mask for the SysTick timer. 
 */
#define STK_CLK_MASK          0x04UL

/** 
 * @brief Reload value mask for the SysTick timer.
 */
#define STK_RELOAD_MASK       0x00FFFFFFUL

/** 
 * @brief CPU frequency definition for the SysTick timer.
 */
#define STK_FCPU              8000000UL  /**< 8 MHz CPU frequency */

/** @defgroup stk_interrupt_config_define SysTick Interrupt Configuration
 * @{
 */
#define STK_INTERRUPT_ENABLED  0x02UL  /**< Enable SysTick interrupt */
#define STK_INTERRUPT_DISABLED 0x00UL  /**< Disable SysTick interrupt */
/** @} */

/** @defgroup stk_clock_config_define SysTick Clock Configuration
 * @{
 */
#define STK_CLK_AHB           0x04UL  /**< SysTick clock sourced from AHB */
#define STK_CLK_AHB_8         0x00UL  /**< SysTick clock sourced from AHB/8 */
/** @} */

/** @defgroup stk_running_mode_define SysTick Running Mode Configuration
 * @{
 */
#define STK_PERIODIC_MODE     0x01U   /**< Periodic mode for SysTick */
#define STK_ONE_SHOT_MODE     0x00U   /**< One-shot mode for SysTick */
/** @} */

/*
 * =============================================
 * APIs Supported by "SysTick"
 * =============================================
 */

/**
 * @defgroup SYSTICK_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Configures the SysTick timer with the specified parameters.
 * 
 * This function configures the SysTick timer's clock source, interrupt settings,
 * and reload value based on the input configuration structure.
 * 
 * @param [in] _cfg Pointer to the configuration structure containing the SysTick settings.
 * @return None
 * 
 * @note The SysTick timer is stopped when this function is called. It must be re-enabled manually.
 */
void MCAL_STK_Config(STK_config_t *_cfg);

/**
 * @brief Sets the reload value for the SysTick timer.
 * 
 * This function sets the reload value which determines the SysTick timer's period.
 * 
 * @param [in] value The reload value to be set.
 * @return None
 */
void MCAL_STK_SetReload(uint32 value);

/**
 * @brief Sets the callback function for the SysTick timer interrupt.
 * 
 * This function assigns a user-defined callback function that will be executed
 * when the SysTick interrupt is triggered.
 * 
 * @param [in] pfCallback Pointer to the callback function to be executed on SysTick interrupt.
 * @return None
 */
void MCAL_STK_SetCallback(void (*pfCallback)(void));

/**
 * @brief Starts the SysTick timer.
 * 
 * This function starts the SysTick timer. The timer must be configured using
 * MCAL_STK_Config() before starting it unless default values are used.
 * 
 * @return None
 */
void MCAL_STK_StartTimer();

/**
 * @brief Stops the SysTick timer.
 * 
 * This function stops the SysTick timer, halting its operation until restarted.
 * 
 * @return None
 */
void MCAL_STK_StopTimer();

/**
 * @brief Delays the system by a specified number of ticks using the SysTick timer.
 * 
 * This function uses the SysTick timer to generate a delay for a specified
 * number of ticks. After the delay, the timer configuration and reload value
 * are restored.
 * 
 * @param [in] delay_ticks The number of ticks to delay.
 * @return None
 */
void MCAL_STK_Delay(uint32 delay_ticks);

/**
 * @brief Delays the system by a specified number of milliseconds.
 * 
 * This function generates a delay for the specified number of milliseconds
 * using the SysTick timer. The user must define the system frequency 
 * (@ref stk_cpu_freq_define) to ensure accurate delays.
 * 
 * @param [in] delay_ms The number of milliseconds to delay.
 * @return None
 */
void MCAL_STK_Delay1ms(uint32 delay_ms);
/** @} */

/** @} */

#endif /* INC_STM32F401XX_SYSTICK_DRIVER_H_ */

