/**
 * @file stm32f401xx_gpio_driver.c
 * @author Mohamed Ali Haoufa
 * @brief GPIO driver for STM32F401xx microcontroller.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file contains the implementations for GPIO operations for the STM32F401xx microcontroller.
 * It includes initialization, de-initialization, and basic operations for GPIO pins and ports.
 *
 * @copyright Copyright (c) 2024
 *
 */

#include "stm32f401xx_gpio_driver.h"

/**
 * @brief Initializes the specified GPIO pin according to the provided configuration.
 * 
 * This function sets up the GPIO pin mode, output type, speed, pull-up/pull-down resistors,
 * and alternate function if needed.
 * 
 * @param[in] GPIOx        The GPIO peripheral to be initialized (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * @param[in] PinConfig    Pointer to a GPIO_PinConfig_t structure containing the configuration details for the pin.
 * 
 * @return None
 * 
 * @note It is mandatory to enable the RCC clock for the corresponding GPIO port before initialization.
 */
void MCAL_GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_PinConfig_t *PinConfig) {
    uint8 PinNumber = PinConfig->GPIO_PinNumber;

    // Configure GPIO Mode (MODER register)
    if (PinConfig->GPIO_MODE <= GPIO_MODE_ANALOG) {
        GPIOx->MODER &= ~(0x3 << (PinNumber * 2));  // Clear the 2 bits for the pin
        GPIOx->MODER |= (PinConfig->GPIO_MODE << (PinNumber * 2));  // Set the new mode
    } else {
        // Configure interrupt mode (EXTI registers)
        if (PinConfig->GPIO_MODE == GPIO_MODE_IT_FT) {
            EXTI->FTSR |=  (1 << PinNumber);
            EXTI->RTSR &= ~(1 << PinNumber);
        } else if (PinConfig->GPIO_MODE == GPIO_MODE_IT_RT) {
            EXTI->RTSR |=  (1 << PinNumber);
            EXTI->FTSR &= ~(1 << PinNumber);
        } else if (PinConfig->GPIO_MODE == GPIO_MODE_IT_RFT) {
            EXTI->FTSR |=  (1 << PinNumber);
            EXTI->RTSR |=  (1 << PinNumber);
        }

        // Configure GPIO port selection (SYSCFG_EXTICR register)
        uint32 temp1 = PinNumber / 4;
        uint16 temp2 = (uint16)(PinNumber % 4);
        uint16 portcode = GPIO_BASEADDR_TO_CODE(GPIOx);
        MCAL_RCC_Enable_Peripheral(RCC_SYSCFG);
        SYSCFG->EXTICR[temp1] = (uint32)portcode << (4 * temp2);

        // Enable EXTI interrupt delivery (IMR register)
        EXTI->IMR |=  (1 << PinNumber);
    }

    // Configure output type (OTYPER register)
    GPIOx->OTYPER &= ~(0x1 << PinNumber);  // Clear the bit for the pin
    GPIOx->OTYPER |= (PinConfig->GPIO_PinOPType << PinNumber);  // Set the output type

    // Configure GPIO Speed (OSPEEDR register)
    GPIOx->OSPEEDR &= ~(0x3 << (PinNumber * 2));  // Clear the 2 bits for the pin
    GPIOx->OSPEEDR |= (PinConfig->GPIO_PinSpeed << (PinNumber * 2));  // Set the speed

    // Configure Pull-up/Pull-down resistors (PUPDR register)
    GPIOx->PUPDR &= ~(0x3 << (PinNumber * 2));  // Clear the 2 bits for the pin
    GPIOx->PUPDR |= (PinConfig->GPIO_PinPuPdControl << (PinNumber * 2));  // Set the pull-up/pull-down resistor

    // Configure Alternate Function (AFR register) if needed
    if (PinConfig->GPIO_MODE == GPIO_MODE_ALTFN) {
        if (PinNumber < 8) {
            GPIOx->AFR[0] &= ~(0xF << (PinNumber * 4));  // Clear the 4 bits for the pin
            GPIOx->AFR[0] |= (PinConfig->GPIO_PinAltFunMode << (PinNumber * 4));  // Set the alternate function
        } else {
            GPIOx->AFR[1] &= ~(0xF << ((PinNumber - 8) * 4));  // Clear the 4 bits for the pin
            GPIOx->AFR[1] |= (PinConfig->GPIO_PinAltFunMode << ((PinNumber - 8) * 4));  // Set the alternate function
        }
    }
}

/**
 * @brief Resets the specified GPIO port.
 * 
 * This function resets the GPIO port by toggling the appropriate reset bit in the RCC_AHB1RSTR register.
 * 
 * @param[in] GPIOx        The GPIO peripheral to be reset (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * 
 * @return None
 * 
 * @note None
 */
void MCAL_GPIO_DeInit(GPIO_TypeDef *GPIOx) {
    if (GPIOx == GPIOA) {
        RCC->AHB1RSTR |= (1 << 0);
        RCC->AHB1RSTR &= ~(1 << 0);
    } else if (GPIOx == GPIOB) {
        RCC->AHB1RSTR |= (1 << 1);
        RCC->AHB1RSTR &= ~(1 << 1);
    } else if (GPIOx == GPIOC) {
        RCC->AHB1RSTR |= (1 << 2);
        RCC->AHB1RSTR &= ~(1 << 2);
    } else if (GPIOx == GPIOD) {
        RCC->AHB1RSTR |= (1 << 3);
        RCC->AHB1RSTR &= ~(1 << 3);
    } else if (GPIOx == GPIOE) {
        RCC->AHB1RSTR |= (1 << 4);
        RCC->AHB1RSTR &= ~(1 << 4);
    }
}

/**
 * @brief Reads the value of a specific GPIO pin.
 * 
 * This function reads the input data register to retrieve the value of the specified GPIO pin.
 * 
 * @param[in] GPIOx        The GPIO peripheral from which to read (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * @param[in] PinNumber    The pin number to be read (e.g., GPIO_PIN_0, GPIO_PIN_1, etc.).
 * 
 * @return The value of the specified pin (0 or 1).
 * 
 * @note None
 */
uint8 MCAL_GPIO_ReadPin(GPIO_TypeDef *GPIOx, uint16 PinNumber) {
    uint8_t value;
    value = (uint8_t)(((GPIOx->IDR) >> PinNumber) & 0x00000001);
    return value;  // 0 or 1
}

/**
 * @brief Reads the value of a specific GPIO port.
 * 
 * This function reads the input data register to retrieve the value of all the pins in the specified GPIO port.
 * 
 * @param[in] GPIOx        The GPIO peripheral from which to read (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * 
 * @return The value of the entire port.
 * 
 * @note None
 */
uint16 MCAL_GPIO_ReadPort(GPIO_TypeDef *GPIOx) {
    uint16 port_value = (uint16)GPIOx->IDR;
    return port_value;
}

/**
 * @brief Writes a value to a specific GPIO pin.
 * 
 * This function sets or clears the specified GPIO pin according to the provided value.
 * 
 * @param[in] GPIOx        The GPIO peripheral to which to write (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * @param[in] PinNumber    The pin number to be written (e.g., GPIO_PIN_0, GPIO_PIN_1, etc.).
 * @param[in] Value        The value to be written (either GPIO_PIN_SET or GPIO_PIN_RESET).
 * 
 * @return None
 * 
 * @note None
 */
void MCAL_GPIO_WritePin(GPIO_TypeDef *GPIOx, uint16 PinNumber, uint8 Value) {
    if (Value != GPIO_PIN_RESET) {
        GPIOx->ODR |= (uint32_t)(1 << PinNumber);
    } else {
        GPIOx->ODR &= ~(uint32_t)(1 << PinNumber);
    }
}

/**
 * @brief Writes a value to the entire GPIO port.
 * 
 * This function sets the output data register of the specified GPIO port to the provided value.
 * 
 * @param[in] GPIOx        The GPIO peripheral to which to write (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * @param[in] Value        The value to be written to the entire port.
 * 
 * @return None
 * 
 * @note None
 */
void MCAL_GPIO_WritePort(GPIO_TypeDef *GPIOx, uint16 Value) {
    GPIOx->ODR = (uint32)Value;
}

/**
 * @brief Toggles the value of a specific GPIO pin.
 * 
 * This function inverts the state of the specified GPIO pin.
 * 
 * @param[in] GPIOx        The GPIO peripheral to which to write (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * @param[in] PinNumber    The pin number to be toggled (e.g., GPIO_PIN_0, GPIO_PIN_1, etc.).
 * 
 * @return None
 * 
 * @note None
 */
void MCAL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint16 PinNumber) {
    GPIOx->ODR ^= (1 << PinNumber);
}

/**
 * @brief Toggles the value of a specific GPIO Port.
 * 
 * This function inverts the state of the specified GPIO Port.
 * 
 * @param[in] GPIOx        The GPIO peripheral to which to write (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * 
 * @return None
 * 
 * @note None
 */
void MCAL_GPIO_TogglePort(GPIO_TypeDef *GPIOx){
 GPIOx->ODR ^= (uint32)((0xFFFF)<<0);
}

/**
 * @brief Locks the configuration of a specific GPIO pin.
 * 
 * This function implements a locking mechanism to prevent further changes to the configuration of a specified GPIO pin.
 * The locking sequence must be followed to successfully lock the pin configuration.
 * 
 * @param[in] GPIOx        The GPIO peripheral to be used (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * @param[in] PinNumber    The pin number to be locked, specified according to @ref GPIO_PINS_define.
 * 
 * @retval uint8           Returns `GPIO_RETURN_LOCK_OK` if the pin configuration is successfully locked, or `GPIO_RETURN_LOCK_ERROR` if the locking process fails.
 * 
 * @note The locking sequence is as follows:
 * - Write 1 to the lock key bit.
 * - Write 0 to the lock key bit.
 * - Write 1 to the lock key bit.
 * - Read the lock key bit (should be 0).
 * - Optionally, read the lock key bit again (should be 1 to confirm the lock).
 * 
 * The value of the lock bits (LCK[15:0]) must not change during this sequence, otherwise, the lock process will be aborted.
 */
uint8 MCAL_GPIO_LockPin(GPIO_TypeDef *GPIOx, uint16 PinNumber) {
    /* Lock key writing sequence:
       1. Write 1 to LCKR[16]
       2. Write 0 to LCKR[15:0]
       3. Write 1 to LCKR[16]
       4. Read LCKR to confirm
    */
    volatile uint32 temp = (1 << 16) | PinNumber;

    // Step 1: Write 1 to LCKR[16]
    GPIOx->LCKR = temp;

    // Step 2: Write 0 to LCKR[15:0]
    GPIOx->LCKR = PinNumber;

    // Step 3: Write 1 to LCKR[16]
    GPIOx->LCKR = temp;

    // Step 4: Read LCKR to confirm
    temp = GPIOx->LCKR;

    // Check if the lock is active
    if ((uint32)(GPIOx->LCKR & (1 << 16))) {
        return GPIO_RETURN_LOCK_OK;
    } else {
        return GPIO_RETURN_LOCK_ERROR;
    }
}


