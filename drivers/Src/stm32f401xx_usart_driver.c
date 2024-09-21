/**
 * @file USART_driver.c
 * @author Mohamed Ali Haoufa
 * @brief USART driver for STM32F401xx microcontroller.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file contains functions and macros for configuring and controlling
 * the USART (Universal Synchronous/Asynchronous Receiver/Transmitter) peripherals
 * of the STM32F401xx microcontroller. It supports initialization, deinitialization,
 * and GPIO pin configuration for USART1, USART2, and USART6.
 *
 * @copyright Copyright (c) 2024
 *
 */

#include "stm32f401xx_usart_driver.h"

/** @brief Macro to calculate the USART baud rate register value.
 * 
 * This macro computes the value to be loaded into the USART baud rate register
 * based on the peripheral clock and the desired baud rate.
 * 
 * @param _PCLK_ Peripheral clock frequency.
 * @param _BAUD_ Desired baud rate.
 * @return USART baud rate register value.
 */
#define USARTDIV(_PCLK_, _BAUD_)            (uint32)(_PCLK_/(16 * _BAUD_))
#define USARTDIV_MUL100(_PCLK_, _BAUD_)     (uint32)((25 * _PCLK_) / (4 * _BAUD_))
#define MANTISSA(_PCLK_, _BAUD_)            (uint32)(USARTDIV(_PCLK_, _BAUD_))
#define MANTISSA_MUL100(_PCLK_, _BAUD_)     (uint32)(USARTDIV(_PCLK_, _BAUD_) * 100)
#define DIV_FRACTION(_PCLK_, _BAUD_)        (uint32)(((USARTDIV_MUL100(_PCLK_, _BAUD_) - MANTISSA_MUL100(_PCLK_, _BAUD_)) * 16) / 100)
#define UART_BRR_REGISTER(_PCLK_, _BAUD_)   (uint32)((MANTISSA(_PCLK_, _BAUD_) << 4)|(DIV_FRACTION(_PCLK_, _BAUD_)&0xF))

/* Global variables */
static USART_cfg_t Global_USART_cfg[3];

/**
 * @brief Initializes the specified USART peripheral.
 * 
 * This function configures the USART peripheral based on the settings provided
 * in the USART configuration structure. It supports asynchronous mode and sets
 * up the necessary GPIO pins.
 * 
 * @param [in] USARTx Pointer to the USART peripheral instance (USART1, USART2, or USART6).
 * @param [in] USART_cfg Pointer to the USART configuration structure.
 * @return None
 * @note Supports asynchronous mode only with an 8MHz clock.
 */
void MCAL_USART_Init(USART_TypeDef* USARTx, USART_cfg_t* USART_cfg) {
    uint32 BRR, pclk;

    /* Enable clock for the specified USART peripheral */
    if (USART1 == USARTx) {
        MCAL_RCC_Enable_Peripheral(RCC_USART1);
        Global_USART_cfg[0] = *USART_cfg;
    } else if (USART2 == USARTx) {
        MCAL_RCC_Enable_Peripheral(RCC_USART2);
        Global_USART_cfg[1] = *USART_cfg;
    } else if (USART6 == USARTx) {
        MCAL_RCC_Enable_Peripheral(RCC_USART6);
        Global_USART_cfg[2] = *USART_cfg;
    } else {
        /* Do nothing */
    }

    /* Enable UART */
    USARTx->CR1 |= (1U << 13);

    /* Configure USART TX and RX according to the USART_Mode setting */
    USARTx->CR1 |= USART_cfg->USART_Mode;

    /* Set payload width */
    USARTx->CR1 |= USART_cfg->Payload_Length;

    /* Configure parity control */
    USARTx->CR1 |= USART_cfg->Parity;

    /* Set the number of stop bits */
    USARTx->CR2 |= USART_cfg->StopBits;

    /* Configure hardware flow control */
    USARTx->CR3 |= USART_cfg->HwFlowCtl;

    /* Set baud rate */
    if (USART1 == USARTx) {
        pclk = MCAL_RCC_GetPCLK2Freq();
    } else {
        pclk = MCAL_RCC_GetPCLK1Freq();
    }
    BRR = UART_BRR_REGISTER(pclk, USART_cfg->BaudRate);
    USARTx->BRR = BRR;

    /* Configure interrupts */
    if (UART_IRQ_Enable_NONE != USART_cfg->IRQ_Enable) {
        USARTx->CR1 |= USART_cfg->IRQ_Enable;

        /* Enable NVIC for the specified USART IRQ */
        if (USART1 == USARTx) {
            MCAL_NVIC_EnableIRQ(USART1_IRQ);
        } else if (USART2 == USARTx) {
            MCAL_NVIC_EnableIRQ(USART2_IRQ);
        } else if (USART6 == USARTx) {
            MCAL_NVIC_EnableIRQ(USART6_IRQ);
        } else {
            /* Do nothing */
        }
    } else {
        /* Do nothing */
    }

    MCAL_USART_GPIO_Set_Pins(USARTx);
}

/**
 * @brief Deinitializes the specified USART peripheral.
 * 
 * This function resets the USART peripheral and disables its associated NVIC interrupt.
 * 
 * @param [in] USARTx Pointer to the USART peripheral instance (USART1, USART2, or USART6).
 * @return None
 */
void MCAL_USART_DeInit(USART_TypeDef* USARTx) {
    if (USART1 == USARTx) {
        MCAL_RCC_Reset_Peripheral(RCC_USART1);
        MCAL_NVIC_DisableIRQ(USART1_IRQ);
    } else if (USART2 == USARTx) {
        MCAL_RCC_Reset_Peripheral(RCC_USART2);
        MCAL_NVIC_DisableIRQ(USART2_IRQ);
    } else if (USART6 == USARTx) {
        MCAL_RCC_Reset_Peripheral(RCC_USART6);
        MCAL_NVIC_DisableIRQ(USART6_IRQ);
    } else {
        /* Do nothing */
    }
}

/**
 * @brief Configures GPIO pins for the specified USART peripheral.
 * 
 * This function sets up the GPIO pins used by the USART peripheral, including TX, RX,
 * and optional CTS/RTS pins, depending on the hardware flow control settings.
 * 
 * @param [in] USARTx Pointer to the USART peripheral instance (USART1, USART2, or USART6).
 * @return None
 * @note Called automatically at the end of MCAL_USART_Init().
 */
void MCAL_USART_GPIO_Set_Pins(USART_TypeDef* USARTx) {
    GPIO_PinConfig_t PinCfg;

    if (USART1 == USARTx) {
        /* PA9 TX, PA10 RX, PA11 CTS, PA12 RTS */
        MCAL_RCC_Enable_Peripheral(RCC_GPIOA);

        /* PA9 TX */
        PinCfg.GPIO_PinNumber = GPIO_PIN_9;
        PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
        PinCfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
        PinCfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
        PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PinCfg.GPIO_PinAltFunMode = 7;
        MCAL_GPIO_Init(GPIOA, &PinCfg);

        /* PA10 RX */
        PinCfg.GPIO_PinNumber = GPIO_PIN_10;
        PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
        PinCfg.GPIO_PinPuPdControl = GPIO_PIN_PU;
        PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PinCfg.GPIO_PinAltFunMode = 7;
        MCAL_GPIO_Init(GPIOA, &PinCfg);

        if ((UART_HwFlowCtl_CTS == Global_USART_cfg[0].HwFlowCtl) || (UART_HwFlowCtl_RTS_CTS == Global_USART_cfg[0].HwFlowCtl)) {
            /* PA11 CTS */
            PinCfg.GPIO_PinNumber = GPIO_PIN_11;
            PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
            PinCfg.GPIO_PinPuPdControl = GPIO_PIN_PU;
            PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
            PinCfg.GPIO_PinAltFunMode = 7;
            MCAL_GPIO_Init(GPIOA, &PinCfg);
        }

        if ((UART_HwFlowCtl_RTS == Global_USART_cfg[0].HwFlowCtl) || (UART_HwFlowCtl_RTS_CTS == Global_USART_cfg[0].HwFlowCtl)) {
            /* PA12 RTS */
            PinCfg.GPIO_PinNumber = GPIO_PIN_12;
            PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
            PinCfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
            PinCfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
            PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
            PinCfg.GPIO_PinAltFunMode = 7;
            MCAL_GPIO_Init(GPIOA, &PinCfg);
        }
    } else if (USART2 == USARTx) {
        /* PA0 CTS, PA1 RTS, PA2 TX, PA3 RX */
        MCAL_RCC_Enable_Peripheral(RCC_GPIOA);

        /* PA2 TX */
        PinCfg.GPIO_PinNumber = GPIO_PIN_2;
        PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
        PinCfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
        PinCfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
        PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PinCfg.GPIO_PinAltFunMode = 7;
        MCAL_GPIO_Init(GPIOA, &PinCfg);

        /* PA3 RX */
        PinCfg.GPIO_PinNumber = GPIO_PIN_3;
        PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
        PinCfg.GPIO_PinPuPdControl = GPIO_PIN_PU;
        PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PinCfg.GPIO_PinAltFunMode = 7;
        MCAL_GPIO_Init(GPIOA, &PinCfg);

        if ((UART_HwFlowCtl_CTS == Global_USART_cfg[1].HwFlowCtl) || (UART_HwFlowCtl_RTS_CTS == Global_USART_cfg[1].HwFlowCtl)) {
            /* PA0 CTS */
            PinCfg.GPIO_PinNumber = GPIO_PIN_0;
            PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
            PinCfg.GPIO_PinPuPdControl = GPIO_PIN_PU;
            PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
            PinCfg.GPIO_PinAltFunMode = 7;
            MCAL_GPIO_Init(GPIOA, &PinCfg);
        }

        if ((UART_HwFlowCtl_RTS == Global_USART_cfg[1].HwFlowCtl) || (UART_HwFlowCtl_RTS_CTS == Global_USART_cfg[1].HwFlowCtl)) {
            /* PA1 RTS */
            PinCfg.GPIO_PinNumber = GPIO_PIN_1;
            PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
            PinCfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
            PinCfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
            PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
            PinCfg.GPIO_PinAltFunMode = 7;
            MCAL_GPIO_Init(GPIOA, &PinCfg);
        }
    } else if (USART6 == USARTx) {
        /* PC6 TX, PC7 RX */
        MCAL_RCC_Enable_Peripheral(RCC_GPIOC);

        /* PC6 TX */
        PinCfg.GPIO_PinNumber = GPIO_PIN_6;
        PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
        PinCfg.GPIO_PinOPType = GPIO_OP_TYPE_PP;
        PinCfg.GPIO_PinPuPdControl = GPIO_NO_PUPD;
        PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PinCfg.GPIO_PinAltFunMode = 8;
        MCAL_GPIO_Init(GPIOC, &PinCfg);

        /* PC7 RX */
        PinCfg.GPIO_PinNumber = GPIO_PIN_7;
        PinCfg.GPIO_MODE = GPIO_MODE_ALTFN;
        PinCfg.GPIO_PinPuPdControl = GPIO_PIN_PU;
        PinCfg.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PinCfg.GPIO_PinAltFunMode = 8;
        MCAL_GPIO_Init(GPIOC, &PinCfg);
    } else {
        /* Do nothing */
    }
}


/**
 * @brief       Send data via USART.
 * @param [in]  USARTx        Pointer to the USART peripheral instance (USART1, USART2, USART6).
 * @param [in]  pTxBuffer     Pointer to the buffer containing data to be transmitted.
 * @param [in]  PollingEn     Enable or disable polling mechanism.
 * @return     None
 * @note        Ensure UART is initialized before calling this function.
 *              When transmitting with parity enabled (PCE bit set in USART_CR1), 
 *              the MSB (bit 7 or 8, depending on data length) is replaced by the parity bit.
 *              When receiving with parity enabled, the MSB bit represents the parity bit.
 */
void MCAL_USART_SendData(USART_TypeDef* USARTx, uint16 *pTxBuffer, Polling_Mechanism PollingEn) {
    if (enable == PollingEn) {
        /* Wait until transmission buffer is empty */
        while (!(USARTx->SR & (1 << 7)));
    } else {
        /* Do nothing */
    }

    /* Select appropriate data length and write to data register */
    if (USART1 == USARTx) {
        USARTx->DR = (*pTxBuffer & (Global_USART_cfg[0].Payload_Length == UART_Payload_Length_9B ? 0x01FF : 0xFF));
    } else if (USART2 == USARTx) {
        USARTx->DR = (*pTxBuffer & (Global_USART_cfg[1].Payload_Length == UART_Payload_Length_9B ? 0x01FF : 0xFF));
    } else if (USART6 == USARTx) {
        USARTx->DR = (*pTxBuffer & (Global_USART_cfg[2].Payload_Length == UART_Payload_Length_9B ? 0x01FF : 0xFF));
    } else {
        /* Do nothing */
    }
}

/**
 * @brief       Send a string via USART.
 * @param [in]  USARTx        Pointer to the USART peripheral instance (USART1, USART2, USART6).
 * @param [in]  str           Pointer to the string to be transmitted.
 * @param [in]  str_len       Length of the string to be transmitted (0 for null-terminated strings).
 * @return     None
 * @note        Ensure UART is initialized before calling this function.
 *              This function uses polling mechanism for transmission.
 */
void MCAL_USART_SendString(USART_TypeDef* USARTx, uint8 *str, uint8 str_len) {
    if (str_len) {
        /* Send string with predefined length */
        for (uint8 i = 0; i < str_len; i++) {
            MCAL_USART_SendData(USARTx, (uint16*)(&(str[i])), enable);
        }
    } else {
        /* Send null-terminated string */
        while (*str) {
            MCAL_USART_SendData(USARTx, (uint16*)str, enable);
            MCAL_USART_Wait_TC(USARTx);  // Wait for transmission complete
            str++;
        }
    }
}

/**
 * @brief       Receive data via USART.
 * @param [in]  USARTx        Pointer to the USART peripheral instance (USART1, USART2, USART6).
 * @param [in]  pRxBuffer     Pointer to the buffer where received data will be stored.
 * @param [in]  PollingEn     Enable or disable polling mechanism.
 * @return     None
 * @note        Ensure UART is initialized before calling this function.
 *              When receiving with parity enabled (PCE bit set in USART_CR1),
 *              the MSB bit represents the parity bit.
 */
void MCAL_USART_ReceiveData(USART_TypeDef* USARTx, uint16 *pRxBuffer, Polling_Mechanism PollingEn) {
    if (enable == PollingEn) {
        /* Wait until data is received */
        while (!(USARTx->SR & (1 << 5)));
    } else {
        /* Do nothing */
    }

    /* Check word length and read from data register */
    if (USART1 == USARTx) {
        *pRxBuffer = (Global_USART_cfg[0].Payload_Length == UART_Payload_Length_9B) ?
                     (Global_USART_cfg[0].Parity == UART_Parity_NONE ? USARTx->DR : (USARTx->DR & 0xFF)) :
                     (Global_USART_cfg[0].Parity == UART_Parity_NONE ? (USARTx->DR & 0xFF) : (USARTx->DR & 0x7F));
    } else if (USART2 == USARTx) {
        *pRxBuffer = (Global_USART_cfg[1].Payload_Length == UART_Payload_Length_9B) ?
                     (Global_USART_cfg[1].Parity == UART_Parity_NONE ? USARTx->DR : (USARTx->DR & 0xFF)) :
                     (Global_USART_cfg[1].Parity == UART_Parity_NONE ? (USARTx->DR & 0xFF) : (USARTx->DR & 0x7F));
    } else if (USART6 == USARTx) {
        *pRxBuffer = (Global_USART_cfg[2].Payload_Length == UART_Payload_Length_9B) ?
                     (Global_USART_cfg[2].Parity == UART_Parity_NONE ? USARTx->DR : (USARTx->DR & 0xFF)) :
                     (Global_USART_cfg[2].Parity == UART_Parity_NONE ? (USARTx->DR & 0xFF) : (USARTx->DR & 0x7F));
    } else {
        /* Do nothing */
    }
}

/**
 * @brief       Receive a buffer of data via USART.
 * @param [in]  USARTx        Pointer to the USART peripheral instance (USART1, USART2, USART6).
 * @param [in]  pRxBuffer     Pointer to the buffer where received data will be stored.
 * @param [in]  length        Length of data to be received (0 to receive until carriage return '\r').
 * @return     None
 * @note        Ensure UART is initialized before calling this function.
 *              Uses polling mechanism for data reception.
 */
void MCAL_USART_ReceiveBuffer(USART_TypeDef* USARTx, uint16 *pRxBuffer, uint8 length) {
    uint8 temp;
    if (length) {
        /* Receive predefined length of data */
        for (uint8 i = 0; i < length; i++) {
            MCAL_USART_ReceiveData(USARTx, (uint16*)(&(pRxBuffer[i])), enable);
        }
    } else {
        /* Receive data until carriage return '\r' is encountered */
        while (1) {
            MCAL_USART_ReceiveData(USARTx, (uint16*)(&temp), enable);
            if (temp == '\r') {
                break;
            } else {
                *pRxBuffer++ = temp;
            }
        }
    }
}
/**
 * @file usart_interrupts.c
 * @author Mohamed Ali Haoufa
 * @brief USART Interrupt Handlers and Transmission Completion Wait Function
 * @version 1.0
 * @date 2024-09-14
 *
 * This file contains functions for USART interrupt handling and waiting for transmission completion.
 * It includes a function to wait until the transmission is complete by polling the TC (Transmission Complete) flag,
 * and ISR (Interrupt Service Routine) functions for USART1, USART2, and USART6.
 *
 * @copyright Copyright (c) 2024
 */

/**
 * @brief Waits until transmission is completed by polling the TC (Transmission Complete) flag.
 * @param [in] USARTx Pointer to the USART peripheral instance. It can be one of the following: USART1, USART2, or USART6.
 * @return None
 * @note This function continuously polls the TC flag in the SR (Status Register) until the flag is set, indicating that
 *       the transmission is complete.
 */
void MCAL_USART_Wait_TC(USART_TypeDef* USARTx) {
    /* Wait until TC flag is set in the SR */
    while (!(USARTx->SR & (1 << 6)));
}

/**
 * @brief USART1 Interrupt Service Routine (ISR)
 * @return None
 * @note Clears the pending IRQ for USART1 and calls the registered IRQ callback function if it is set.
 */
void USART1_IRQHandler(void) {
    MCAL_NVIC_ClearPendingIRQ(USART1_IRQ);

    if (Global_USART_cfg[0].P_IRQ_CallBack) {
        Global_USART_cfg[0].P_IRQ_CallBack();
    } else {
        /* No action if no callback function is set */
    }
}

/**
 * @brief USART2 Interrupt Service Routine (ISR)
 * @return None
 * @note Clears the pending IRQ for USART2 and calls the registered IRQ callback function if it is set.
 */
void USART2_IRQHandler(void) {
    MCAL_NVIC_ClearPendingIRQ(USART2_IRQ);

    if (Global_USART_cfg[1].P_IRQ_CallBack) {
        Global_USART_cfg[1].P_IRQ_CallBack();
    } else {
        /* No action if no callback function is set */
    }
}

/**
 * @brief USART6 Interrupt Service Routine (ISR)
 * @return None
 * @note Clears the pending IRQ for USART6 and calls the registered IRQ callback function if it is set.
 */
void USART6_IRQHandler(void) {
    MCAL_NVIC_ClearPendingIRQ(USART6_IRQ);

    if (Global_USART_cfg[2].P_IRQ_CallBack) {
        Global_USART_cfg[2].P_IRQ_CallBack();
    } else {
        /* No action if no callback function is set */
    }
}

