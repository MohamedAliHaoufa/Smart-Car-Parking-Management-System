/**
 * @file lcd_driver.c  
 * @author Mohamed Ali Haoufa
 * @brief Contains functions for controlling an LCD using an STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file implements the LCD driver functions including initialization,
 * sending commands, characters, and strings to the LCD, and controlling
 * the cursor position. It uses GPIOs of the STM32F401xx microcontroller
 * for communication with the LCD.
 *
 * @copyright Copyright (c) 2024
 *
 */

#include "lcd_driver.h"

/**
 * @brief Initializes GPIO pins for LCD operation.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * 
 * This function configures the GPIO pins connected to the LCD as output pins.
 * The pins are initialized according to the mode of the LCD (8-bit or 4-bit).
 */
static void LCD_GPIO_Init(LCD_t* LCD_cfg){
	GPIO_PinConfig_t PIN_CFG;
	PIN_CFG.GPIO_MODE = GPIO_MODE_OUT;
	PIN_CFG.GPIO_PinOPType = GPIO_OP_TYPE_PP;
	PIN_CFG.GPIO_PinPuPdControl = GPIO_NO_PUPD;
	PIN_CFG.GPIO_PinSpeed = GPIO_SPEED_FAST;

	PIN_CFG.GPIO_PinNumber = LCD_cfg->RS_PIN;
	MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

	PIN_CFG.GPIO_PinNumber = LCD_cfg->EN_PIN;
	MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

	if (LCD_8BIT == LCD_cfg->Mode) {
		PIN_CFG.GPIO_PinNumber = LCD_cfg->D0_PIN;
		MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

		PIN_CFG.GPIO_PinNumber = LCD_cfg->D1_PIN;
		MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

		PIN_CFG.GPIO_PinNumber = LCD_cfg->D2_PIN;
		MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

		PIN_CFG.GPIO_PinNumber = LCD_cfg->D3_PIN;
		MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);
	}
	PIN_CFG.GPIO_PinNumber = LCD_cfg->D4_PIN;
	MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

	PIN_CFG.GPIO_PinNumber = LCD_cfg->D5_PIN;
	MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

	PIN_CFG.GPIO_PinNumber = LCD_cfg->D6_PIN;
	MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);

	PIN_CFG.GPIO_PinNumber = LCD_cfg->D7_PIN;
	MCAL_GPIO_Init(LCD_cfg->GPIO_PORT, &PIN_CFG);
}

/**
 * @brief Initializes the LCD based on user-defined configurations.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * 
 * This function initializes the LCD by setting up the GPIO pins, sending
 * function set commands, and configuring display and entry modes. It also
 * clears the display.
 * 
 * @note User must set configurations as defined in @ref LCD_CONFIG_define.
 */
void LCD_Init(LCD_t* LCD_cfg){
	LCD_GPIO_Init(LCD_cfg);
	MCAL_STK_Delay1ms(2);

	if (LCD_8BIT == LCD_cfg->Mode) {
		LCD_Send_Command(LCD_cfg, LCD_8BIT_MODE_2_LINE);
		MCAL_STK_Delay1ms(1);
	}
	else if (LCD_4BIT == LCD_cfg->Mode) {
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->RS_PIN, GPIO_PIN_RESET);
		MCAL_STK_Delay1ms(1);

		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (LCD_4BIT_MODE_2_LINE & 0x10));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (LCD_4BIT_MODE_2_LINE & 0x20));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (LCD_4BIT_MODE_2_LINE & 0x40));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (LCD_4BIT_MODE_2_LINE & 0x80));
		MCAL_STK_Delay1ms(1);
		LCD_Send_Enable_Signal(LCD_cfg);

		LCD_Send_Command(LCD_cfg, LCD_4BIT_MODE_2_LINE);
		MCAL_STK_Delay1ms(1);
	}
	LCD_Send_Command(LCD_cfg, LCD_cfg->Display_Mode);
	MCAL_STK_Delay1ms(1);

	LCD_Send_Command(LCD_cfg, LCD_CLEAR_DISPLAY);
	MCAL_STK_Delay1ms(2);

	LCD_Send_Command(LCD_cfg, LCD_cfg->Entry_Mode);
	MCAL_STK_Delay1ms(1);
}

/**
 * @brief Sends a command to the LCD.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @param [in] command Command to be executed as defined in @ref LCD_COMMANDS_define.
 * 
 * This function sends a command to the LCD for execution. The command is sent
 * in either 8-bit or 4-bit mode depending on the LCD configuration.
 */
void LCD_Send_Command(LCD_t* LCD_cfg, uint8 command){
	MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->RS_PIN, GPIO_PIN_RESET);
	MCAL_STK_Delay1ms(1);

	if (LCD_8BIT == LCD_cfg->Mode) {
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D0_PIN, (command & 0x01));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D1_PIN, (command & 0x02));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D2_PIN, (command & 0x04));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D3_PIN, (command & 0x08));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (command & 0x10));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (command & 0x20));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (command & 0x40));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (command & 0x80));
	}
	else if (LCD_4BIT == LCD_cfg->Mode) {
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (command & 0x10));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (command & 0x20));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (command & 0x40));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (command & 0x80));
		LCD_Send_Enable_Signal(LCD_cfg);
		MCAL_STK_Delay1ms(1);
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (command & 0x01));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (command & 0x02));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (command & 0x04));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (command & 0x08));
	}
	MCAL_STK_Delay1ms(1);
	LCD_Send_Enable_Signal(LCD_cfg);
	MCAL_STK_Delay1ms(100);
}

/**
 * @brief Sends a character to the LCD to be displayed.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @param [in] Char ASCII character to be displayed.
 * 
 * This function sends a character to the LCD to be displayed. The character
 * is sent in either 8-bit or 4-bit mode depending on the LCD configuration.
 */
void LCD_Send_Char(LCD_t* LCD_cfg, uint8 Char){
	MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->RS_PIN, GPIO_PIN_SET);
	MCAL_STK_Delay1ms(1);

	if (LCD_8BIT == LCD_cfg->Mode) {
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D0_PIN, (Char & 0x01));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D1_PIN, (Char & 0x02));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D2_PIN, (Char & 0x04));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D3_PIN, (Char & 0x08));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (Char & 0x10));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (Char & 0x20));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (Char & 0x40));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (Char & 0x80));
	}
	else if (LCD_4BIT == LCD_cfg->Mode) {
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (Char & 0x10));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (Char & 0x20));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (Char & 0x40));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (Char & 0x80));
		LCD_Send_Enable_Signal(LCD_cfg);
		MCAL_STK_Delay1ms(1);
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D4_PIN, (Char & 0x01));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D5_PIN, (Char & 0x02));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D6_PIN, (Char & 0x04));
		MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->D7_PIN, (Char & 0x08));
	}
	MCAL_STK_Delay1ms(1);
	LCD_Send_Enable_Signal(LCD_cfg);
	MCAL_STK_Delay1ms(100);
}

/**
 * @brief Sends a character to the LCD to be displayed at a specific location.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @param [in] Char ASCII character to be displayed on the screen.
 * @param [in] row Selects the row number of the displayed character (@ref LCD_ROWS_POS_define).
 * @param [in] column Selects the column number of the displayed character (1...16).
 * @return None
 * 
 * This function sets the cursor to the specified row and column and sends the given character
 * to the LCD for display.
 */
void LCD_Send_Char_Pos(LCD_t* LCD_cfg, uint8 Char, uint8 row, uint8 column){
	LCD_Set_Cursor(LCD_cfg, row, column);
	LCD_Send_Char(LCD_cfg, Char);
}

/**
 * @brief Sends a string to the LCD to be displayed.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @param [in] string Pointer to a string of characters to be displayed on the LCD.
 * @return None
 * 
 * This function sends a string to the LCD, character by character, until the null-terminator
 * is encountered.
 */
void LCD_Send_String(LCD_t* LCD_cfg, uint8 *string){
	int count = 0;
	for(; string[count] != '\0'; count++){
		LCD_Send_Char(LCD_cfg, string[count]);
	}
}

/**
 * @brief Sends a string to the LCD to be displayed at a specific location.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @param [in] string Pointer to a string of characters to be displayed on the LCD.
 * @param [in] row Selects the row number of the displayed character (@ref LCD_ROWS_POS_define).
 * @param [in] column Selects the column number of the displayed character (1...16).
 * @return None
 * 
 * This function sets the cursor to the specified row and column, then sends the given string
 * to the LCD for display.
 */
void LCD_Send_String_Pos(LCD_t* LCD_cfg, uint8 *string, uint8 row, uint8 column){
	LCD_Set_Cursor(LCD_cfg, row, column);
	LCD_Send_String(LCD_cfg, string);
}

/**
 * @brief Sends an enable signal to the LCD.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @return None
 * 
 * This function generates an enable pulse for the LCD by toggling the enable pin.
 */
void LCD_Send_Enable_Signal(LCD_t* LCD_cfg){
	MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->EN_PIN, GPIO_PIN_SET);
	MCAL_STK_Delay1ms(1);
	MCAL_GPIO_WritePin(LCD_cfg->GPIO_PORT, LCD_cfg->EN_PIN, GPIO_PIN_RESET);
	MCAL_STK_Delay1ms(1);
}

/**
 * @brief Sets the location of the cursor on the LCD.
 * @param [in] LCD_cfg Pointer to the structure containing LCD configuration.
 * @param [in] row Selects the row number of the displayed character (@ref LCD_ROWS_POS_define).
 * @param [in] column Selects the column number of the displayed character (1...16).
 * @return None
 * 
 * This function sets the cursor position to the specified row and column by sending the
 * appropriate command to the LCD.
 */
void LCD_Set_Cursor(LCD_t* LCD_cfg, uint8 row, uint8 column){
	column--;
	LCD_Send_Command(LCD_cfg, row + column);
}