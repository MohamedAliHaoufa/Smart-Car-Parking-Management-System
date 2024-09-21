/**
 * @file Timer.c
 * @author Mohamed Ali Haoufa
 * @brief Timer driver for STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file contains the implementation of Timer2 initialization and utility functions for
 * delay generation in microseconds and milliseconds for the STM32F401xx microcontroller.
 *
 * @copyright Copyright (c) 2024
 */

#include "stm32f401xx_timer_driver.h"

/**
 * @brief Initializes Timer2 for delay generation.
 * 
 * This function configures Timer2 with a prescaler and auto-reload register to generate
 * interrupts at a specific interval. The timer is set to produce a delay of 50 milliseconds
 * based on the configured settings.
 * 
 * @param[in] None
 * 
 * @return None
 * 
 * @note The function enables the clock for Timer2, sets the prescaler to achieve a 1 MHz
 *       clock input, and configures the auto-reload register for a delay of 50 milliseconds.
 *       The timer is started, and the function waits until the timer's update interrupt flag
 *       is set.
 */
void Timer2_init(void)
{
    /* Enable the clock for Timer2 */
    RCC->APB1ENR |= (1 << 0);

    /* Configure Timer2 prescaler */
    TIM2->PSC = 7;  // Clock input = (8 MHz / (7 + 1)) = 1 MHz

    /* Set Timer2 auto-reload register to achieve a 50 ms delay */
    TIM2->ARR = 0xC350;  // (50000 ticks) * (1 ÃƒÅ½Ã‚Â¼s) = 0.05 s

    /* Start Timer2 */
    TIM2->CR1 |= (1 << 0);

    /* Wait until the update interrupt flag is set */
    while (!((TIM2->SR) & (1 << 0)));
}

/**
 * @brief Delays the system for a specified number of microseconds.
 * 
 * This function generates a delay by counting timer ticks for the specified number of
 * microseconds using Timer2. The timer is reset and counts up until the desired delay
 * duration is reached.
 * 
 * @param[in] us Number of microseconds to delay.
 * 
 * @return None
 */
void dus(int us)
{
    /* Reset Timer2 counter */
    TIM2->CNT = 0;

    /* Wait until the timer counts up to the specified microseconds */
    while (TIM2->CNT < us);
}

/**
 * @brief Delays the system for a specified number of milliseconds.
 * 
 * This function generates a delay by repeatedly calling the `dus` function for each millisecond
 * required. It effectively creates a delay by generating multiple microsecond delays.
 * 
 * @param[in] ms Number of milliseconds to delay.
 * 
 * @return None
 */
void dms(int ms)
{
    int i = 0;
    for (i = 0; i < ms; i++)
    {
        dus(1000);  // Delay for 1000 microseconds (1 millisecond)
    }
}

