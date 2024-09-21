/**
 * @file NVIC_driver.c
 * @author Mohamed Ali Haoufa
 * @brief Driver for the Nested Vectored Interrupt Controller (NVIC) of the STM32F401xx microcontroller.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file provides functions for configuring and managing the NVIC of the STM32F401xx microcontroller.
 * It includes setting and getting priority grouping, enabling and disabling interrupts, 
 * and handling pending and active interrupt requests.
 *
 * @copyright Copyright (c) 2024
 *
 */

#include "stm32f401xx_nvic_driver.h"

/**
 * @brief Sets the priority grouping configuration for the NVIC.
 * @param priority_grouping Configuration of priority grouping as defined in @ref priority_groups_define.
 * @return None
 * @note None
 */
void MCAL_NVIC_SetPriorityGrouping(uint32 priority_grouping){
    uint32 reg_value;

    /* Ensure only bits 8-10 are set */
    priority_grouping &= NVIC_PRIGROUP_SET_MASK;

    /* Retrieve current register value */
    reg_value = SCB->AIRCR;

    /* Toggle VECTKEYSTAT to VECTKEY */
    reg_value ^= SCB_VECTKEY_MASK;

    /* Clear previous priority grouping configuration */
    reg_value &= NVIC_PRIGROUP_CLEAR_MASK;

    /* Apply new priority grouping configuration */
    reg_value |= priority_grouping;

    /* Write updated value back to register */
    SCB->AIRCR = reg_value;
}

/**
 * @brief Retrieves the current priority grouping configuration.
 * @return Configuration of priority grouping as defined in @ref priority_groups_define.
 * @note None
 */
uint32 MCAL_NVIC_GetPriorityGrouping(void){
    return ((SCB->AIRCR & NVIC_PRIGROUP_SET_MASK) >> 8);
}

/**
 * @brief Enables a specific interrupt request.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return None
 * @note None
 */
void MCAL_NVIC_EnableIRQ(uint8 IRQn){
    /* Determine the appropriate ISER register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    NVIC->ISER[reg_index] = (1U << IRQ_index);
}

/**
 * @brief Disables a specific interrupt request.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return None
 * @note None
 */
void MCAL_NVIC_DisableIRQ(uint8 IRQn){
    /* Determine the appropriate ICER register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    NVIC->ICER[reg_index] = (1U << IRQ_index);
}

/**
 * @brief Checks if a specific interrupt request is pending.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return 1 if IRQn is pending, 0 otherwise.
 * @note None
 */
uint8 MCAL_NVIC_GetPendingIRQ(uint8 IRQn){
    uint8 ret_val;
    
    /* Determine the appropriate ISPR register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    ret_val = ((NVIC->ISPR[reg_index] >> IRQ_index) & 0x01UL);
    return ret_val;
}

/**
 * @brief Sets a specific interrupt request as pending.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return None
 * @note None
 */
void MCAL_NVIC_SetPendingIRQ(uint8 IRQn){
    /* Determine the appropriate ISPR register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    NVIC->ISPR[reg_index] |= (1UL << IRQ_index);
}

/**
 * @brief Clears the pending status of a specific interrupt request.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return None
 * @note None
 */
void MCAL_NVIC_ClearPendingIRQ(uint8 IRQn){
    /* Determine the appropriate ICPR register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    NVIC->ICPR[reg_index] |= (1U << IRQ_index);
}

/**
 * @brief Checks if a specific interrupt request is active.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return 1 if IRQn is active, 0 otherwise.
 * @note None
 */
uint8 MCAL_NVIC_GetActive(uint8 IRQn){
    uint8 ret_val;

    /* Determine the appropriate IABR register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    if (NVIC->IABR[reg_index] & (0x01UL << IRQ_index)) {
        ret_val = NVIC_INTERRUPT_ACTIVE;
    } else {
        ret_val = NVIC_INTERRUPT_INACTIVE;
    }

    return ret_val;
}

/**
 * @brief Sets the priority of a specific interrupt request.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @param priority Priority level of the interrupt as defined in @ref Interrupt_Priorities_define.
 * @return None
 * @note None
 */
void MCAL_NVIC_SetPriority(uint8 IRQn, uint8 priority){
    /* Determine the appropriate IPR register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    NVIC->IP[(4 * reg_index + IRQ_index)] = priority;
}

/**
 * @brief Retrieves the priority of a specific interrupt request.
 * @param IRQn Number of interrupt request as defined in vector table or in @ref Interrupt_Requests_Numbers_define.
 * @return Priority level of the interrupt.
 * @note None
 */
uint8 MCAL_NVIC_GetPriority(uint8 IRQn){
    /* Determine the appropriate IPR register */
    uint8 reg_index = IRQn / 32;

    /* Calculate IRQn within the register */
    uint8 IRQ_index = IRQn % 32;

    return NVIC->IP[(4 * reg_index + IRQ_index)];
}

/**
 * @brief Performs a system reset.
 * @param None
 * @return None
 * @note Keeps priority grouping configuration unchanged.
 */
void MCAL_NVIC_SystemReset(void){
    SCB->AIRCR = SCB_VECTKEY | (SCB->AIRCR & NVIC_PRIGROUP_SET_MASK) | (1UL << 2);

    /* Wait indefinitely until reset occurs */
    while(1);
}

