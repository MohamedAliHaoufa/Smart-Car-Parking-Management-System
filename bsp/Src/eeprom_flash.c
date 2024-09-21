/**
 * @file           eeprom_flash.c
 * @author         Mohamed Ali Haoufa
 * @brief          Implementation of EEPROM flash memory operations for STM32F401xx MCU.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file contains the implementation of functions to initialize and manage
 * EEPROM flash memory using I2C communication with the STM32F401xx MCU. It includes
 * functions for writing and reading data from the EEPROM.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 */

#include "eeprom_flash.h"

/** @brief Buffer used for I2C communication with AT24C1024B EEPROM. */
uint8_t buffer[256];

/**
 * @brief Initializes the EEPROM for I2C communication.
 *
 * This function configures the I2C1 peripheral of the STM32F401xx MCU for communication
 * with the EEPROM. It sets up the I2C speed, address detection, and other relevant parameters.
 * 
 * @details
 * - Configures PB6 as I2C1_SCL and PB7 as I2C1_SDA.
 * - Enables general call address detection.
 * - Enables acknowledgment control.
 * - Sets I2C speed to 100kHz.
 * - Configures I2C mode and stretch mode.
 */
void EEPROM_Init(void)
{
    //==================================I2C_INIT=============================//
    //          PB6 : I2C1_SCL
    //          PB7 : I2C1_SDA

    S_I2C_Config_t I2C1CFG;

    I2C1CFG.General_Call_Address_Detection = I2C_ENGC_Enable;
    I2C1CFG.I2C_Ack_Conrtol = I2C_Ack_Control_Enable;
    I2C1CFG.I2C_Speed = I2C_SCK_SM_100K;
    I2C1CFG.I2C_Mode = I2C_Mode_I2C;
    I2C1CFG.P_Slave_Event_CallBack = NULL;
    I2C1CFG.I2C_stretchmode = I2C_StretchMode_enabled;

    MCAL_I2C_Set_GPIO(I2C1);
    MCAL_I2C_Init(I2C1, &I2C1CFG);
}

/**
 * @brief Writes a block of data to the EEPROM.
 *
 * This function writes multiple bytes to a specified memory address in the EEPROM.
 *
 * @param[in] Memory_address The starting address in the EEPROM where data will be written.
 * @param[in] bytes Pointer to the data buffer to be written to the EEPROM.
 * @param[in] Data_Length The number of bytes to write.
 *
 * @return Status of the write operation. Returns 0 for success.
 */
unsigned char EEPROM_Write_NBytes(unsigned int Memory_address, unsigned char* bytes, uint8_t Data_Length)
{
    uint8_t i;

    buffer[0] = (uint8_t)(Memory_address >> 8);   /**< High byte of the memory address */
    buffer[1] = (uint8_t)(Memory_address);        /**< Low byte of the memory address */

    for (i = 2; i < (Data_Length + 2); i++)
    {
        buffer[i] = bytes[i - 2];
    }

    MCAL_I2C_Master_Tx(I2C1, EEPROM_Slave_address, buffer, Data_Length + 2, WithStop, Start);

    return 0;
}

/**
 * @brief Reads a byte from the EEPROM.
 *
 * This function reads a single byte from a specified memory address in the EEPROM.
 *
 * @param[in] Memory_address The address in the EEPROM from which to read the data.
 * @param[out] dataout Pointer to a variable where the read byte will be stored.
 * @param[in] datalen The number of bytes to read. For this function, should be 1.
 *
 * @return Status of the read operation. Returns 0 for success.
 */
unsigned char EEPROM_Read_byte(unsigned int Memory_address, uint8_t *dataout, uint8_t datalen)
{
    buffer[0] = (uint8_t)(Memory_address >> 8);   /**< High byte of the memory address */
    buffer[1] = (uint8_t)(Memory_address);        /**< Low byte of the memory address */

    MCAL_I2C_Master_Tx(I2C1, EEPROM_Slave_address, buffer, 2, WithoutStop, Start);
    MCAL_I2C_Master_Rx(I2C1, EEPROM_Slave_address, dataout, datalen, WithStop, Repeated);

    return 0;
}
