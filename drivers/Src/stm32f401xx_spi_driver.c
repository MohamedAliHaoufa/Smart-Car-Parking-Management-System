/**
 * @file stm32f401xx_spi_driver.c
 * @brief Contains the implementation of the SPI driver APIs for STM32F401.
 * @version 0.1
 * @date 2024-09-21
 * 
 * @copyright Copyright (c) 2024
 * 
 * This file provides the implementation of the APIs for configuring and using the SPI (Serial Peripheral Interface)
 * module of the STM32F401 microcontroller. It includes initialization, deinitialization, data transmission, and reception
 * functions, as well as GPIO pin configuration and IRQ handling.
 */

#include "stm32f401xx_rcc_driver.h"
#include "stm32f401xx_spi_driver.h"
#include "stm32f401xx.h"

/**
 * @brief Global array to hold SPI configurations.
 * 
 * This array holds pointers to SPI configurations for SPI1 and SPI2.
 * - Index 0: SPI1 configuration
 * - Index 1: SPI2 configuration
 */
S_SPI_Config_t * Global_SPI_Config[2] = {NULL, NULL};

/**
 * @brief Macro definitions for SPI indices and status flags.
 */
#define SPI1_Index         0        /**< Index for SPI1 in Global_SPI_Config array */
#define SPI2_Index         1        /**< Index for SPI2 in Global_SPI_Config array */
#define SPI_SR_TXE         (uint8_t)(1 << 1) /**< SPI Status Register TXE flag */
#define SPI_SR_RXNE        (uint8_t)(1 << 0) /**< SPI Status Register RXNE flag */

/**
 * @brief Initializes the SPI peripheral.
 * 
 * This function configures the SPI peripheral according to the provided configuration.
 * 
 * @param [in] SPIx Pointer to the SPI peripheral (SPI1 or SPI2) to initialize.
 * @param [in] Config Pointer to the SPI configuration structure.
 * 
 * @retval None
 * 
 * @note This function enables the SPI peripheral clock and configures the SPI registers according to the specified settings.
 */
void MCAL_SPI_Init(SPI_TypeDef * SPIx, S_SPI_Config_t * Config)
{
    uint16_t tmpreg_CR1 = 0; /**< Temporary register for SPI CR1 configuration */
    uint16_t tmpreg_CR2 = 0; /**< Temporary register for SPI CR2 configuration */

    if (SPIx == SPI1)
    {
        Global_SPI_Config[SPI1_Index] = Config;
        MCAL_RCC_Enable_Peripheral(RCC_SPI1);
    }
    else
    {
        Global_SPI_Config[SPI2_Index] = Config;
        MCAL_RCC_Enable_Peripheral(RCC_SPI2);
    }

    tmpreg_CR1 |= (1 << 6); /**< Enable SPI bit in CR1 */
    tmpreg_CR1 |= Config->Device_Mode; /**< Set device mode (Master/Slave) */
    tmpreg_CR1 |= Config->Communication_Mode; /**< Set communication mode (Full Duplex/Transmit/Receive) */
    tmpreg_CR1 |= Config->Frame_Format; /**< Set frame format (MSB/LSB) */
    tmpreg_CR1 |= Config->Payload_Length; /**< Set payload length (8-bit/16-bit) */
    tmpreg_CR1 |= Config->Clock_Polarity; /**< Set clock polarity */
    tmpreg_CR1 |= Config->Clock_Phase; /**< Set clock phase */

    if (Config->NSS == SPI_NSS_Hard_Master_SS_Output_Enable)
    {
        tmpreg_CR2 |= SPI_NSS_Hard_Master_SS_Output_Enable;
    }
    else if (Config->NSS == SPI_NSS_Hard_Master_SS_No_output)
    {
        tmpreg_CR2 |= SPI_NSS_Hard_Master_SS_No_output;
    }
    else
    {
        tmpreg_CR1 |= Config->NSS;
    }

    tmpreg_CR1 |= Config->SPI_Prescaler; /**< Set SPI prescaler */

    if (Config->IRQ_Enable != SPI_IRQ_Enable_None)
    {
        tmpreg_CR1 |= Config->IRQ_Enable;
        if (SPIx == SPI1)
        {
            NVIC_IRQ35_SPI1_Enable;
        }
        else
        {
            NVIC_IRQ36_SPI2_Enable;
        }
    }

    SPIx->CR1 = tmpreg_CR1;
    SPIx->CR2 = tmpreg_CR2;
}

/**
 * @brief Deinitializes the SPI peripheral.
 * 
 * This function resets the SPI peripheral and disables its interrupt.
 * 
 * @param [in] SPIx Pointer to the SPI peripheral (SPI1 or SPI2) to deinitialize.
 * 
 * @retval None
 * 
 * @note This function disables the SPI peripheral clock and IRQ.
 */
void MCAL_SPI_DeInit(SPI_TypeDef * SPIx)
{
    if (SPIx == SPI1)
    {
        NVIC_IRQ35_SPI1_Disable;
        MCAL_RCC_Reset_Peripheral(RCC_SPI1);
    }
    else
    {
        NVIC_IRQ36_SPI2_Disable;
        MCAL_RCC_Reset_Peripheral(RCC_SPI2);
    }
}

/**
 * @brief Sends data through the SPI peripheral.
 * 
 * This function transmits data via the SPI peripheral. It can operate in polling mode or non-polling mode.
 * 
 * @param [in] SPIx Pointer to the SPI peripheral (SPI1 or SPI2) to use for transmission.
 * @param [in] pTXBuffer Pointer to the data buffer to transmit.
 * @param [in] Polling_En Indicates whether polling is enabled or not.
 * 
 * @retval None
 * 
 * @note In polling mode, the function waits until the TXE flag is set before writing data to the data register.
 */
void MCAL_SPI_SendData(SPI_TypeDef * SPIx, uint16_t * pTXBuffer, enum SPI_PollingMechanism Polling_En)
{
    if (Polling_En == Enabled)
    {
        while (!(SPIx->SR & SPI_SR_TXE)); /**< Wait until TXE flag is set */
    }
    SPIx->DR = *pTXBuffer; /**< Send data */
}

/**
 * @brief Receives data from the SPI peripheral.
 * 
 * This function receives data from the SPI peripheral. It can operate in polling mode or non-polling mode.
 * 
 * @param [in] SPIx Pointer to the SPI peripheral (SPI1 or SPI2) to use for reception.
 * @param [in] pRXBuffer Pointer to the buffer where received data will be stored.
 * @param [in] Polling_En Indicates whether polling is enabled or not.
 * 
 * @retval None
 * 
 * @note In polling mode, the function waits until the RXNE flag is set before reading data from the data register.
 */
void MCAL_SPI_ReceiveData(SPI_TypeDef * SPIx, uint16_t * pRXBuffer, enum SPI_PollingMechanism Polling_En)
{
    if (Polling_En == Enabled)
    {
        while (!(SPIx->SR & SPI_SR_RXNE)); /**< Wait until RXNE flag is set */
    }
    *pRXBuffer = SPIx->DR; /**< Receive data */
}

/**
 * @brief Configures GPIO pins for SPI communication based on SPI peripheral.
 * 
 * This function configures the necessary GPIO pins for SPI communication (NSS, SCK, MISO, MOSI) 
 * according to the selected SPI peripheral (SPI1 or SPI2) and the device mode (Master or Slave).
 * 
 * @param [in] SPIx Pointer to the SPI peripheral (SPI1 or SPI2).
 * 
 * @note This function sets the alternate function for the pins used in SPI communication.
 * 
 * @retval None
 */
void MCAL_SPI_GPIO_Set_Pins(SPI_TypeDef * SPIx)
{
    GPIO_PinConfig_t PConfig;

    if (SPIx == SPI1)
    {
        // Configure SPI1 pins: PA4 -> NSS, PA5 -> SCK, PA6 -> MISO, PA7 -> MOSI
        if (Global_SPI_Config[SPI1_Index]->Device_Mode == SPI_Mode_Master)
        {
            switch (Global_SPI_Config[SPI1_Index]->NSS)
            {
                case SPI_NSS_Hard_Master_SS_Output_Enable:
                    // Configure NSS pin
                    PConfig.GPIO_MODE = GPIO_MODE_ALTFN;
                    PConfig.GPIO_PinSpeed = GPIO_SPEED_FAST;
                    PConfig.GPIO_PinNumber = GPIO_PIN_4;
                    PConfig.GPIO_PinPuPdControl = GPIO_PIN_PD;
                    PConfig.GPIO_PinOPType = GPIO_OP_TYPE_PP;
                    PConfig.GPIO_PinAltFunMode = 5;
                    MCAL_GPIO_Init(GPIOA, &PConfig);
                    break;

                case SPI_NSS_Hard_Master_SS_No_output:
                    PConfig.GPIO_MODE = GPIO_MODE_ALTFN;
                    PConfig.GPIO_PinSpeed = GPIO_SPEED_FAST;
                    PConfig.GPIO_PinNumber = GPIO_PIN_4;
                    PConfig.GPIO_PinPuPdControl = GPIO_NO_PUPD;
                    PConfig.GPIO_PinOPType = GPIO_OP_TYPE_PP;
                    PConfig.GPIO_PinAltFunMode = 5;
                    MCAL_GPIO_Init(GPIOA, &PConfig);
                    break;
            }
            // Configure SCK, MISO, and MOSI pins
            PConfig.GPIO_PinNumber = GPIO_PIN_5;
            MCAL_GPIO_Init(GPIOA, &PConfig);  // SCK
            PConfig.GPIO_PinNumber = GPIO_PIN_6;
            MCAL_GPIO_Init(GPIOA, &PConfig);  // MISO
            PConfig.GPIO_PinNumber = GPIO_PIN_7;
            MCAL_GPIO_Init(GPIOA, &PConfig);  // MOSI
        }
        else
        {
            // Slave Mode - Configure NSS, SCK, MISO, and MOSI pins
            PConfig.GPIO_PinNumber = GPIO_PIN_4; // NSS
            MCAL_GPIO_Init(GPIOA, &PConfig);
            PConfig.GPIO_PinNumber = GPIO_PIN_5; // SCK
            MCAL_GPIO_Init(GPIOA, &PConfig);
            PConfig.GPIO_PinNumber = GPIO_PIN_6; // MISO
            MCAL_GPIO_Init(GPIOA, &PConfig);
            PConfig.GPIO_PinNumber = GPIO_PIN_7; // MOSI
            MCAL_GPIO_Init(GPIOA, &PConfig);
        }
    }
    else
    {
        // Configure SPI2 pins: PB12 -> NSS, PB13 -> SCK, PB14 -> MISO, PB15 -> MOSI
        if (Global_SPI_Config[SPI2_Index]->Device_Mode == SPI_Mode_Master)
        {
            switch (Global_SPI_Config[SPI2_Index]->NSS)
            {
                case SPI_NSS_Hard_Master_SS_Output_Enable:
                    PConfig.GPIO_PinNumber = GPIO_PIN_12;
                    MCAL_GPIO_Init(GPIOB, &PConfig); // NSS
                    break;

                case SPI_NSS_Hard_Master_SS_No_output:
                    PConfig.GPIO_PinNumber = GPIO_PIN_12;
                    PConfig.GPIO_PinPuPdControl = GPIO_NO_PUPD;
                    MCAL_GPIO_Init(GPIOB, &PConfig); // NSS
                    break;
            }
            // Configure SCK, MISO, and MOSI pins
            PConfig.GPIO_PinNumber = GPIO_PIN_13;
            MCAL_GPIO_Init(GPIOB, &PConfig);  // SCK
            PConfig.GPIO_PinNumber = GPIO_PIN_14;
            MCAL_GPIO_Init(GPIOB, &PConfig);  // MISO
            PConfig.GPIO_PinNumber = GPIO_PIN_15;
            MCAL_GPIO_Init(GPIOB, &PConfig);  // MOSI
        }
        else
        {
            // Slave Mode - Configure NSS, SCK, MISO, and MOSI pins
            PConfig.GPIO_PinNumber = GPIO_PIN_12; // NSS
            MCAL_GPIO_Init(GPIOB, &PConfig);
            PConfig.GPIO_PinNumber = GPIO_PIN_13; // SCK
            MCAL_GPIO_Init(GPIOB, &PConfig);
            PConfig.GPIO_PinNumber = GPIO_PIN_14; // MISO
            MCAL_GPIO_Init(GPIOB, &PConfig);
            PConfig.GPIO_PinNumber = GPIO_PIN_15; // MOSI
            MCAL_GPIO_Init(GPIOB, &PConfig);
        }
    }
}


/**
 * @brief Transmit and receive data through SPI.
 * 
 * This function handles the transmission and reception of data through the specified SPI peripheral.
 * It writes data to the SPI data register and waits for the transmission and reception to complete.
 * 
 * @param [in] SPIx Pointer to the SPI peripheral (SPI1 or SPI2).
 * @param [in, out] TX_RX_pBuffer Pointer to the data buffer for transmission and reception.
 * @param [in] Polling_En Specifies whether polling should be used (Enabled/Disabled).
 * 
 * @retval None
 */
void MCAL_SPI_Tx_Rx(SPI_TypeDef * SPIX, uint16_t * TX_RX_pBuffer, enum SPI_PollingMechanism Polling_En)
{
    if (Polling_En == Enabled)
    {
        while (!(SPIX->SR & SPI_SR_TXE));  // Wait until TX buffer is empty
    }
    SPIX->DR = *TX_RX_pBuffer;  // Transmit data

    if (Polling_En == Enabled)
    {
        while (!(SPIX->SR & SPI_SR_RXNE));  // Wait for RX buffer to be filled
    }
    *TX_RX_pBuffer = SPIX->DR;  // Receive data
}


/**
 * @brief SPI1 interrupt handler.
 * 
 * This function handles the interrupt for SPI1. It retrieves the interrupt status 
 * (TXE, RXE, and ERRI) and calls the appropriate callback function.
 * 
 * @retval None
 */
void SPI1_IRQHandler(void)
{
    struct S_IRQ_SRC irq_src;
    irq_src.TXE = ((SPI1->SR & (1 << 1)) >> 1);
    irq_src.RXE = ((SPI1->SR & (1 << 0)) >> 0);
    irq_src.ERRI = ((SPI1->SR & (1 << 4)) >> 4);
    Global_SPI_Config[SPI1_Index]->P_IRQ_CallBack(irq_src);
}


/**
 * @brief SPI2 interrupt handler.
 * 
 * This function handles the interrupt for SPI2. It retrieves the interrupt status 
 * (TXE, RXE, and ERRI) and calls the appropriate callback function.
 * 
 * @retval None
 */
void SPI2_IRQHandler(void)
{
    struct S_IRQ_SRC irq_src;
    irq_src.TXE = ((SPI2->SR & (1 << 1)) >> 1);
    irq_src.RXE = ((SPI2->SR & (1 << 0)) >> 0);
    irq_src.ERRI = ((SPI2->SR & (1 << 4)) >> 4);
    Global_SPI_Config[SPI2_Index]->P_IRQ_CallBack(irq_src);
}