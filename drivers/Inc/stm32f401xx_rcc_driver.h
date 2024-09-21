/**
 * @file stm32f401xx_rcc_driver.h
 * @author Mohamed Ali Haoufa
 * @brief Header file for RCC (Reset and Clock Control) driver for STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 *
 * This header file defines the macros, constants, and function prototypes for managing 
 * the Reset and Clock Control (RCC) peripheral of the STM32F401xx microcontroller. 
 * It includes clock source selection, peripheral enablement, and clock frequency retrieval.
 *
 * @copyright Copyright (c) 2024 Mohamed Ali Haoufa
 */

#ifndef INC_STM32F401XX_RCC_DRIVER_H_
#define INC_STM32F401XX_RCC_DRIVER_H_

/**
 * @defgroup RCC_Driver RCC Driver
 * @brief RCC driver APIs for STM32F401xx MCU.
 * @{
 */

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx.h"

//----------------------------------------------
// Section: Macros and Definitions
//----------------------------------------------

/** @defgroup RCC_CLOCK_SOURCE_define Clock Source Selection
 * @{
 */
#define RCC_PLLCFGR_PLLSRC_HSE  ((uint32_t)0x00400000) /**< PLL source is HSE (High-Speed External) */
#define HSI_VALUE 16000000U    /**< Internal High-Speed Oscillator frequency (16 MHz) */
#define HSE_VALUE 8000000U     /**< External High-Speed Oscillator frequency (8 MHz) */
/** @} */

/** @defgroup RCC_PERIPHERALS_define Peripheral Selection
 * @{
 */
#define RCC_GPIOA     ((uint8_t)0x00) /**< GPIOA Peripheral */
#define RCC_GPIOB     ((uint8_t)0x01) /**< GPIOB Peripheral */
#define RCC_GPIOC     ((uint8_t)0x02) /**< GPIOC Peripheral */
#define RCC_GPIOD     ((uint8_t)0x03) /**< GPIOD Peripheral */
#define RCC_GPIOE     ((uint8_t)0x04) /**< GPIOE Peripheral */
#define RCC_USART1    ((uint8_t)0x08) /**< USART1 Peripheral */
#define RCC_USART2    ((uint8_t)0x09) /**< USART2 Peripheral */
#define RCC_USART6    ((uint8_t)0x0A) /**< USART6 Peripheral */
#define RCC_SPI1      ((uint8_t)0x0B) /**< SPI1 Peripheral */
#define RCC_SPI2      ((uint8_t)0x0C) /**< SPI2 Peripheral */
#define RCC_I2C1      ((uint8_t)0x0D) /**< I2C1 Peripheral */
#define RCC_I2C2      ((uint8_t)0x0E) /**< I2C2 Peripheral */
#define RCC_CRC       ((uint8_t)0x0F) /**< CRC Peripheral */
#define RCC_TIM2      ((uint8_t)0x10) /**< TIM2 Peripheral */
#define RCC_SYSCFG    ((uint8_t)0x11) /**< SYSCFG Peripheral */
/** @} */

/** @defgroup RCC_CLOCK_SOURCE_define Clock Source Selection
 * @{
 */
#define HSI_RC_CLK    8000000UL /**< RC Clock Source (8 MHz) */
#define HSE_CLK       8000000UL /**< External Oscillator Clock Source (8 MHz) */

#define RCC_SELECT_HSI ((uint8_t)0x00) /**< Select HSI as clock source */
#define RCC_SELECT_HSE ((uint8_t)0x01) /**< Select HSE as clock source */
#define RCC_SELECT_PLL ((uint8_t)0x02) /**< Select PLL as clock source */
/** @} */

/**
 * @defgroup RCC_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Select the clock source for the MCU.
 * 
 * This function configures the clock source used by the microcontroller.
 *
 * @param[in] clock Clock source to select, as defined in @ref RCC_CLOCK_SOURCE_define.
 * @return None
 */
void MCAL_RCC_Select_Clock(uint8_t clock);

/**
 * @brief Enable the clock for a specific peripheral.
 *
 * This function enables the clock for the specified peripheral.
 *
 * @param[in] peripheral Peripheral to enable, as defined in @ref RCC_PERIPHERALS_define.
 * @return None
 */
void MCAL_RCC_Enable_Peripheral(uint8_t peripheral);

/**
 * @brief Reset a specific peripheral.
 *
 * This function resets the specified peripheral.
 *
 * @param[in] peripheral Peripheral to reset, as defined in @ref RCC_PERIPHERALS_define.
 * @return None
 */
void MCAL_RCC_Reset_Peripheral(uint8_t peripheral);

/**
 * @brief Get the frequency of the system clock.
 *
 * This function retrieves the frequency of the system clock (SYSCLK).
 *
 * @return Frequency of the system clock in Hertz.
 */
uint32_t MCAL_RCC_GetSYS_CLKFreq(void);

/**
 * @brief Get the frequency of the AHB bus clock.
 *
 * This function retrieves the frequency of the AHB (Advanced High-performance Bus) clock.
 *
 * @return Frequency of the AHB bus clock in Hertz.
 */
uint32_t MCAL_RCC_GetHCLKFreq(void);

/**
 * @brief Get the frequency of the APB1 bus clock.
 *
 * This function retrieves the frequency of the APB1 (Advanced Peripheral Bus 1) clock.
 *
 * @return Frequency of the APB1 bus clock in Hertz.
 */
uint32_t MCAL_RCC_GetPCLK1Freq(void);

/**
 * @brief Get the frequency of the APB2 bus clock.
 *
 * This function retrieves the frequency of the APB2 (Advanced Peripheral Bus 2) clock.
 *
 * @return Frequency of the APB2 bus clock in Hertz.
 */
uint32_t MCAL_RCC_GetPCLK2Freq(void);

/**
 * @brief Get the frequency of the PLL (Phase-Locked Loop) output clock.
 *
 * This function calculates and returns the frequency of the PLL output clock.
 *
 * @return Frequency of the PLL output clock in Hertz.
 */
uint32_t RCC_GetPLLOutputClock(void);
/** @} */

#endif /* INC_STM32F401XX_RCC_DRIVER_H_ */

/** @} */
