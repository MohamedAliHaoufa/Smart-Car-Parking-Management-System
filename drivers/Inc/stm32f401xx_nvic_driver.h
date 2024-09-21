/**
 * @file stm32f401xx_nvic_driver.h
 * @author Mohamed Ali Haoufa
 * @brief Header file for NVIC (Nested Vectored Interrupt Controller) driver for STM32F401xx microcontroller.
 * @version 0.1
 * @date 2024-09-21
 *
 * This header file provides definitions, macros, and function prototypes for interacting with the
 * NVIC of the STM32F401xx microcontroller. It includes functions for configuring interrupt priority,
 * enabling/disabling interrupts, and managing interrupt status.
 *
 * @copyright Copyright (c) 2024
 *
 */

#ifndef INC_STM32F401XX_NVIC_DRIVER_H_
#define INC_STM32F401XX_NVIC_DRIVER_H_

/**
 * @defgroup NVIC_Driver NVIC Driver
 * @brief NVIC driver APIs for STM32F401xx MCU.
 * @{
 */

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx.h"

//----------------------------------------------
// Section: Macros
//----------------------------------------------

/**
 * @defgroup NVIC_Register_Definitions NVIC Register Definitions
 * @brief Macros for accessing NVIC registers.
 * @{
 */

/** @brief Interrupt Set Enable Register 0 (ISER0)
 *  Used to enable interrupts 0 to 31.
 *  Write a 1 to the corresponding bit position to enable an interrupt.
 */
#define NVIC_ISER0    (*(volatile uint32_t *)(NVIC_BASE + 0x0))

/** @brief Interrupt Set Enable Register 1 (ISER1)
 *  Used to enable interrupts 32 to 63.
 *  Write a 1 to the corresponding bit position to enable an interrupt.
 */
#define NVIC_ISER1    (*(volatile uint32_t *)(NVIC_BASE + 0x4))

/** @brief Interrupt Set Enable Register 2 (ISER2)
 *  Used to enable interrupts 64 to 95.
 *  Write a 1 to the corresponding bit position to enable an interrupt.
 */
#define NVIC_ISER2    (*(volatile uint32_t *)(NVIC_BASE + 0x8))

/** @brief Interrupt Clear Enable Register 0 (ICER0)
 *  Used to disable interrupts 0 to 31.
 *  Write a 1 to the corresponding bit position to disable an interrupt.
 */
#define NVIC_ICER0    (*(volatile uint32_t *)(NVIC_BASE + 0x80))

/** @brief Interrupt Clear Enable Register 1 (ICER1)
 *  Used to disable interrupts 32 to 63.
 *  Write a 1 to the corresponding bit position to disable an interrupt.
 */
#define NVIC_ICER1    (*(volatile uint32_t *)(NVIC_BASE + 0x84))

/** @brief Interrupt Clear Enable Register 2 (ICER2)
 *  Used to disable interrupts 64 to 95.
 *  Write a 1 to the corresponding bit position to disable an interrupt.
 */
#define NVIC_ICER2    (*(volatile uint32_t *)(NVIC_BASE + 0x88))

/** @} */  // End of NVIC_Register_Definitions

/** @defgroup NVIC_Macros NVIC Configuration Macros
 * @{
 */

/** @brief Vector key for setting priority grouping in NVIC */
#define SCB_VECTKEY                  0x05FA0000UL

/** @brief Mask for vector key */
#define SCB_VECTKEY_MASK             0xFFFF0000UL

/** @brief Mask for setting NVIC priority grouping */
#define NVIC_PRIGROUP_SET_MASK       0x700UL

/** @brief Mask for clearing NVIC priority grouping */
#define NVIC_PRIGROUP_CLEAR_MASK     0xFFFFF8FFUL

/** @} NVIC_Macros */

/** @defgroup NVIC_Interrupt_Status Interrupt Status
 * @{
 */

/** @brief Status indicating an active interrupt */
#define NVIC_INTERRUPT_ACTIVE        1UL

/** @brief Status indicating an inactive interrupt */
#define NVIC_INTERRUPT_INACTIVE      0UL

/** @} NVIC_Interrupt_Status */

/** @defgroup NVIC_Priority_Groups Priority Groups
 * @{
 */

/** @brief Priority grouping configuration for 16 groups and 0 subgroups */
#define NVIC_PRIO_16GRP_0SUBGRP      0x300U

/** @brief Priority grouping configuration for 8 groups and 2 subgroups */
#define NVIC_PRIO_8GRP_2SUBGRP       0x400U

/** @brief Priority grouping configuration for 4 groups and 4 subgroups */
#define NVIC_PRIO_4GRP_4SUBGRP       0x500U

/** @brief Priority grouping configuration for 2 groups and 8 subgroups */
#define NVIC_PRIO_2GRP_8SUBGRP       0x600U

/** @brief Priority grouping configuration for 0 groups and 8 subgroups */
#define NVIC_PRIO_0GRP_8SUBGRP       0x700U

/** @} NVIC_Priority_Groups */

/** @defgroup NVIC_Interrupt_Priorities Interrupt Priorities
 * @{
 */

/** @brief Priority level 0 */
#define NVIC_PRIO_0000              0x00U

/** @brief Priority level 1 */
#define NVIC_PRIO_0001              0x10U

/** @brief Priority level 2 */
#define NVIC_PRIO_0010              0x20U

/** @brief Priority level 3 */
#define NVIC_PRIO_0011              0x30U

/** @brief Priority level 4 */
#define NVIC_PRIO_0100              0x40U

/** @brief Priority level 5 */
#define NVIC_PRIO_0101              0x50U

/** @brief Priority level 6 */
#define NVIC_PRIO_0110              0x60U

/** @brief Priority level 7 */
#define NVIC_PRIO_0111              0x70U

/** @brief Priority level 8 */
#define NVIC_PRIO_1000              0x80U

/** @brief Priority level 9 */
#define NVIC_PRIO_1001              0x90U

/** @brief Priority level 10 */
#define NVIC_PRIO_1010              0xA0U

/** @brief Priority level 11 */
#define NVIC_PRIO_1011              0xB0U

/** @brief Priority level 12 */
#define NVIC_PRIO_1100              0xC0U

/** @brief Priority level 13 */
#define NVIC_PRIO_1101              0xD0U

/** @brief Priority level 14 */
#define NVIC_PRIO_1110              0xE0U

/** @brief Priority level 15 */
#define NVIC_PRIO_1111              0xF0U

/** @} NVIC_Interrupt_Priorities */

/** @defgroup NVIC_Interrupt_Requests Interrupt Requests
 * @{
 */

/** @brief External Interrupt Request 0 */
#define EXTI0_IRQ                    6

/** @brief External Interrupt Request 1 */
#define EXTI1_IRQ                    7

/** @brief External Interrupt Request 2 */
#define EXTI2_IRQ                    8

/** @brief External Interrupt Request 3 */
#define EXTI3_IRQ                    9

/** @brief External Interrupt Request 4 */
#define EXTI4_IRQ                    10

/** @brief External Interrupt Request 5 */
#define EXTI5_IRQ                    23

/** @brief External Interrupt Request 6 */
#define EXTI6_IRQ                    23

/** @brief External Interrupt Request 7 */
#define EXTI7_IRQ                    23

/** @brief External Interrupt Request 8 */
#define EXTI8_IRQ                    23

/** @brief External Interrupt Request 9 */
#define EXTI9_IRQ                    23

/** @brief External Interrupt Request 10 */
#define EXTI10_IRQ                   40

/** @brief External Interrupt Request 11 */
#define EXTI11_IRQ                   40

/** @brief External Interrupt Request 12 */
#define EXTI12_IRQ                   40

/** @brief External Interrupt Request 13 */
#define EXTI13_IRQ                   40

/** @brief External Interrupt Request 14 */
#define EXTI14_IRQ                   40

/** @brief External Interrupt Request 15 */
#define EXTI15_IRQ                   40

/** @brief USART1 Interrupt Request */
#define USART1_IRQ                   37

/** @brief USART2 Interrupt Request */
#define USART2_IRQ                   38

/** @brief USART6 Interrupt Request */
#define USART6_IRQ                   71

/** @brief SPI1 Interrupt Request */
#define SPI1_IRQ                     35

/** @brief SPI2 Interrupt Request */
#define SPI2_IRQ                     36

/** @brief I2C1 Event Interrupt Request */
#define I2C1_EV_IRQ                  31

/** @brief I2C1 Error Interrupt Request */
#define I2C1_ER_IRQ                  32

/** @brief I2C2 Event Interrupt Request */
#define I2C2_EV_IRQ                  33

/** @brief I2C2 Error Interrupt Request */
#define I2C2_ER_IRQ                  34

/** @} NVIC_Interrupt_Requests */

/**
 * @defgroup NVIC_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Set the priority grouping for the NVIC.
 * @param priority_grouping Priority grouping configuration as defined in @ref NVIC_Priority_Groups
 * @return None
 */
void MCAL_NVIC_SetPriorityGrouping(uint32 priority_grouping);

/**
 * @brief Get the current priority grouping configuration of the NVIC.
 * @return Current priority grouping configuration as defined in @ref NVIC_Priority_Groups
 */
uint32 MCAL_NVIC_GetPriorityGrouping(void);

/**
 * @brief Enable a specified IRQ.
 * @param IRQn IRQ number to enable as defined in @ref NVIC_Interrupt_Requests
 * @return None
 */
void MCAL_NVIC_EnableIRQ(uint8 IRQn);

/**
 * @brief Disable a specified IRQ.
 * @param IRQn IRQ number to disable as defined in @ref NVIC_Interrupt_Requests
 * @return None
 */
void MCAL_NVIC_DisableIRQ(uint8 IRQn);

/**
 * @brief Get the pending status of a specified IRQ.
 * @param IRQn IRQ number to check as defined in @ref NVIC_Interrupt_Requests
 * @return 1 if IRQ is pending, 0 otherwise
 */
uint8 MCAL_NVIC_GetPendingIRQ(uint8 IRQn);

/**
 * @brief Set the pending status of a specified IRQ.
 * @param IRQn IRQ number to set as pending as defined in @ref NVIC_Interrupt_Requests
 * @return None
 */
void MCAL_NVIC_SetPendingIRQ(uint8 IRQn);

/**
 * @brief Clear the pending status of a specified IRQ.
 * @param IRQn IRQ number to clear pending status as defined in @ref NVIC_Interrupt_Requests
 * @return None
 */
void MCAL_NVIC_ClearPendingIRQ(uint8 IRQn);

/**
 * @brief Get the active status of a specified IRQ.
 * @param IRQn IRQ number to check as defined in @ref NVIC_Interrupt_Requests
 * @return 1 if IRQ is active, 0 otherwise
 */
uint8 MCAL_NVIC_GetActive(uint8 IRQn);

/**
 * @brief Set the priority of a specified IRQ.
 * @param IRQn IRQ number for which to set the priority as defined in @ref NVIC_Interrupt_Requests
 * @param priority Priority level to set as defined in @ref NVIC_Interrupt_Priorities
 * @return None
 */
void MCAL_NVIC_SetPriority(uint8 IRQn, uint8 priority);

/**
 * @brief Retrieves the priority level of a specified IRQn.
 * 
 * This function reads the priority level assigned to the interrupt request number (IRQn).
 * The priority value returned should be one of the defined values in @ref Interrupt_Priorities_define.
 *
 * @param [in] IRQn The interrupt request number as defined in the vector table or in @ref Interrupt_Requests_Numbers_define.
 * @param [out] None
 * @return uint8 The priority value for the specified IRQn.
 * 
 * @note None
 */
uint8 MCAL_NVIC_GetPriority(uint8 IRQn);

/**
 * @brief Performs a system reset.
 * 
 * This function resets the entire system. It does not alter the priority grouping configuration.
 *
 * @param [in] None
 * @param [out] None
 * @return None
 * 
 * @note The priority groups remain unchanged after the system reset.
 */
void MCAL_NVIC_SystemReset(void);
/** @} */




//-*-*-*-*-*-*-*-*-*-*-*-
// NVIC IRQ Enable/Disable Macro
//-*-*-*-*-*-*-*-*-*-*-*

/**
 * @defgroup NVIC_IRQ_Enable_Disable NVIC IRQ Enable/Disable Macros
 * @brief Macros for enabling and disabling NVIC IRQ for different peripherals.
 * @{
 * 
 * These macros are used to enable or disable NVIC IRQ for EXTI, USART, SPI, and I2C peripherals.
 */

/**< Enable EXTI Line 0 interrupt (set bit 6 in NVIC_ISER0 register). */
#define NVIC_IRQ6_EXTI0_Enable              (NVIC_ISER0 |= (1<<6))

/**< Enable EXTI Line 1 interrupt (set bit 7 in NVIC_ISER0 register). */
#define NVIC_IRQ7_EXTI1_Enable              (NVIC_ISER0 |= (1<<7))

/**< Enable EXTI Line 2 interrupt (set bit 8 in NVIC_ISER0 register). */
#define NVIC_IRQ8_EXTI2_Enable              (NVIC_ISER0 |= (1<<8))

/**< Enable EXTI Line 3 interrupt (set bit 9 in NVIC_ISER0 register). */
#define NVIC_IRQ9_EXTI3_Enable              (NVIC_ISER0 |= (1<<9))

/**< Enable EXTI Line 4 interrupt (set bit 10 in NVIC_ISER0 register). */
#define NVIC_IRQ10_EXTI4_Enable             (NVIC_ISER0 |= (1<<10))

/**< Enable EXTI Line 5 to 9 interrupt (set bit 23 in NVIC_ISER0 register). */
#define NVIC_IRQ23_EXTI5_9_Enable           (NVIC_ISER0 |= (1<<23))

/**< Enable EXTI Line 10 to 15 interrupt (set bit 8 in NVIC_ISER1 register). */
#define NVIC_IRQ40_EXTI10_15_Enable         (NVIC_ISER1 |= (1<<8))

/**< Disable EXTI Line 0 interrupt (clear bit 6 in NVIC_ICER0 register). */
#define NVIC_IRQ6_EXTI0_Disable             (NVIC_ICER0 |= (1<<6))

/**< Disable EXTI Line 1 interrupt (clear bit 7 in NVIC_ICER0 register). */
#define NVIC_IRQ7_EXTI1_Disable             (NVIC_ICER0 |= (1<<7))

/**< Disable EXTI Line 2 interrupt (clear bit 8 in NVIC_ICER0 register). */
#define NVIC_IRQ8_EXTI2_Disable             (NVIC_ICER0 |= (1<<8))

/**< Disable EXTI Line 3 interrupt (clear bit 9 in NVIC_ICER0 register). */
#define NVIC_IRQ9_EXTI3_Disable             (NVIC_ICER0 |= (1<<9))

/**< Disable EXTI Line 4 interrupt (clear bit 10 in NVIC_ICER0 register). */
#define NVIC_IRQ10_EXTI4_Disable            (NVIC_ICER0 |= (1<<10))

/**< Disable EXTI Line 5 to 9 interrupt (clear bit 23 in NVIC_ICER0 register). */
#define NVIC_IRQ23_EXTI5_9_Disable          (NVIC_ICER0 |= (1<<23))

/**< Disable EXTI Line 10 to 15 interrupt (clear bit 8 in NVIC_ICER1 register). */
#define NVIC_IRQ40_EXTI10_15_Disable        (NVIC_ICER1 |= (1<<8))

// USART

/**< Enable USART1 interrupt (set bit in NVIC_ISER1 for USART1 IRQ). */
#define NVIC_IRQ37_USART1_Enable            (NVIC_ISER1 |= 1<<(USART1_IRQ - 32))

/**< Enable USART2 interrupt (set bit in NVIC_ISER1 for USART2 IRQ). */
#define NVIC_IRQ38_USART2_Enable            (NVIC_ISER1 |= 1<<(USART2_IRQ - 32))

/**< Enable USART3 interrupt (set bit in NVIC_ISER1 for USART3 IRQ). */
#define NVIC_IRQ39_USART3_Enable            (NVIC_ISER1 |= 1<<(USART3_IRQ - 32))

/**< Disable USART1 interrupt (clear bit in NVIC_ICER1 for USART1 IRQ). */
#define NVIC_IRQ37_USART1_Disable           (NVIC_ICER1 |= 1<<(USART1_IRQ - 32))

/**< Disable USART2 interrupt (clear bit in NVIC_ICER1 for USART2 IRQ). */
#define NVIC_IRQ38_USART2_Disable           (NVIC_ICER1 |= 1<<(USART2_IRQ - 32))

/**< Disable USART3 interrupt (clear bit in NVIC_ICER1 for USART3 IRQ). */
#define NVIC_IRQ39_USART3_Disable           (NVIC_ICER1 |= 1<<(USART3_IRQ - 32))

// SPI

/**< Enable SPI1 interrupt (set bit in NVIC_ISER1 for SPI1 IRQ). */
#define NVIC_IRQ35_SPI1_Enable              (NVIC_ISER1 |= 1<<(SPI1_IRQ - 32))

/**< Enable SPI2 interrupt (set bit in NVIC_ISER1 for SPI2 IRQ). */
#define NVIC_IRQ36_SPI2_Enable              (NVIC_ISER1 |= 1<<(SPI2_IRQ - 32))

/**< Disable SPI1 interrupt (clear bit in NVIC_ICER1 for SPI1 IRQ). */
#define NVIC_IRQ35_SPI1_Disable             (NVIC_ICER1 &= ~(1<<(SPI1_IRQ - 32)))

/**< Disable SPI2 interrupt (clear bit in NVIC_ICER1 for SPI2 IRQ). */
#define NVIC_IRQ36_SPI2_Disable             (NVIC_ICER1 &= ~(1<<(SPI2_IRQ - 32)))

// I2C

/**< Enable I2C1 event interrupt (set bit in NVIC_ISER0 for I2C1_EV_IRQ). */
#define NVIC_IRQ31_I2C1_EV_Enable           (NVIC_ISER0 |= 1<<(I2C1_EV_IRQ))

/**< Enable I2C1 error interrupt (set bit in NVIC_ISER1 for I2C1_ER_IRQ). */
#define NVIC_IRQ32_I2C1_ER_Enable           (NVIC_ISER1 |= 1<<(I2C1_ER_IRQ - 32))

/**< Enable I2C2 event interrupt (set bit in NVIC_ISER1 for I2C2_EV_IRQ). */
#define NVIC_IRQ33_I2C2_EV_Enable           (NVIC_ISER1 |= 1<<(I2C2_EV_IRQ - 32))

/**< Enable I2C2 error interrupt (set bit in NVIC_ISER1 for I2C2_ER_IRQ). */
#define NVIC_IRQ34_I2C2_ER_Enable           (NVIC_ISER1 |= 1<<(I2C2_ER_IRQ - 32))

/**< Disable I2C1 event interrupt (clear bit in NVIC_ICER0 for I2C1_EV_IRQ). */
#define NVIC_IRQ31_I2C1_EV_Disable          (NVIC_ICER0 &= ~(1<<(I2C1_EV_IRQ)))

/**< Disable I2C1 error interrupt (clear bit in NVIC_ICER1 for I2C1_ER_IRQ). */
#define NVIC_IRQ32_I2C1_ER_Disable          (NVIC_ICER1 &= ~(1<<(I2C1_ER_IRQ - 32)))

/**< Disable I2C2 event interrupt (clear bit in NVIC_ICER1 for I2C2_EV_IRQ). */
#define NVIC_IRQ33_I2C2_EV_Disable          (NVIC_ICER1 &= ~(1<<(I2C2_EV_IRQ - 32)))

/**< Disable I2C2 error interrupt (clear bit in NVIC_ICER1 for I2C2_ER_IRQ). */
#define NVIC_IRQ34_I2C2_ER_Disable          (NVIC_ICER1 &= ~(1<<(I2C2_ER_IRQ - 32)))
/** @} */

/** @} */

#endif /* INC_STM32F401XX_NVIC_DRIVER_H_ */

