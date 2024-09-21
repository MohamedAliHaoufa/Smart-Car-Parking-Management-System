/**
 * @file           eeprom_flash.h
 * @author         Mohamed Ali Haoufa
 * @brief          Header file for EEPROM flash memory operations.
 * @version        0.1
 * @date           2024-09-21
 *
 * This file provides the function prototypes and constants for initializing
 * and managing EEPROM flash memory using the STM32F401xx MCU. It includes
 * functions for writing and reading data from the EEPROM and defines the 
 * EEPROM slave address used in I2C communication.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 *
 * @details
 * The EEPROM is configured as an I2C slave device with the address 0x50.
 * The provided functions allow for initialization, writing, and reading data 
 * from the AT24C1024B EEPROM. Ensure the correct I2C driver is included and configured 
 * for communication with the EEPROM.
 */

/**
 * @defgroup EEPROM_Driver AT24C1024B EEPROM Driver
 * @brief AT24C1024B EEPROM driver for STM32F401xx MCUs.
 * @{
 */

#ifndef INC_EEPROM_FLASH_H_
#define INC_EEPROM_FLASH_H_

#include "stm32f401xx_i2c_driver.h"

/** @defgroup EEPROM_Constants EEPROM Constants
 * @{
 */

/** @brief AT24C1024B EEPROM slave address for I2C communication.
 *
 * This address is used to identify the AT24C1024B EEPROM device on the I2C bus.
 */
#define EEPROM_Slave_address 0x50

/** @} */ // End of EEPROM_Constants

/**
 * @defgroup EEPROM_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the EEPROM for communication.
 *
 * This function sets up the necessary configuration to communicate with the EEPROM
 * over I2C. It should be called before any read or write operations are performed.
 */
void EEPROM_Init(void);

/**
 * @brief Writes multiple bytes to the EEPROM.
 *
 * This function writes a block of data to a specified memory address in the EEPROM.
 *
 * @param[in] Memory_address The starting address in the EEPROM where the data will be written.
 * @param[in] bytes Pointer to the data buffer to be written to the EEPROM.
 * @param[in] Data_Length The number of bytes to write to the EEPROM.
 *
 * @return Status of the write operation. Returns 0 for success, non-zero for failure.
 */
unsigned char EEPROM_Write_NBytes(unsigned int Memory_address, unsigned char* bytes, uint8_t Data_Length);

/**
 * @brief Reads a byte from the EEPROM.
 *
 * This function reads a single byte of data from a specified memory address in the EEPROM.
 *
 * @param[in] Memory_address The address in the EEPROM from which to read the data.
 * @param[out] dataout Pointer to a variable where the read byte will be stored.
 * @param[in] datalen The number of bytes to read. In this case, should be 1 for a single byte read.
 *
 * @return Status of the read operation. Returns 0 for success, non-zero for failure.
 */
unsigned char EEPROM_Read_byte(unsigned int Memory_address, uint8_t *dataout, uint8_t datalen);
/** @} */

#endif /* INC_EEPROM_FLASH_H_ */

/** @} */