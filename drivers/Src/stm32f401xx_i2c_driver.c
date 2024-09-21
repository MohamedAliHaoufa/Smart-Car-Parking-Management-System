/**
 * @file           stm32f401xx_i2c_driver.c
 * @author         Mohamed Ali Haoufa
 * @brief          I2C Peripheral Driver Implementation for STM32F103C6
 * @version        0.1
 * @date           2024-09-21
 *
 * @details
 * This file implements the driver functions for the I2C (Inter-Integrated Circuit)
 * peripheral of the STM32F103C6 microcontroller. The driver includes functions for
 * initialization, de-initialization, data transmission, and reception. Additionally,
 * it provides utility functions to facilitate I2C operations.
 *
 * @copyright      Copyright (c) 2023 Fam Ayman. All rights reserved.
 */
 
#include "stm32f401xx_i2c_driver.h"
#include "stm32f401xx_usart_driver.h"
#include "stm32f401xx_rcc_driver.h"

/*
 * ========================================================
 *                 Generic macros
 * ========================================================
 */
#define I2C1_Index            0       /**< Index for I2C1 peripheral. */
#define I2C2_Index            1       /**< Index for I2C2 peripheral. */

/*
 * ========================================================
 *                 Generic Variables
 * ========================================================
 */
S_I2C_Config_t Global_I2C_Config[2]; /**< Global array to hold I2C configurations. */

/*
 * ========================================================
 *                          APIs
 * ========================================================
 */

/**
 * @brief   Initializes the I2C peripheral.
 * @param   I2Cx: Pointer to the I2C peripheral (I2C1 or I2C2).
 * @param   I2C_Init_Struct: Pointer to the I2C initialization structure.
 * @retval  None
 * @note    This function configures the I2C peripheral according to the specified
 *          parameters and enables the I2C peripheral.
 */
void MCAL_I2C_Init(I2C_TypeDef *I2Cx, S_I2C_Config_t *I2C_Init_Struct)
{
    uint16_t tempreg = 0, freqrange = 0;
    uint32_t Pclk = 8000000;
    uint16_t result = 0;

    if (I2Cx == I2C1)
    {
        Global_I2C_Config[I2C1_Index] = *I2C_Init_Struct;
        MCAL_RCC_Enable_Peripheral(RCC_I2C1);
    }
    else
    {
        Global_I2C_Config[I2C2_Index] = *I2C_Init_Struct;
        MCAL_RCC_Enable_Peripheral(RCC_I2C2);
    }

    if (I2C_Init_Struct->I2C_Mode == I2C_Mode_I2C)
    {
        /* Configure Timing */
        tempreg = I2Cx->CR2;
        tempreg &= ~(I2C_CR2_FREQ_Msk);
        Pclk = MCAL_RCC_GetPCLK1Freq();
        freqrange = (uint16_t)(Pclk / 1000000);
        tempreg |= freqrange;
        I2Cx->CR2 = tempreg;

        /* Configure clock control registers */
        I2Cx->CR1 &= ~(I2C_CR1_PE);
        tempreg = 0;

        if ((I2C_Init_Struct->I2C_Speed == I2C_SCK_SM_50K) || (I2C_Init_Struct->I2C_Speed == I2C_SCK_SM_100K))
        {
            result = (uint16_t)(Pclk / (I2C_Init_Struct->I2C_Speed * 2));
            tempreg = I2Cx->CCR;
            tempreg |= result;
            I2Cx->CCR = tempreg;

            /* Configure I2C_TRISE */
            I2Cx->TRISE = freqrange + 1;
        }
        else
        {
            // Fast mode not supported
        }

        /* Configure CR1 */
        tempreg = I2Cx->CR1;
        tempreg |= (uint16_t)((I2C_Init_Struct->I2C_Ack_Conrtol) | (I2C_Init_Struct->I2C_stretchmode) | (I2C_Init_Struct->I2C_Mode));
        I2Cx->CR1 = tempreg;

        /* Configure OAR2 */
        tempreg = 0;
        if (I2C_Init_Struct->I2C_Slave_address.Enable_Dual_Address == 1)
        {
            tempreg |= I2C_OAR2_ENDUAL;
            tempreg |= (I2C_Init_Struct->I2C_Slave_address.SecondaryAddress << I2C_OAR2_ADD2_Pos);
            I2Cx->OAR2 = tempreg;
        }
        tempreg = 0;
        tempreg |= (I2C_Init_Struct->I2C_Slave_address.PrimaryAddress << 1);
        tempreg |= (I2C_Init_Struct->I2C_Slave_address.I2C_Addressing_Mode << 1);

        // Interrupt mode in case of slave
        if (I2C_Init_Struct->P_Slave_Event_CallBack != NULL)
        {
            I2Cx->CR2 |= I2C_CR2_ITBUFEN;
            I2Cx->CR2 |= I2C_CR2_ITERREN;
            I2Cx->CR2 |= I2C_CR2_ITEVTEN;
        }
        if (I2Cx == I2C1)
        {
            NVIC_IRQ31_I2C1_EV_Enable;
            NVIC_IRQ32_I2C1_ER_Enable;
        }
        else
        {
            NVIC_IRQ33_I2C2_EV_Enable;
            NVIC_IRQ34_I2C2_ER_Enable;
        }
        I2Cx->SR1 = 0x0;
        I2Cx->SR2 = 0x0;
    }
    else
    {
        // Not supported yet
    }

    /* Enable the selected I2C peripheral */
    I2Cx->CR1 |= (I2C_CR1_PE);
}

/**
 * @brief   De-initializes the I2C peripheral.
 * @param   I2Cx: Pointer to the I2C peripheral (I2C1 or I2C2).
 * @retval  None
 * @note    This function disables the I2C peripheral and resets its configuration.
 */
void MCAL_I2C_Deinit(I2C_TypeDef *I2Cx)
{
    if (I2Cx == I2C1)
    {
        NVIC_IRQ31_I2C1_EV_Disable;
        NVIC_IRQ32_I2C1_ER_Disable;
        MCAL_RCC_Reset_Peripheral(RCC_I2C1);
    }
    else
    {
        NVIC_IRQ33_I2C2_EV_Disable;
        NVIC_IRQ34_I2C2_ER_Disable;
        MCAL_RCC_Reset_Peripheral(RCC_I2C2);
    }
}

/**
 * @brief   Configures GPIO pins for I2C functionality.
 * @param   I2Cx: Pointer to the I2C peripheral (I2C1 or I2C2).
 * @retval  None
 * @note    This function configures the GPIO pins associated with the I2C peripheral
 *          for alternate function mode, open-drain configuration, and the appropriate
 *          alternate function number.
 */
void MCAL_I2C_Set_GPIO(I2C_TypeDef *I2Cx)
{
    GPIO_PinConfig_t PConfig;
    if (I2Cx == I2C1)
    {
        /* Configure GPIO for I2C1 */
        PConfig.GPIO_MODE = GPIO_MODE_ALTFN;
        PConfig.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PConfig.GPIO_PinNumber = GPIO_PIN_6;
        PConfig.GPIO_PinPuPdControl = GPIO_NO_PUPD;
        PConfig.GPIO_PinOPType = GPIO_OP_TYPE_OD;
        PConfig.GPIO_PinAltFunMode = 4;
        MCAL_GPIO_Init(GPIOB, &PConfig);
        
        PConfig.GPIO_PinNumber = GPIO_PIN_7;
        MCAL_GPIO_Init(GPIOB, &PConfig);
    }
    else
    {
        /* Configure GPIO for I2C2 */
        PConfig.GPIO_MODE = GPIO_MODE_ALTFN;
        PConfig.GPIO_PinSpeed = GPIO_SPEED_FAST;
        PConfig.GPIO_PinNumber = GPIO_PIN_10;
        PConfig.GPIO_PinPuPdControl = GPIO_NO_PUPD;
        PConfig.GPIO_PinOPType = GPIO_OP_TYPE_OD;
        PConfig.GPIO_PinAltFunMode = 4;
        MCAL_GPIO_Init(GPIOB, &PConfig);
        
        PConfig.GPIO_PinNumber = GPIO_PIN_3;
        MCAL_GPIO_Init(GPIOB, &PConfig);
    }
}

/**
 * @brief Transmits data from the I2C master to a slave device.
 *
 * This function initiates a start condition, sends the address of the slave device, and then transmits data.
 * It supports optional repeated start conditions and the generation of a stop condition after the transmission.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param SlaveAdd The 7-bit address of the slave device.
 * @param dataout Pointer to the data buffer to be transmitted.
 * @param datalen The number of data bytes to transmit.
 * @param Stop Indicates whether to generate a stop condition after transmission.
 * @param start Indicates whether to generate a repeated start condition.
 */
void MCAL_I2C_Master_Tx(I2C_TypeDef * I2Cx,uint16_t SlaveAdd,uint8_t * dataout,uint32_t datalen,StopCondition Stop,Repeated_Start start)
{
	 int i = 0;
	  
	// 1. Set start bit in CR1 to generate Start Condition
	I2C_Generate_Start(I2Cx, ENABLE, start);
	  
	// 2. Wait until event 5
	while (!I2C_Get_FlagStatus(I2Cx, EV5));
	  
	// 3. Send address
	I2C_SendAddress(I2Cx, SlaveAdd, I2C_Direction_Transmitter);
	  
	// 4. Wait for Event 6
	while (!I2C_Get_FlagStatus(I2Cx, EV6));
	  
	// 5. Wait until Master Byte Transmitting flag is set
	while (!I2C_Get_FlagStatus(I2Cx, Master_Byte_Transmitting));
	/*
	// Sending data to the slave
        for (i = 0; i < datalen; i++) {
            I2Cx->DR = dataout[++i];
            while (!I2C_Get_FlagStatus(I2Cx, EV8));
        }
	*/
	// Sending data to the slave
	I2Cx->DR = dataout[i]; // Sending the MSB of the address
	for(int j=0; j<5000;j++);
	while(!I2C_Get_FlagStatus(I2Cx, EV8));
	for(int j=0; j<5000;j++);
	for(int j=0; j<5000;j++);

	I2Cx->DR = dataout[++i]; // Sending the LSB of the address
	for(int j=0; j<5000;j++);
	while(!I2C_Get_FlagStatus(I2Cx, EV8));
	for(int j=0; j<5000;j++);
	for(int j=0; j<5000;j++);
	
	if(datalen >2){

	   // Sending data bytes
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	if(datalen >15){ 
	
	   // If datalen > 15, send additional data bytes
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);

	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	   
	   I2Cx->DR = dataout[++i];
	   for(int j=0; j<5000;j++);
	   while(!I2C_Get_FlagStatus(I2Cx, EV8));
	   for(int j=0; j<5000;j++);
	   for(int j=0; j<5000;j++);
	  }
	 }

	//===========================Sending_Stop=====================================================//
	if(Stop == WithStop)
	{
		I2C_Generate_Stop(I2Cx,ENABLE);
		for(int j; j<5000;j++);
		for(int j; j<5000;j++);
	}

}

/**
 * @brief Receives data from an I2C slave device.
 *
 * This function initiates a start condition, sends the address of the slave device for receiving, and then receives data.
 * It supports optional stop conditions after the reception.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param SlaveAdd The 7-bit address of the slave device.
 * @param dataout Pointer to the buffer where received data will be stored.
 * @param datalen The number of data bytes to receive.
 * @param Stop Indicates whether to generate a stop condition after reception.
 * @param start Indicates whether to generate a repeated start condition.
 */
void MCAL_I2C_Master_Rx(I2C_TypeDef *I2Cx, uint16_t SlaveAdd, uint8_t *dataout, uint32_t datalen, StopCondition Stop, Repeated_Start start)
{
    uint32_t i = datalen;
    
    // Enable acknowledgment
    I2C_ACKnowlageConfig(I2Cx, ENABLE);
    
    // 1. Set start bit in CR1 to generate Start Condition
    I2C_Generate_Start(I2Cx, ENABLE, start);
    
    // 2. Wait until event 5
    while (!I2C_Get_FlagStatus(I2Cx, EV5));
    
    // 3. Send address
    I2C_SendAddress(I2Cx, SlaveAdd, I2C_Direction_Receiver);
    
    // 4. Wait for Event 6
    while (!I2C_Get_FlagStatus(I2Cx, EV6));
    
    // Receive data bytes
    while (i--) {
        while (!I2C_Get_FlagStatus(I2Cx, EV7));
        *dataout++ = I2Cx->DR;
        if (i == 1) {
            // Disable acknowledgment after receiving the last byte
            I2C_ACKnowlageConfig(I2Cx, DISABLE);
        }
    }

    // 5. Send stop condition if requested
    if (Stop == WithStop) {
        I2C_Generate_Stop(I2Cx, ENABLE);
    }
}

/**
 * @brief Generates a start condition or a repeated start condition.
 *
 * This function sets the START bit in the I2C_CR1 register to generate a start condition. If the start condition
 * is repeated, it waits for the I2C bus to be free before generating the start condition.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param state The state to enable or disable the start condition.
 * @param start Indicates whether to generate a repeated start condition.
 */
void I2C_Generate_Start(I2C_TypeDef *I2Cx, Functional_State state, Repeated_Start start)
{
    if (start == Repeated) {
        while (I2C_Get_FlagStatus(I2Cx, I2C_Flag_Busy));
    }
    
    if (state == ENABLE) {
        I2Cx->CR1 |= I2C_CR1_START;
    } else {
        I2Cx->CR1 &= ~I2C_CR1_START;
    }
}

/**
 * @brief Configures the acknowledgment feature of the I2C peripheral.
 *
 * This function enables or disables the acknowledgment feature of the I2C peripheral.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param NewState The state to enable or disable acknowledgment.
 */
void I2C_ACKnowlageConfig(I2C_TypeDef *I2Cx, Functional_State NewState)
{
    if (NewState != DISABLE) {
        I2Cx->CR1 |= I2C_CR1_ACK;
    } else {
        I2Cx->CR1 &= ~I2C_CR1_ACK;
    }
}

/**
 * @brief Checks the status of I2C flags.
 *
 * This function returns the status of the specified I2C flag.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param flag The flag to check.
 * @return FlagStatus The status of the specified flag (Set or Reset).
 */
FlagStatus I2C_Get_FlagStatus(I2C_TypeDef *I2Cx, Status flag)
{
    FlagStatus Flag = Reset;
    uint32_t flag1 = 0, flag2 = 0;
    uint32_t Last_Event;
    
    switch (flag) {
        case I2C_Flag_Busy:
            Flag = ((I2Cx->SR2 & I2C_SR2_BUSY) != 0) ? Set : Reset;
            break;
        
        case EV5:
            Flag = ((I2Cx->SR1 & I2C_SR1_SB) != 0) ? Set : Reset;
            break;
        
        case EV6:
            Flag = ((I2Cx->SR1 & I2C_SR1_ADDR) != 0) ? Set : Reset;
            break;
        
        case Master_Byte_Transmitting:
            flag1 = I2Cx->SR1;
            flag2 = I2Cx->SR2 << 16;
            Last_Event = (flag1 | flag2) & 0x00FFFFFF;
            Flag = ((Last_Event & flag) == flag) ? Set : Reset;
            break;
        
        case EV8:
        case EV8_1:
            Flag = ((I2Cx->SR1 & I2C_SR1_TXE) != 0) ? Set : Reset;
            break;
        
        case EV7:
            Flag = ((I2Cx->SR1 & I2C_SR1_RXNE) != 0) ? Set : Reset;
            break;
    }
    
    return Flag;
}

/**
 * @brief Sends a 7-bit slave address to the I2C peripheral.
 *
 * This function sends the 7-bit slave address along with the read/write bit to the I2C peripheral.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param SlaveAddress The 7-bit slave address to be sent.
 * @param Direction The direction of communication (transmit or receive).
 */
void I2C_SendAddress(I2C_TypeDef *I2Cx, uint16_t SlaveAddress, I2C_Direction Direction)
{
    SlaveAddress <<= 1;
    
    if (Direction != I2C_Direction_Transmitter) {
        SlaveAddress |= 1;
    }
    
    I2Cx->DR = SlaveAddress;
}

/**
 * @brief Generates a stop condition on the I2C bus.
 *
 * This function sets the STOP bit in the I2C_CR1 register to generate a stop condition.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param NewState The state to enable or disable the stop condition.
 */
void I2C_Generate_Stop(I2C_TypeDef *I2Cx, Functional_State NewState)
{
    if (NewState != DISABLE) {
        I2Cx->CR1 |= I2C_CR1_STOP;
    } else {
        I2Cx->CR1 &= ~I2C_CR1_STOP;
    }
}

/**
 * @brief Sends a single byte of data in slave mode.
 *
 * This function sends a byte of data from the I2C slave device.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @param data The byte of data to be sent.
 */
void MCAL_I2C_Slave_SendData(I2C_TypeDef *I2Cx, uint8_t data)
{
    I2Cx->DR = data;
}

/**
 * @brief Receives a single byte of data in slave mode.
 *
 * This function receives a byte of data from the I2C slave device.
 *
 * @param I2Cx Pointer to the I2C peripheral instance.
 * @return uint8_t The received byte of data.
 */
uint8_t MCAL_I2C_SlaveReceiveData(I2C_TypeDef *I2Cx)
{
    return I2Cx->DR;
}
