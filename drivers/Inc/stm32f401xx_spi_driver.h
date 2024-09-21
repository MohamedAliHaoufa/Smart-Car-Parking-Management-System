/**
 * @file stm32f401xx_spi_driver.h
 * @author Mohamed Ali Haoufa
 * @brief This file contains definitions and function prototypes for the STM32F401xx SPI driver.
 * @version 0.1
 * @date 2024-09-21
 *
 * @copyright Copyright (c) 2024
 *
 * This header file provides the definitions and function prototypes required for configuring and using the SPI (Serial Peripheral Interface) peripheral
 * on the STM32F401xx microcontroller. It includes macros for configuration, a structure for SPI configuration, and function prototypes for SPI initialization,
 * data transmission, and reception.
 */

#ifndef INC_STM32F401XX_SPI_DRIVER_H_
#define INC_STM32F401XX_SPI_DRIVER_H_

/**
 * @defgroup SPI_Driver SPI Driver
 * @brief SPI driver APIs for STM32F401xx MCU.
 * @{
 */

#include "stm32f401xx_gpio_driver.h"
#include "stm32f401xx.h"

/** 
 * @struct S_IRQ_SRC
 * @brief Structure to identify the source of SPI interrupts.
 *
 * This structure is used to indicate which interrupt event has occurred in the SPI peripheral.
 */
struct S_IRQ_SRC
{
    uint8_t TXE:1;      /**< TX buffer is empty */
    uint8_t RXE:1;      /**< RX buffer is empty */
    uint8_t ERRI:1;      /**< Error interrupt */
    uint8_t Reserved:5; /**< Reserved bits */
};

/**
 * @struct S_SPI_Config_t
 * @brief Configuration structure for SPI.
 *
 * This structure is used to configure the SPI peripheral. It contains settings for device mode, communication mode, payload length, frame format,
 * clock polarity, clock phase, NSS configuration, SPI prescaler, and interrupt enable.
 */
typedef struct
{
    uint16_t Device_Mode;           /**< Specifies if SPI operates in master mode or slave mode. @ref Device_Mode_Define */
    uint16_t Communication_Mode;    /**< Specifies communication mode (bidirectional or unidirectional). @ref Communication_Mode_Define */
    uint16_t Payload_Length;        /**< Specifies payload length (8 or 16 bits). @ref SPI_Payload_Length_Define */
    uint16_t Frame_Format;          /**< Specifies frame format (MSB or LSB first). @ref SPI_Frame_Format_Define */
    uint16_t Clock_Polarity;        /**< Specifies clock polarity (idle low or high). @ref SPI_Clock_Polarity_Define */
    uint16_t Clock_Phase;           /**< Specifies clock phase (sampling on leading or trailing edge). @ref SPI_Clock_Phase_Define */
    uint16_t NSS;                   /**< Specifies NSS management (hardware or software). @ref SPI_NSS_Define */
    uint16_t SPI_Prescaler;         /**< Specifies SPI frequency. @ref SPI_Prescaler_Define */
    uint16_t IRQ_Enable;            /**< Enables or disables SPI interrupts. @ref SPI_IRQ_Enable_Define */
    void(*P_IRQ_CallBack)(struct S_IRQ_SRC IRQ); /**< Callback function for interrupt handling */
} S_SPI_Config_t;

/** @enum SPI_PollingMechanism
 *  @brief Enumeration for SPI polling mechanisms.
 */
enum SPI_PollingMechanism
{
    Enabled,  /**< Polling is enabled */
    Disabled  /**< Polling is disabled */
};

//---------------------------------------------------------
//=======================ref_Macros========================
//---------------------------------------------------------

/** @defgroup SPI_Mode_Define SPI Mode Definitions
 *  @{
 */
#define SPI_Mode_Master                   (0x1<<2) /**< SPI master mode */
#define SPI_Mode_Slave                    (0x00000000U) /**< SPI slave mode */
/** @} */

/** @defgroup SPI_Communication_Mode_Define SPI Communication Mode Definitions
 *  @{
 */
#define SPI_Direction_2lines             (0x00000000U) /**< 2-line communication mode */
#define SPI_Direction_2lines_RX_Only     (0x1<<10) /**< 2-line RX only mode */
#define SPI_Direction_1line_Receive_only (0x1<<15) /**< 1-line receive only mode */
#define SPI_Direction_1line_Transmit_only ((0x1<<15)|(0x1<<14)) /**< 1-line transmit only mode */
/** @} */

/** @defgroup SPI_Payload_Length_Define SPI Payload Length Definitions
 *  @{
 */
#define SPI_Payload_Length_8bit          (0x00000000U) /**< 8-bit payload length */
#define SPI_Payload_Length_16bit         (0x1<<11) /**< 16-bit payload length */
/** @} */

/** @defgroup SPI_Frame_Format_Define SPI Frame Format Definitions
 *  @{
 */
#define SPI_Frame_Format_MSB             (0x00000000U) /**< MSB first frame format */
#define SPI_Frame_Format_LSB             (0x1<<7) /**< LSB first frame format */
/** @} */

/** @defgroup SPI_Clock_Polarity_Define SPI Clock Polarity Definitions
 *  @{
 */
#define SPI_Clock_Polarity_Low_idle      (0x00000000U) /**< Clock polarity idle low */
#define SPI_Clock_Polarity_High_idle     (0x1<<1) /**< Clock polarity idle high */
/** @} */

/** @defgroup SPI_Clock_Phase_Define SPI Clock Phase Definitions
 *  @{
 */
#define SPI_Clock_Phase_Leading          (0x00000000U) /**< Clock phase leading edge */
#define SPI_Clock_Phase_Trailing         (0x1) /**< Clock phase trailing edge */
/** @} */

/** @defgroup SPI_NSS_Define SPI NSS Definitions
 *  @{
 */
#define SPI_NSS_Hard_Slave               (0x00000000U) /**< NSS managed by hardware in slave mode */
#define SPI_NSS_Hard_Master_SS_Output_Enable (0x1<<2) /**< NSS managed by hardware in master mode with SS output enabled */
#define SPI_NSS_Hard_Master_SS_No_output (0x00000000U) /**< NSS managed by hardware in master mode with SS output disabled */
#define SPI_NSS_Internal_Soft_Reset      (0x1<<9) /**< NSS managed by software with internal reset */
#define SPI_NSS_Internal_Soft_Set        ((0x1<<9)|(0x1<<8)) /**< NSS managed by software with internal set */
/** @} */

/** @defgroup SPI_Prescaler_Define SPI Prescaler Definitions
 *  @{
 */
#define SPI_Prescaler_By2                (0x00000000U) /**< SPI prescaler divided by 2 */
#define SPI_Prescaler_By4                (0b001<<3) /**< SPI prescaler divided by 4 */
#define SPI_Prescaler_By8                (0b010<<3) /**< SPI prescaler divided by 8 */
#define SPI_Prescaler_By16               (0b011<<3) /**< SPI prescaler divided by 16 */
#define SPI_Prescaler_By32               (0b100<<3) /**< SPI prescaler divided by 32 */
#define SPI_Prescaler_By64               (0b101<<3) /**< SPI prescaler divided by 64 */
#define SPI_Prescaler_By128              (0b110<<3) /**< SPI prescaler divided by 128 */
#define SPI_Prescaler_By256              (0b111<<3) /**< SPI prescaler divided by 256 */
/** @} */

/** @defgroup SPI_IRQ_Enable_Define SPI IRQ Enable Definitions
 *  @{
 */
#define SPI_IRQ_Enable_None              (uint32_t)(0) /**< No IRQ enabled */
#define SPI_IRQ_Enable_Tx_Only           (uint32_t)(1<<7) /**< Enable TX interrupt */
#define SPI_IRQ_Enable_Rx_Only           (uint32_t)(1<<6) /**< Enable RX interrupt */
#define SPI_IRQ_Enable_Err               (uint32_t)(1<<5) /**< Enable Error interrupt */
/** @} */

/**
 * @defgroup SPI_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the SPI peripheral according to the specified configuration.
 * @param SPIx Pointer to the SPI peripheral register base address.
 * @param Config Pointer to the SPI configuration structure.
 */
void MCAL_SPI_Init(SPI_TypeDef *SPIx, S_SPI_Config_t *Config);

/**
 * @brief Deinitializes the SPI peripheral.
 * @param SPIx Pointer to the SPI peripheral register base address.
 */
void MCAL_SPI_DeInit(SPI_TypeDef *SPIx);

/**
 * @brief Configures the GPIO pins used for SPI communication.
 * @param SPIx Pointer to the SPI peripheral register base address.
 */
void MCAL_SPI_GPIO_Set_Pins(SPI_TypeDef *SPIx);

/**
 * @brief Sends data through SPI.
 * @param SPIx Pointer to the SPI peripheral register base address.
 * @param pTXBuffer Pointer to the buffer containing the data to be transmitted.
 * @param Polling_En Specifies whether polling is enabled or disabled.
 */
void MCAL_SPI_SendData(SPI_TypeDef *SPIx, uint16_t *pTXBuffer, enum SPI_PollingMechanism Polling_En);

/**
 * @brief Receives data from SPI.
 * @param SPIx Pointer to the SPI peripheral register base address.
 * @param pRXBuffer Pointer to the buffer where received data will be stored.
 * @param Polling_En Specifies whether polling is enabled or disabled.
 */
void MCAL_SPI_ReceiveData(SPI_TypeDef *SPIx, uint16_t *pRXBuffer, enum SPI_PollingMechanism Polling_En);

/**
 * @brief Transmits and receives data through SPI.
 * @param SPIx Pointer to the SPI peripheral register base address.
 * @param TX_RX_pBuffer Pointer to the buffer containing data to be transmitted and where received data will be stored.
 * @param Polling_En Specifies whether polling is enabled or disabled.
 */
void MCAL_SPI_Tx_Rx(SPI_TypeDef *SPIx, uint16_t *TX_RX_pBuffer, enum SPI_PollingMechanism Polling_En);
/** @} */


#endif /* INC_STM32F401XX_SPI_DRIVER_H_ */

/** @} */
