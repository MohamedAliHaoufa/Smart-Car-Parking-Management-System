/**
 * @file           stm32f401xx_i2c_driver.h
 * @author         Mohamed Ali Haoufa
 * @brief          Header file for STM32F401xx I2C driver.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file provides the interface for initializing and controlling the I2C
 * peripheral on the STM32F401xx microcontroller. It includes definitions for
 * I2C configurations, enumerations for I2C status and control, and function
 * prototypes for I2C operations.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa All rights reserved.
 */

#ifndef INC_STM32F401XX_I2C_DRIVER_H_
#define INC_STM32F401XX_I2C_DRIVER_H_

/**
 * @defgroup I2C_Driver I2C Driver
 * @brief I2C driver APIs for STM32F401xx MCU.
 * @{
 */

/*==================================================================*/
/*=============================Includes=============================*/
/*==================================================================*/
#include "stm32f401xx_gpio_driver.h"


/*==================================================================*/
/*==========================Config_Struct===========================*/
/*==================================================================*/

/**
 * @brief Structure for I2C slave address configuration.
 */
struct S_I2C_Slave_address
{
    uint16_t Enable_Dual_Address;      /**< Enable or disable dual addressing mode. */
    uint16_t PrimaryAddress;           /**< Primary 7-bit or 10-bit address of the I2C slave. */
    uint16_t SecondaryAddress;         /**< Secondary 7-bit or 10-bit address of the I2C slave. */
    uint16_t I2C_Addressing_Mode;      /**< Addressing mode (7-bit or 10-bit). */
};

/**
 * @brief Enumeration for I2C slave states.
 */
typedef enum
{
    I2C_EV_Stop,                /**< Stop condition detected. */
    I2C_Error_AF,               /**< Acknowledge failure error. */
    I2C_Ev_Address_Matched,     /**< Address matched event. */
    I2C_Ev_Data_Req,           /**< Data request event (Slave_Send_Data). */
    I2C_Ev_Data_RCV            /**< Data received event (Slave_Read_Data). */
} Slave_State;

/**
 * @brief Structure for I2C configuration.
 */
typedef struct
{
    uint32_t I2C_Speed;                          /**< I2C clock speed. */
    uint32_t I2C_stretchmode;                    /**< Clock stretching mode. */
    uint32_t I2C_Mode;                          /**< I2C or SMBus mode. */
    struct S_I2C_Slave_address I2C_Slave_address; /**< Slave address configuration. */
    uint32_t I2C_Ack_Conrtol;                    /**< Acknowledge control. */
    uint32_t General_Call_Address_Detection;     /**< General call address detection. */
    void (*P_Slave_Event_CallBack)(Slave_State state); /**< Callback function for slave events. */
} S_I2C_Config_t;

/**
 * @brief Enumeration for I2C stop condition.
 */
typedef enum
{
    WithStop,      /**< Stop condition is generated after the transfer. */
    WithoutStop    /**< Stop condition is not generated. */
} StopCondition;

/**
 * @brief Enumeration for I2C repeated start condition.
 */
typedef enum
{
    Start,         /**< Start condition is generated. */
    Repeated       /**< Repeated start condition is generated. */
} Repeated_Start;

/**
 * @brief Enumeration for functional state.
 */
typedef enum
{
    DISABLE,       /**< Disable the functionality. */
    ENABLE         /**< Enable the functionality. */
} Functional_State;

/**
 * @brief Enumeration for flag status.
 */
typedef enum
{
    Reset,         /**< Flag is reset. */
    Set            /**< Flag is set. */
} FlagStatus;

/**
 * @brief Enumeration for I2C status flags.
 */
typedef enum
{
    I2C_Flag_Busy,                   /**< I2C is busy. */
    EV5,                             /**< Event 5: Start bit transmitted. */
    EV6,                             /**< Event 6: Address sent. */
    EV7,                             /**< Event 7: Data register not empty. */
    EV8,                             /**< Event 8: Transmit data register empty. */
    EV8_1,                           /**< Event 8_1: Transmit data register empty, write Data1 in DR. */
    Master_Byte_Transmitting = (uint32_t)(0x00070080) /**< Master mode, byte transmitting. */
} Status;

/**
 * @brief Enumeration for I2C direction.
 */
typedef enum
{
    I2C_Direction_Transmitter, /**< Transmitter mode. */
    I2C_Direction_Receiver     /**< Receiver mode. */
} I2C_Direction;

/*==================================================================*/
/*=============================ref_Macros===========================*/
/*==================================================================*/

/**
 * @defgroup I2C_Speed_Define I2C Speed Definitions
 * Defines for I2C clock speeds.
 * @{
 */
#define I2C_SCK_SM_50K            (0x50000UL) /**< Standard mode 50 kHz clock speed. */
#define I2C_SCK_SM_100K           (100000UL)   /**< Standard mode 100 kHz clock speed. */
#define I2C_SCK_FM_200K           (200000UL)   /**< Fast mode 200 kHz clock speed (not supported yet). */
#define I2C_SCK_FM_400K           (400000UL)   /**< Fast mode 400 kHz clock speed (not supported yet). */
/** @} */

/**
 * @defgroup I2C_StretchMode_Define I2C Stretch Mode Definitions
 * Defines for I2C clock stretching mode.
 * @{
 */
#define I2C_StretchMode_enabled   0x00000000U /**< Clock stretching enabled. */
#define I2C_StretchMode_disabled  I2C_CR1_NOSTRETCH /**< Clock stretching disabled. */
/** @} */

/**
 * @defgroup I2C_Mode_Define I2C Mode Definitions
 * Defines for I2C and SMBus modes.
 * @{
 */
#define I2C_Mode_I2C              0           /**< I2C mode. */
#define I2C_Mode_SMBus            I2C_CR1_SMBUS /**< SMBus mode. */
/** @} */

/**
 * @defgroup I2C_Addressing_Slave I2C Addressing Modes
 * Defines for I2C slave addressing modes.
 * @{
 */
#define I2C_Addressing_Slave_7bits 0          /**< 7-bit addressing mode. */
#define I2C_Addressing_Slave_10bits (uint16_t)(1<<15) /**< 10-bit addressing mode. */
/** @} */

/**
 * @defgroup I2C_Ack_Control_Define I2C Acknowledge Control Definitions
 * Defines for I2C acknowledge control.
 * @{
 */
#define I2C_Ack_Control_Enable     I2C_CR1_ACK /**< Acknowledge enabled. */
#define I2C_Ack_Control_Disable    0           /**< Acknowledge disabled. */
/** @} */

/**
 * @defgroup I2C_ENGC I2C General Call Enable Definitions
 * Defines for enabling or disabling general call.
 * @{
 */
#define I2C_ENGC_Enable    I2C_CR1_ENGC /**< General call enabled. */
#define I2C_ENGC_Disable   0x00        /**< General call disabled. */
/** @} */

/*==================================================================*/
/*=============================APIS_Supported=======================*/
/*==================================================================*/

/**
 * @defgroup I2C_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the I2C peripheral.
 *
 * This function initializes the I2C peripheral with the provided configuration.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] I2C_Init_Struct Pointer to the configuration structure for the I2C peripheral.
 */
void MCAL_I2C_Init(I2C_TypeDef *I2Cx, S_I2C_Config_t *I2C_Init_Struct);

/**
 * @brief Deinitializes the I2C peripheral.
 *
 * This function deinitializes the I2C peripheral and resets it to its default state.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 */
void MCAL_I2C_Deinit(I2C_TypeDef *I2Cx);

/**
 * @brief Sets the GPIO configuration for I2C.
 *
 * This function configures the GPIO pins associated with the I2C peripheral.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 */
void MCAL_I2C_Set_GPIO(I2C_TypeDef *I2Cx);

/**
 * @brief Transmits data from the master to the slave.
 *
 * This function sends data from the I2C master to a specified I2C slave.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] SlaveAdd Address of the I2C slave.
 * @param[in] dataout Pointer to the data to be transmitted.
 * @param[in] datalen Length of the data to be transmitted.
 * @param[in] Stop Specifies whether to generate a stop condition.
 * @param[in] start Specifies whether to generate a repeated start condition.
 */
void MCAL_I2C_Master_Tx(I2C_TypeDef *I2Cx, uint16_t SlaveAdd, uint8_t *dataout, uint32_t datalen, StopCondition Stop, Repeated_Start start);

/**
 * @brief Receives data from the master.
 *
 * This function receives data from the I2C master.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] SlaveAdd Address of the I2C slave.
 * @param[out] dataout Pointer to the buffer where received data will be stored.
 * @param[in] datalen Length of the data to be received.
 * @param[in] Stop Specifies whether to generate a stop condition.
 * @param[in] start Specifies whether to generate a repeated start condition.
 */
void MCAL_I2C_Master_Rx(I2C_TypeDef *I2Cx, uint16_t SlaveAdd, uint8_t *dataout, uint32_t datalen, StopCondition Stop, Repeated_Start start);

/**
 * @brief Sends data from the slave.
 *
 * This function sends data from the I2C slave to the master.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] data Data to be sent by the slave.
 */
void MCAL_I2C_Slave_SendData(I2C_TypeDef *I2Cx, uint8_t data);

/**
 * @brief Receives data in slave mode.
 *
 * This function receives data from the I2C master in slave mode.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 *
 * @return The received data.
 */
uint8_t MCAL_I2C_SlaveReceiveData(I2C_TypeDef *I2Cx);

/**
 * @brief Generates a start condition on the I2C bus.
 *
 * This function generates a start condition on the I2C bus.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] state Specifies whether to enable or disable the start condition.
 * @param[in] start Specifies whether to generate a repeated start condition.
 */
void I2C_Generate_Start(I2C_TypeDef *I2Cx, Functional_State state, Repeated_Start start);

/**
 * @brief Gets the status of a specific flag.
 *
 * This function checks the status of a specific I2C flag.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] flag The flag to check.
 *
 * @return The status of the flag (Set or Reset).
 */
FlagStatus I2C_Get_FlagStatus(I2C_TypeDef *I2Cx, Status flag);

/**
 * @brief Sends an address to the I2C bus.
 *
 * This function sends an address to the I2C bus.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] SlaveAddress The address of the I2C slave.
 * @param[in] I2C_Direction The direction of the data transfer (transmitter or receiver).
 */
void I2C_SendAddress(I2C_TypeDef *I2Cx, uint16_t SlaveAddress, I2C_Direction I2C_Direction);

/**
 * @brief Generates a stop condition on the I2C bus.
 *
 * This function generates a stop condition on the I2C bus.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] NewState Specifies whether to enable or disable the stop condition.
 */
void I2C_Generate_Stop(I2C_TypeDef *I2Cx, Functional_State NewState);

/**
 * @brief Configures the I2C acknowledge feature.
 *
 * This function configures the acknowledge feature for the I2C bus.
 *
 * @param[in] I2Cx Pointer to the I2C peripheral (I2C1, I2C2, etc.).
 * @param[in] NewState Specifies whether to enable or disable acknowledgment.
 */
void I2C_ACKnowlageConfig(I2C_TypeDef *I2Cx, Functional_State NewState);
/** @} */

/** @} */

#endif /* INC_STM32F401XX_I2C_DRIVER_H_ */
