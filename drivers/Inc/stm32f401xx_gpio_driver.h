/**
 * @file stm32f401xx_gpio_driver.h
 * @author Mohamed Ali Haoufa
 * @brief Header file for GPIO driver for STM32F401xx microcontroller.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file provides the definitions, macros, and function prototypes for
 * configuring and controlling GPIO pins on the STM32F401xx microcontroller.
 *
 * @copyright Copyright (c) 2024 Mohamed Ali Haoufa
 *
 */

#ifndef INC_STM32F401XX_GPIO_DRIVER_H_
#define INC_STM32F401XX_GPIO_DRIVER_H_

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx.h"

/**
 * @defgroup GPIO_Driver GPIO Driver
 * @brief GPIO driver APIs for STM32F401xx MCU.
 * @{
 */

//----------------------------------------------
// Section: User type definitions
//----------------------------------------------
/**
 * @struct GPIO_PinConfig_t
 * @brief Configuration structure for GPIO pins.
 *
 * This structure defines the configuration parameters for a GPIO pin,
 * including mode, speed, pull-up/pull-down configuration, output type,
 * and alternate function mode.
 */
typedef struct {
    uint8 GPIO_MODE;              /**< Specifies the operating mode for the selected pins. 
                                     This parameter can be a value of @ref GPIO_MODE_define */
    uint8 GPIO_PinSpeed;          /**< Specifies the speed for the selected pins. 
                                     This parameter can be a value of @ref GPIO_SPEED_define */
    uint16 GPIO_PinNumber;        /**< Specifies the GPIO pins to be configured. 
                                     This parameter can be a value of @ref GPIO_PINS_define */
    uint32 GPIO_PinPuPdControl;   /**< Specifies the pull-up/pull-down configuration for the GPIO pin. */
    uint32 GPIO_PinOPType;        /**< Specifies the output type of the GPIO pin. */
    uint32 GPIO_PinAltFunMode;    /**< Specifies the alternate function mode of the GPIO pin. */
} GPIO_PinConfig_t;

//----------------------------------------------
// Section: Macros Configuration References
//----------------------------------------------
/**
 * @defgroup GPIO_PINS_define GPIO Pin Numbers
 * @brief Defines the GPIO pin numbers.
 * @{
 */
#define GPIO_PIN_0               0
#define GPIO_PIN_1               1
#define GPIO_PIN_2               2
#define GPIO_PIN_3               3
#define GPIO_PIN_4               4
#define GPIO_PIN_5               5
#define GPIO_PIN_6               6
#define GPIO_PIN_7               7
#define GPIO_PIN_8               8
#define GPIO_PIN_9               9
#define GPIO_PIN_10              10
#define GPIO_PIN_11              11
#define GPIO_PIN_12              12
#define GPIO_PIN_13              13
#define GPIO_PIN_14              14
#define GPIO_PIN_15              15
#define GPIO_PIN_ALL             ((uint16)0xFFFF)
/** @} */

/**
 * @defgroup GPIO_MODE_define GPIO Pin Modes
 * @brief Defines the GPIO pin modes.
 * @{
 */
#define GPIO_MODE_INPUT_FLO      0x00000001U /**< Floating input */
#define GPIO_MODE_INPUT_PU       0x00000002U /**< Input with pull-up */
#define GPIO_MODE_INPUT_PD       0x00000003U /**< Input with pull-down */
#define GPIO_MODE_OUTPUT_PP      0x00000004U /**< General purpose output push-pull */
#define GPIO_MODE_OUTPUT_OD      0x00000005U /**< General purpose output open-drain */
#define GPIO_MODE_OUTPUT_AF_PP   0x00000006U /**< Alternate function output push-pull */
#define GPIO_MODE_OUTPUT_AF_OD   0x00000007U /**< Alternate function output open-drain */
#define GPIO_MODE_AF_INPUT       0x00000008U /**< Alternate function input */
/** @} */

/**
 * @defgroup GPIO_SPEED_define GPIO Pin Speeds
 * @brief Defines the GPIO pin speeds.
 * @{
 */
#define GPIO_SPEED_10M           0x00000001U /**< Output mode, max speed 10 MHz */
#define GPIO_SPEED_2M            0x00000002U /**< Output mode, max speed 2 MHz */
#define GPIO_SPEED_50M           0x00000003U /**< Output mode, max speed 50 MHz */
/** @} */

/**
 * @defgroup GPIO_PIN_STATE GPIO Pin States
 * @brief Defines the GPIO pin states.
 * @{
 */
#define GPIO_PIN_SET             1  /**< GPIO Pin set state */
#define GPIO_PIN_RESET           0  /**< GPIO Pin reset state */
/** @} */

/**
 * @defgroup GPIO_RETURN_LOCK GPIO Return Lock Status
 * @brief Defines the return status for GPIO lock operations.
 * @{
 */
#define GPIO_RETURN_LOCK_OK      1  /**< GPIO pin configuration is locked successfully */
#define GPIO_RETURN_LOCK_ERROR   0  /**< GPIO pin configuration lock failed */
/** @} */

/**
 * @defgroup GPIO_PIN_MODES GPIO Pin Modes
 * @brief Defines possible GPIO pin modes.
 * @{
 */
#define GPIO_MODE_IN             0  /**< GPIO Input mode */
#define GPIO_MODE_OUT            1  /**< GPIO Output mode */
#define GPIO_MODE_ALTFN          2  /**< GPIO Alternate Function mode */
#define GPIO_MODE_ANALOG         3  /**< GPIO Analog mode */
#define GPIO_MODE_IT_FT          4  /**< GPIO Interrupt Falling-Edge Trigger mode */
#define GPIO_MODE_IT_RT          5  /**< GPIO Interrupt Rising-Edge Trigger mode */
#define GPIO_MODE_IT_RFT         6  /**< GPIO Interrupt Rising-Falling Edge Trigger mode */
/** @} */

/**
 * @defgroup GPIO_SPEEDS GPIO Output Speeds
 * @brief Defines possible GPIO pin output speeds.
 * @{
 */
#define GPIO_SPEED_LOW           0  /**< GPIO Output speed Low */
#define GPIO_SPEED_MEDIUM        1  /**< GPIO Output speed Medium */
#define GPIO_SPEED_FAST          2  /**< GPIO Output speed Fast */
#define GPIO_SPEED_HIGH          3  /**< GPIO Output speed High */
/** @} */

/**
 * @defgroup GPIO_PUPD GPIO Pull-up/Pull-down Configurations
 * @brief Defines possible GPIO pin pull-up and pull-down configurations.
 * @{
 */
#define GPIO_NO_PUPD             0  /**< No pull-up/pull-down configuration */
#define GPIO_PIN_PU              1  /**< GPIO Pull-up configuration */
#define GPIO_PIN_PD              2  /**< GPIO Pull-down configuration */
/** @} */

/**
 * @defgroup GPIO_OUTPUT_TYPES GPIO Output Types
 * @brief Defines possible GPIO pin output types.
 * @{
 */
#define GPIO_OP_TYPE_PP          0  /**< GPIO Output type Push-Pull mode */
#define GPIO_OP_TYPE_OD          1  /**< GPIO Output type Open-Drain mode */
/** @} */

/**
 * @defgroup GPIO_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the specified GPIO pin according to the provided configuration.
 *
 * This function configures the GPIO pin based on the parameters specified in the
 * GPIO_PinConfig_t structure. It is essential to enable the RCC clock for the
 * corresponding GPIO port before calling this function.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @param [in] PinConfig Pointer to a GPIO_PinConfig_t structure containing the pin configuration.
 * @retval None
 * @note This function configures the GPIO pins and their associated settings.
 */
void MCAL_GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_PinConfig_t *PinConfig);

/**
 * @brief Resets the specified GPIO port.
 *
 * This function resets the GPIO port, clearing all configuration settings.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @retval None
 * @note This function does not affect other GPIO ports.
 */
void MCAL_GPIO_DeInit(GPIO_TypeDef *GPIOx);

/**
 * @brief Reads the value of a specified GPIO pin.
 *
 * This function retrieves the current state of the specified GPIO pin.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @param [in] PinNumber The number of the pin to read. This parameter should be a value defined in @ref GPIO_PINS_define.
 * @retval uint8 The state of the GPIO pin. This value can be one of the values defined in @ref GPIO_PIN_STATE.
 * @note This function reads the input value of the pin.
 */
uint8 MCAL_GPIO_ReadPin(GPIO_TypeDef *GPIOx, uint16 PinNumber);

/**
 * @brief Reads the value of the entire GPIO port.
 *
 * This function retrieves the current state of all the pins in the specified GPIO port.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @retval uint16 The state of the entire GPIO port.
 * @note This function reads the input values of all pins in the port.
 */
uint16 MCAL_GPIO_ReadPort(GPIO_TypeDef *GPIOx);

/**
 * @brief Writes a value to a specified GPIO pin.
 *
 * This function sets the state of the specified GPIO pin to the provided value.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @param [in] PinNumber The number of the pin to write to. This parameter should be a value defined in @ref GPIO_PINS_define.
 * @param [in] Value The value to write to the pin. This parameter should be one of the values defined in @ref GPIO_PIN_STATE.
 * @retval None
 * @note This function sets the output value of the pin.
 */
void MCAL_GPIO_WritePin(GPIO_TypeDef *GPIOx, uint16 PinNumber, uint8 Value);

/**
 * @brief Writes a value to the entire GPIO port.
 *
 * This function sets the state of all the pins in the specified GPIO port to the provided value.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @param [in] Value The value to write to the port. This parameter is a 16-bit value representing the state of each pin.
 * @retval None
 * @note This function sets the output values of all pins in the port.
 */
void MCAL_GPIO_WritePort(GPIO_TypeDef *GPIOx, uint16 Value);

/**
 * @brief Toggles the state of a specified GPIO pin.
 *
 * This function toggles the output state of the specified GPIO pin.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address.
 * @param [in] PinNumber The number of the pin to toggle. This parameter should be a value defined in @ref GPIO_PINS_define.
 * @retval None
 * @note This function changes the state of the pin from high to low or low to high.
 */
void MCAL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint16 PinNumber);

/**
 * @brief Toggles the value of a specific GPIO Port.
 * 
 * This function inverts the state of the specified GPIO Port.
 * 
 * @param[in] GPIOx The GPIO peripheral to which to write (e.g., GPIOA, GPIOB, GPIOC, etc.).
 * 
 * @return None
 * 
 * @note None
 */
void MCAL_GPIO_TogglePort(GPIO_TypeDef *GPIOx);

/**
 * @brief Toggles the state of all pins in the specified GPIO port.
 *
 * This function toggles the output state of each pin in the given GPIO port. If a pin is high, it will be set to low, and if it is low, it will be set to high.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address. This parameter can be one of the following values depending on the device used: GPIOA, GPIOB, GPIOC, GPIOD, GPIOE.
 * @retval None
 *
 * @note This function affects all pins in the specified GPIO port.
 */
void MCAL_GPIO_TogglePort(GPIO_TypeDef *GPIOx);

/**
 * @brief Locks the configuration of a specific GPIO pin to prevent further changes.
 *
 * This function locks the configuration of the specified GPIO pin. Once locked, the pin's configuration cannot be modified until the reset of the device. This is useful for protecting the pin configuration from accidental changes.
 *
 * @param [in] GPIOx Pointer to the GPIO peripheral base address. This parameter can be one of the following values depending on the device used: GPIOA, GPIOB, GPIOC, GPIOD, GPIOE.
 * @param [in] PinNumber The number of the pin to lock. This parameter should be a value defined in @ref GPIO_PINS_define.
 * @retval uint8 Returns GPIO_RETURN_LOCK_OK if the pin configuration is successfully locked, or GPIO_RETURN_LOCK_ERROR if the locking operation fails.
 *
 * @note Ensure that the pin's configuration is correctly set before calling this function, as the configuration cannot be changed once locked.
 */
uint8 MCAL_GPIO_LockPin(GPIO_TypeDef *GPIOx, uint16 PinNumber);
/** @} */

/** @} */

#endif /* INC_STM32F401XX_GPIO_DRIVER_H_ */

