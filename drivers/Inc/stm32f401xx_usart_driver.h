/**
 * @file stm32f401xx_usart_driver.h
 * @author Mohamed Ali Haoufa
 * @brief USART driver header file for STM32F401 series microcontrollers.
 * @version 1.0
 * @date 2024-09-21
 *
 * This file contains the configuration and function prototypes for the USART peripheral.
 * It includes macros for configuration, API declarations, and enumeration types.
 *
 * @copyright Copyright (c) 2024
 */

/** @defgroup USART_Driver USART Driver
 * @{ 
 * @brief USART peripheral driver for STM32F401 microcontrollers.
 */

#ifndef INC_STM32F401XX_USART_DRIVER_H_
#define INC_STM32F401XX_USART_DRIVER_H_

#include "stm32f401xx.h"
#include "stm32f401xx_gpio_driver.h"
#include "stm32f401xx_rcc_driver.h"
#include "stm32f401xx_nvic_driver.h"


//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx.h"
#include "stm32f401xx_gpio_driver.h"
#include "stm32f401xx_rcc_driver.h"
#include "stm32f401xx_nvic_driver.h"

//----------------------------------------------
// Section: User type definitions
//----------------------------------------------

/**
 * @struct USART_cfg_t
 * @brief Configuration structure for USART (Universal Synchronous Asynchronous Receiver Transmitter) peripheral.
 */
typedef struct{
	uint8	USART_Mode; 	// Specifies TX/RX Enable/Disable
							// this parameter must be set based on @ref UART_Mode_define
	uint32	BaudRate;		// This member configures the UART communication baud rate
							// this parameter must be set based on @ref UART_BaudRate_define
	uint8	Payload_Length; // Specifies the number of data bits transmitted or received in a frame
							// this parameter must be set based on @ref UART_Payload_Length_define
	uint32	Parity;			// Specifies the parity mode
							// this parameter must be set based on @ref UART_Parity_define
	uint32	StopBits;		// Specifies the number of stop bits transmitted
							// this parameter must be set based on @ref UART_StopBits_define
	uint8	HwFlowCtl;		// Specifies whether the hardware flow control mode is enabled or disabled
							// this parameter must be set based on @ref UART_HwFlowCtl_define
	uint8	IRQ_Enable;		// Enable or Disable UART IRQ TX/RX
							// @ref UART_IRQ_Enable_define, you can select two or three parameters
	void (*P_IRQ_CallBack)(void); // Set the C Function() which will be called once the IRQ happen
}USART_cfg_t;

/**
 * @defgroup USART_Types Enumeration and Structures for USART
 * @{
 */

/** @brief Enumeration for Polling Mechanism */
typedef enum {
    enable,
    disable
} Polling_Mechanism;
/** @} */

/**
 * @defgroup USART_Macros Macros for USART Configuration
 * @{
 */

/** @brief USART Mode Definitions */
#define UART_Mode_RX               ((uint32_t)(1UL << 2))
#define UART_Mode_TX               ((uint32_t)(1UL << 3))
#define UART_Mode_TX_RX            ((uint32_t)(1UL << 2 | 1UL << 3))

/** @brief Baud Rate Definitions */
#define UART_BaudRate_2400         2400
#define UART_BaudRate_9600         9600
#define UART_BaudRate_19200        19200
#define UART_BaudRate_57600        57600
#define UART_BaudRate_115200       115200
#define UART_BaudRate_230400       230400
#define UART_BaudRate_460800       460800
#define UART_BaudRate_921600       921600
#define UART_BaudRate_2250000      2250000
#define UART_BaudRate_4500000      4500000

/** @brief Payload Length Definitions */
#define UART_Payload_Length_8B     ((uint32_t)(0))
#define UART_Payload_Length_9B     ((uint32_t)(1UL << 12))

/** @brief Parity Definitions */
#define UART_Parity_NONE           ((uint32_t)(0))
#define UART_Parity_EVEN           ((uint32_t)(1UL << 10))
#define UART_Parity_ODD            ((uint32_t)(1UL << 10) | (1UL << 9))

/** @brief Stop Bits Definitions */
#define UART_StopBits_half         ((uint32_t)(1 << 12))
#define UART_StopBits_1            ((uint32_t)(0))
#define UART_StopBits_1_half       ((uint32_t)(3 << 12))
#define UART_StopBits_2            ((uint32_t)(2 << 12))

/** @brief Hardware Flow Control Definitions */
#define UART_HwFlowCtl_NONE        ((uint32_t)(0))
#define UART_HwFlowCtl_RTS         ((uint32_t)(1UL << 8))
#define UART_HwFlowCtl_CTS         ((uint32_t)(1UL << 9))
#define UART_HwFlowCtl_RTS_CTS     ((uint32_t)(1UL << 8 | 1UL << 9))

/** @brief IRQ Enable Definitions */
#define UART_IRQ_Enable_NONE       ((uint32_t)(0))
#define UART_IRQ_Enable_TXE        ((uint32_t)(1UL << 7))  // Transmit data register empty
#define UART_IRQ_Enable_TC         ((uint32_t)(1UL << 6))  // Transmission complete
#define UART_IRQ_Enable_RXNE       ((uint32_t)(1UL << 5))  // Received data ready to be read & Overrun error detected
#define UART_IRQ_Enable_PE         ((uint32_t)(1UL << 8))  // Parity error

/** @} */

/**
 * @defgroup USART_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes UART (Asynchronous mode only).
 * @param USARTx: Pointer to the USART peripheral instance.
 * @param USART_cfg: Pointer to the UART configuration.
 */
void MCAL_USART_Init(USART_TypeDef* USARTx, USART_cfg_t* USART_cfg);

/**
 * @brief Deinitializes UART (Asynchronous mode only).
 * @param USARTx: Pointer to the USART peripheral instance.
 */
void MCAL_USART_DeInit(USART_TypeDef* USARTx);

/**
 * @brief Initializes GPIO pins for UART.
 * @param USARTx: Pointer to the USART peripheral instance.
 */
void MCAL_USART_GPIO_Set_Pins(USART_TypeDef* USARTx);

/**
 * @brief Sends buffer via UART.
 * @param USARTx: Pointer to the USART peripheral instance.
 * @param pTxBuffer: Buffer to be transmitted.
 * @param PollingEn: Enable or disable polling mechanism.
 */
void MCAL_USART_SendData(USART_TypeDef* USARTx, uint16_t *pTxBuffer, Polling_Mechanism PollingEn);

/**
 * @brief Sends a string via UART.
 * @param USARTx: Pointer to the USART peripheral instance.
 * @param str: Pointer to the string to be transmitted.
 * @param str_len: Length of string to be transmitted (0 = send until null '\0').
 */
void MCAL_USART_SendString(USART_TypeDef* USARTx, uint8_t *str, uint8_t str_len);

/**
 * @brief Receives buffer from UART.
 * @param USARTx: Pointer to the USART peripheral instance.
 * @param pRxBuffer: Buffer to be received.
 * @param PollingEn: Enable or disable polling mechanism.
 */
void MCAL_USART_ReceiveData(USART_TypeDef* USARTx, uint16_t *pRxBuffer, Polling_Mechanism PollingEn);

/**
 * @brief Receives buffer from UART with specified length.
 * @param USARTx: Pointer to the USART peripheral instance.
 * @param pRxBuffer: Buffer to be received.
 * @param length: Length of data to be received (0 = until receiving '\r').
 */
void MCAL_USART_ReceiveBuffer(USART_TypeDef* USARTx, uint16_t *pRxBuffer, uint8_t length);

/**
 * @brief Waits until transmission is completed by polling on TC flag.
 * @param USARTx: Pointer to the USART peripheral instance.
 */
void MCAL_USART_Wait_TC(USART_TypeDef* USARTx);

/** @} */

#endif /* INC_STM32F401XX_USART_DRIVER_H_ */

/** @} */


