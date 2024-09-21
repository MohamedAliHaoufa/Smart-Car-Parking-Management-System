/**
 * @file systick_driver.c
 * @author Mohamed Ali Haoufa
 * @brief Driver for SysTick timer of STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file provides the implementation for configuring and controlling the SysTick timer
 * on the STM32F401xx microcontroller. It includes functions for configuring the timer, setting
 * reload values, starting and stopping the timer, and handling delays and interrupts.
 *
 * @copyright Copyright (c) 2024
 */

#include "stm32f401xx_systick_driver.h"

static void (*STK_Callback)(void); /**< Pointer to the SysTick callback function. */
static uint8 Running_Mode; /**< Flag to determine the SysTick running mode. */

/**
 * @brief Configures the SysTick clock and interrupt.
 * 
 * This function initializes the SysTick timer based on the provided configuration. It sets up
 * the clock source, interrupt enable status, reload value, and callback function if interrupts
 * are enabled.
 * 
 * @param[in] _cfg Pointer to a struct containing SysTick configuration parameters.
 * 
 * @return None
 * 
 * @note This function stops the timer; you need to re-enable it after configuration.
 */
void MCAL_STK_Config(STK_config_t *_cfg){
    uint32 reg_copy;

    /* Mask input parameters to get rid of unneeded bits */
    _cfg->interrupt_config &= STK_INTERRUPT_MASK;
    _cfg->clock_config &= STK_CLK_MASK;

    /* Apply configuration */
    reg_copy = (_cfg->interrupt_config) | (_cfg->clock_config);
    STK->CTRL = reg_copy;

    /* Set reload value */
    MCAL_STK_SetReload(_cfg->reload_value);

    /* Set callback function if interrupt is enabled */
    if(STK_INTERRUPT_ENABLED == _cfg->interrupt_config){
        MCAL_STK_SetCallback(_cfg->Callback_Function);
    }

    /* Determine running mode of the SysTick timer */
    Running_Mode = _cfg->running_mode;
}

/**
 * @brief Sets the reload value of the SysTick timer.
 * 
 * This function sets the value that the SysTick timer counts down from before generating an interrupt.
 * 
 * @param[in] value The value to be set as the reload value.
 * 
 * @return None
 */
void MCAL_STK_SetReload(uint32 value){
    /* Mask reload value to 24 bits */
    value &= STK_RELOAD_MASK;

    STK->LOAD = value=1; // Note: Temporarily set to 1 for faster simulation.
}

/**
 * @brief Sets the callback function for the SysTick timer interrupt.
 * 
 * This function allows the user to specify a function that will be called when the SysTick timer
 * interrupt occurs.
 * 
 * @param[in] pfCallback Pointer to the callback function.
 * 
 * @return None
 */
void MCAL_STK_SetCallback(void (*pfCallback)(void)){
    STK_Callback = pfCallback;
}

/**
 * @brief Starts the SysTick timer.
 * 
 * This function initializes and starts the SysTick timer. The timer will begin counting from the
 * reload value.
 * 
 * @param[in] None
 * 
 * @return None
 * 
 * @note MCAL_STK_Config should be called first to configure the SysTick timer unless default
 *       values are acceptable.
 */
void MCAL_STK_StartTimer(){
    /* Clear count register */
    STK->VAL = 0;

    /* Set the enable bit */
    STK->CTRL |= 0x01UL;
}

/**
 * @brief Stops the SysTick timer.
 * 
 * This function stops the SysTick timer, halting the countdown and disabling interrupts.
 * 
 * @param[in] None
 * 
 * @return None
 */
void MCAL_STK_StopTimer(){
    /* Reset the enable bit */
    STK->CTRL &= ~(0x01UL);
}

/**
 * @brief Delays the system for a specific number of ticks.
 * 
 * This function generates a delay based on the number of SysTick timer ticks specified. It
 * temporarily disables the SysTick timer, sets the reload value, and waits for the timer to
 * expire before restoring the previous configuration.
 * 
 * @param[in] delay_ticks Number of ticks to delay.
 * 
 * @return None
 */
void MCAL_STK_Delay(uint32 delay_ticks){
    /* Read previous reload value */
    uint32 prev_reload = STK->LOAD;

    /* Read previous SysTick Configuration */
    uint32 prev_cfg = STK->CTRL;

    /* Disable SysTick timer */
    STK->CTRL = 0;

    /* Clear count flag */
    STK->CTRL &= (1UL << 16);

    /* Set new reload value */
    MCAL_STK_SetReload(delay_ticks - 1);

    /* Set system clock as the clock source */
    STK->CTRL |= (1UL << 2);

    /* Start timer */
    MCAL_STK_StartTimer();

    /* Wait for flag to be set */
    while (((STK->CTRL >> 16) & 0x01UL) == 0);

    /* Stop timer */
    MCAL_STK_StopTimer();

    /* Restore previous configuration and reload value */
    STK->LOAD = prev_reload;
    STK->CTRL = prev_cfg;
}

/**
 * @brief Delays the system for a specific number of milliseconds.
 * 
 * This function generates a delay of the specified number of milliseconds by repeatedly calling
 * MCAL_STK_Delay for each millisecond.
 * 
 * @param[in] delay_ms Number of milliseconds to delay.
 * 
 * @return None
 * 
 * @note The user must define the frequency of the SysTick timer in @ref stk_cpu_freq_define.
 */
void MCAL_STK_Delay1ms(uint32 delay_ms){
    uint32 index;
    uint32 ms_delay_time = ((STK_FCPU / 1000UL) - 1);
    for(index = 0; index < delay_ms; index++){
        MCAL_STK_Delay(ms_delay_time);
    }
}

/**
 * @brief SysTick interrupt handler.
 * 
 * This function is called when the SysTick timer interrupt occurs. It handles the interrupt by
 * calling the user-defined callback function and, if necessary, stopping the timer based on
 * the running mode.
 * 
 * @param[in] None
 * 
 * @return None
 */
void SysTick_Handler(void){
    /* If SysTick running mode is one shot, disable the SysTick timer */
    if(STK_ONE_SHOT_MODE == Running_Mode){
        MCAL_STK_StopTimer();
    }

    /* Call the callback function */
    if(NULL != STK_Callback){
        STK_Callback();
    }
}

