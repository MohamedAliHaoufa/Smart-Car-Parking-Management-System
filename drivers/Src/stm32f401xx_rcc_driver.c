/**
 * @file RCC_driver.c
 * @author Mohamed Ali Haoufa
 * @brief RCC (Reset and Clock Control) driver for STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file contains implementations for managing the RCC peripheral of the STM32F401xx
 * microcontroller. It includes functions to configure the clock sources, enable or reset
 * peripherals, and retrieve various clock frequencies.
 *
 * @copyright Copyright (c) 2024
 */

#include "stm32f401xx_rcc_driver.h"

/** 
 * @brief Array of AHB prescaler values.
 * 
 * This array holds the prescaler values for the AHB clock.
 */
uint16_t AHB_PreScaler[8] = {2, 4, 8, 16, 64, 128, 256, 512};

/**
 * @brief Array of APB1 prescaler values.
 * 
 * This array holds the prescaler values for the APB1 clock.
 */
uint8_t APB1_PreScaler[4] = {2, 4, 8, 16};

/**
 * @brief Table for AHB prescaler values.
 * 
 * This table maps the AHB prescaler values based on the configuration register settings.
 */
static const uint8 AHBPrescTable[16U] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9};

/**
 * @brief Selects the clock source for the MCU.
 * 
 * This function configures the MCU to use one of the available clock sources.
 * 
 * @param[in] clock Clock source selection. Possible values are defined in @ref RCC_CLOCK_SOURCE_define.
 * 
 * @return None
 */
void MCAL_RCC_Select_Clock(uint8 clock){
    switch(clock){
    case RCC_SELECT_HSI:
        RCC->CR |= (1<<0);  // Enable internal 8 MHz RC oscillator
        while(!((RCC->CR >> 1) & 0x01U)); // Wait until internal clock is ready
        RCC->CFGR &= ~(0b11UL); // Select HSI as system clock
        while(0x00 != ((RCC->CFGR >> 2) & 0x03UL)); // Wait until HSI is the clock source
        RCC->CR &= ~(1UL<<16); // Disable HSE oscillator
        RCC->CR &= ~(1UL<<24); // Disable PLL
        break;
    case RCC_SELECT_HSE:
        RCC->CR |= (1<<16); // Enable HSE oscillator
        while(!((RCC->CR >> 17) & 0x01U)); // Wait until external clock is ready
        RCC->CFGR &= ~(0b11UL); // Clear previous clock selection
        RCC->CFGR |= 0x01UL; // Select HSE as system clock
        while(0x01 != ((RCC->CFGR >> 2) & 0x03UL)); // Wait until HSE is the clock source
        RCC->CR &= ~(1UL<<0); // Disable internal 8 MHz RC oscillator
        RCC->CR &= ~(1UL<<24); // Disable PLL
        break;
    case RCC_SELECT_PLL:
        /* TODO: Implement PLL Configuration */
        break;
    default: /* Do Nothing */ break;
    }
}

/**
 * @brief Enables the clock for a specific peripheral.
 * 
 * This function activates the clock for the specified peripheral to allow its operation.
 * 
 * @param[in] peripheral Peripheral to be enabled. Possible values are defined in @ref RCC_PERIPHERALS_define.
 * 
 * @return None
 */
void MCAL_RCC_Enable_Peripheral(uint8 peripheral){
    switch(peripheral){
    case RCC_GPIOA:  RCC->AHB1ENR |= (1<<0);  break;
    case RCC_GPIOB:  RCC->AHB1ENR |= (1<<1);  break;
    case RCC_GPIOC:  RCC->AHB1ENR |= (1<<2);  break;
    case RCC_GPIOD:  RCC->AHB1ENR |= (1<<3);  break;
    case RCC_GPIOE:  RCC->AHB1ENR |= (1<<4);  break;
    case RCC_USART1: RCC->APB2ENR |= (1<<4);  break;
    case RCC_USART2: RCC->APB1ENR |= (1<<17); break;
    case RCC_USART6: RCC->APB2ENR |= (1<<5);  break;
    case RCC_SPI1:   RCC->APB2ENR |= (1<<12); break;
    case RCC_SPI2:   RCC->APB1ENR |= (1<<14); break;
    case RCC_I2C1:   RCC->APB1ENR |= (1<<21); break;
    case RCC_I2C2:   RCC->APB1ENR |= (1<<22); break;
    case RCC_CRC:    RCC->AHB1ENR |= (1<<12); break;
    case RCC_TIM2:   RCC->APB1ENR |= (1<<0);  break;
    case RCC_SYSCFG: RCC->APB2ENR |= (1<<14); break;
    default: /* Do Nothing */ break;
    }
}

/**
 * @brief Resets a specific peripheral.
 * 
 * This function performs a reset operation on the specified peripheral.
 * 
 * @param[in] peripheral Peripheral to be reset. Possible values are defined in @ref RCC_PERIPHERALS_define.
 * 
 * @return None
 */
void MCAL_RCC_Reset_Peripheral(uint8 peripheral){
    switch(peripheral){
    case RCC_GPIOA:  RCC->AHB1RSTR |= (1<<0);  break;
    case RCC_GPIOB:  RCC->AHB1RSTR |= (1<<1);  break;
    case RCC_GPIOC:  RCC->AHB1RSTR |= (1<<2);  break;
    case RCC_GPIOD:  RCC->AHB1RSTR |= (1<<3);  break;
    case RCC_GPIOE:  RCC->AHB1RSTR |= (1<<4);  break;
    case RCC_USART1: RCC->APB2RSTR |= (1<<4);  break;
    case RCC_USART2: RCC->APB1RSTR |= (1<<17); break;
    case RCC_USART6: RCC->APB2RSTR |= (1<<5);  break;
    case RCC_SPI1:   RCC->APB2RSTR |= (1<<12); break;
    case RCC_SPI2:   RCC->APB1RSTR |= (1<<14); break;
    case RCC_I2C1:   RCC->APB1RSTR |= (1<<21); break;
    case RCC_I2C2:   RCC->APB1RSTR |= (1<<22); break;
    case RCC_CRC:    RCC->AHB1RSTR |= (1<<12); break;
    case RCC_TIM2:   RCC->APB1RSTR |= (1<<0);  break;
    case RCC_SYSCFG: RCC->APB2RSTR |= (1<<14); break;
    default: /* Do Nothing */ break;
    }
}

/**
 * @brief Retrieves the frequency of the system clock.
 * 
 * This function calculates and returns the frequency of the system clock (SYSCLK) in Hz.
 * 
 * @param[in] None
 * 
 * @return Frequency of the system clock in Hz.
 */
uint32 MCAL_RCC_GetSYS_CLKFreq(void){
    uint32 ret_val;
    switch((RCC->CFGR >> 2 & 0b11)){
    case 0:
        ret_val = HSI_RC_CLK;
        break;
    case 1:
        ret_val = HSE_CLK;
        break;
    case 2:
        /* TODO: Need to calculate the PLLCLK and PLLMUL and PLL Source MUX */
        ret_val = 16000000UL;
        break;
    default: ret_val = 0; break;
    }
    return ret_val;
}

/**
 * @brief Retrieves the frequency of the AHB bus clock.
 * 
 * This function calculates and returns the frequency of the AHB bus clock (HCLK) in Hz.
 * 
 * @param[in] None
 * 
 * @return Frequency of the AHB bus clock in Hz.
 */
uint32 MCAL_RCC_GetHCLKFreq(void){
    return (MCAL_RCC_GetSYS_CLKFreq() >> AHBPrescTable[((RCC->CFGR >> 4) & 0b111)]);
}

/**
 * @brief Retrieves the frequency of the APB1 bus clock.
 * 
 * This function calculates and returns the frequency of the APB1 bus clock (PCLK1) in Hz.
 * 
 * @param[in] None
 * 
 * @return Frequency of the APB1 bus clock in Hz.
 */
uint32 MCAL_RCC_GetPCLK1Freq(void){
    uint32_t pclk1, systemClk;
    uint8_t clksrc, temp, ahbp, apb1p;

    clksrc = ((RCC->CFGR >> RCC_CFGR_SWS) & 0x3);

    if (clksrc == 0)
    {
        systemClk = HSI_VALUE;
    }
    else if (clksrc == 1)
    {
        systemClk = HSE_VALUE;
    }
    else if (clksrc == 2)
    {
        systemClk = RCC_GetPLLOutputClock();
    }

    temp = ((RCC->CFGR >> RCC_CFGR_HPRE) & 0xF);

    if (temp < 8)
    {
        ahbp = 1;
    }
    else
    {
        ahbp = AHB_PreScaler[temp - 8];
    }

    temp = ((RCC->CFGR >> RCC_CFGR_PPRE1) & 0x7);

    if (temp < 4)
    {
        apb1p = 1;
    }
    else
    {
        apb1p = APB1_PreScaler[temp - 4];
    }

    pclk1 = (systemClk / ahbp) / apb1p;

    return pclk1;
}


/**
 * @brief Retrieves the frequency of the APB2 bus clock.
 * 
 * This function calculates and returns the frequency of the APB2 bus clock (PCLK2) in Hz.
 * 
 * @param[in] None
 * 
 * @return Frequency of the APB2 bus clock in Hz.
 */
uint32 MCAL_RCC_GetPCLK2Freq(void){
    uint32_t systemClock = 0, tmp, pclk2;
    uint8_t clkSrc = (RCC->CFGR >> RCC_CFGR_SWS) & 0X3;
    uint8_t ahbp, apb2p;

    if (clkSrc == 0)
    {
        systemClock = HSI_VALUE;
    }
    else
    {
        systemClock = HSE_VALUE;
    }

    tmp = (RCC->CFGR >> RCC_CFGR_HPRE) & 0xF;

    if (tmp < 0x08)
    {
        ahbp = 1;
    }
    else
    {
        ahbp = AHB_PreScaler[tmp - 8];
    }

    tmp = (RCC->CFGR >> RCC_CFGR_PPRE2) & 0x7;

    if (tmp < 0x04)
    {
        apb2p = 1;
    }
    else
    {
        apb2p = APB1_PreScaler[tmp - 4];
    }

    pclk2 = (systemClock / ahbp) / apb2p;

    return pclk2;
}



/**
 * @brief Get the frequency of the PLL (Phase-Locked Loop) output clock.
 *
 * This function calculates and returns the frequency of the PLL output clock.
 *
 * @return The PLL output clock frequency in Hertz.
 */
uint32_t RCC_GetPLLOutputClock(void)
{
    uint32_t pllInputFreq = 0;
    uint32_t plln = 0;
    uint32_t pllm = 0;
    uint32_t pllp = 0;

    // Read the PLL configuration settings from RCC_PLLCFGR register.
    plln = (RCC->PLLCFGR >> RCC_PLLCFGR_PLLN) & 0x1FFU;
    pllm = (RCC->PLLCFGR >> RCC_PLLCFGR_PLLM) & 0x3FU;
    pllp = ((RCC->PLLCFGR >> RCC_PLLCFGR_PLLP) & 0x3U) + 1;

    // Determine the PLL input frequency based on the oscillator source (HSE or HSI).
    if ((RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC_HSE) != 0)
    {
        // HSE is used as the PLL input source.
        pllInputFreq = HSE_VALUE;
    }
    else
    {
        // HSI is used as the PLL input source.
        pllInputFreq = HSI_VALUE;
    }

    // Calculate the PLL output frequency using the formula.
    uint32_t pllOutputFreq = (pllInputFreq * (plln + 1)) / ((pllm + 1) * (pllp * 2));

    return pllOutputFreq;
}
