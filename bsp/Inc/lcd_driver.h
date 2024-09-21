/**
 * @file           lcd_driver.h
 * @author         Mohamed Ali Haoufa
 * @brief          Header file for the STM32F401xx microcontroller LCD driver.
 * @version        0.1
 * @date           2024-09-21
 *
 * This header file provides the necessary definitions, macros, and function
 * prototypes for interfacing with an LCD connected to the STM32F401xx
 * microcontroller. It includes configurations for LCD modes, rows, and
 * various LCD commands and functions.
 *
 * @copyright      Copyright (c) 2024 Mohamed Ali Haoufa. All rights reserved.
 */

/**
 * @defgroup LCD_Driver LCD Driver
 * @brief LCD (Liquid Crystal Display) driver for STM32F401xx MCUs.
 * @{
 */

#ifndef INC_LCD_DRIVER_H_
#define INC_LCD_DRIVER_H_

//----------------------------------------------
// Section: Includes
//----------------------------------------------
#include "stm32f401xx_gpio_driver.h"
#include "stm32f401xx_systick_driver.h"

//----------------------------------------------
// Section: User Type Definitions
//----------------------------------------------
/**
 * @brief Enum for specifying the LCD mode.
 */
typedef enum {
    LCD_8BIT, /**< 8-bit mode for LCD communication. */
    LCD_4BIT  /**< 4-bit mode for LCD communication. */
} LCD_MODE_t;

/**
 * @brief Enum for specifying the number of rows on the LCD.
 */
typedef enum {
    LCD_2ROWS, /**< LCD with 2 rows. */
    LCD_4ROWS  /**< LCD with 4 rows. */
} LCD_ROWS_t;

/**
 * @brief Structure for configuring the LCD.
 */
typedef struct {
    LCD_MODE_t     Mode;          /**< LCD mode (8-bit or 4-bit). */
    LCD_ROWS_t     Rows;          /**< Number of rows on the LCD. */
    uint8          Display_Mode; /**< Display mode configuration (see @ref LCD_COMMANDS_define). */
    uint8          Entry_Mode;   /**< Entry mode configuration (see @ref LCD_COMMANDS_define). */
    GPIO_TypeDef*  GPIO_PORT;    /**< GPIO port used for LCD control. */
    uint16         RS_PIN;       /**< GPIO pin for Register Select (RS). (see @ref GPIO_PINS_define) */
    uint16         EN_PIN;       /**< GPIO pin for Enable (EN). (see @ref GPIO_PINS_define) */
    uint16         D0_PIN;       /**< GPIO pin for Data pin 0. (see @ref GPIO_PINS_define) */
    uint16         D1_PIN;       /**< GPIO pin for Data pin 1. (see @ref GPIO_PINS_define) */
    uint16         D2_PIN;       /**< GPIO pin for Data pin 2. (see @ref GPIO_PINS_define) */
    uint16         D3_PIN;       /**< GPIO pin for Data pin 3. (see @ref GPIO_PINS_define) */
    uint16         D4_PIN;       /**< GPIO pin for Data pin 4. (see @ref GPIO_PINS_define) */
    uint16         D5_PIN;       /**< GPIO pin for Data pin 5. (see @ref GPIO_PINS_define) */
    uint16         D6_PIN;       /**< GPIO pin for Data pin 6. (see @ref GPIO_PINS_define) */
    uint16         D7_PIN;       /**< GPIO pin for Data pin 7. (see @ref GPIO_PINS_define) */
} LCD_t;

//----------------------------------------------
// Section: Macros Configuration References
//----------------------------------------------
/**
 * @defgroup LCD_COMMANDS_define LCD Commands
 * @{
 */

/** @brief Command to clear the LCD display. */
#define LCD_CLEAR_DISPLAY                   (0x01)
/** @brief Command to return the cursor to the home position. */
#define LCD_RETURN_HOME                     (0x02)
/** @brief Command to set the entry mode to decrement and shift off. */
#define LCD_ENTRY_MODE_DEC_SHIFT_OFF        (0x04)
/** @brief Command to set the entry mode to decrement and shift on. */
#define LCD_ENTRY_MODE_DEC_SHIFT_ON         (0x05)
/** @brief Command to set the entry mode to increment and shift off. */
#define LCD_ENTRY_MODE_INC_SHIFT_OFF        (0x06)
/** @brief Command to set the entry mode to increment and shift on. */
#define LCD_ENTRY_MODE_INC_SHIFT_ON         (0x07)
/** @brief Command to move the cursor left. */
#define LCD_CURSOR_MOVE_SHIFT_LEFT          (0x10)
/** @brief Command to move the cursor right. */
#define LCD_CURSOR_MOVE_SHIFT_RIGHT         (0x14)
/** @brief Command to shift the display left. */
#define LCD_DISPLAY_SHIFT_LEFT              (0x18)
/** @brief Command to shift the display right. */
#define LCD_DISPLAY_SHIFT_RIGHT             (0x1C)
/** @brief Command to turn on the display with underline off and cursor off. */
#define LCD_DISPLAY_ON_UNDERLINE_OFF_CURSOR_OFF (0x0C)
/** @brief Command to turn on the display with underline off and cursor on. */
#define LCD_DISPLAY_ON_UNDERLINE_OFF_CURSOR_ON  (0x0D)
/** @brief Command to turn on the display with underline on and cursor off. */
#define LCD_DISPLAY_ON_UNDERLINE_ON_CURSOR_OFF  (0x0E)
/** @brief Command to turn on the display with underline on and cursor on. */
#define LCD_DISPLAY_ON_UNDERLINE_ON_CURSOR_ON   (0x0F)
/** @brief Command to turn off the display with cursor off. */
#define LCD_DISPLAY_OFF_CURSOR_OFF           (0x08)
/** @brief Command to set the display in 8-bit mode with 2 lines. */
#define LCD_8BIT_MODE_2_LINE                 (0x38)
/** @brief Command to set the display in 4-bit mode with 2 lines. */
#define LCD_4BIT_MODE_2_LINE                 (0x28)

/** @} */

/**
 * @defgroup LCD_ROWS_POS_define LCD Row Positions
 * @{
 */

/** @brief Command to set the cursor position to the first row. */
#define LCD_FIRST_ROW                        (0x80)
/** @brief Command to set the cursor position to the second row. */
#define LCD_SECOND_ROW                       (0xC0)
/** @brief Command to set the cursor position to the third row. */
#define LCD_THIRD_ROW                        (0x94)
/** @brief Command to set the cursor position to the fourth row. */
#define LCD_FOURTH_ROW                       (0xD4)

/** @} */

/*
 * =============================================
 * APIs Supported by "LCD"
 * =============================================
 */

/**
 * @defgroup LCD_Functions API Function Prototypes
 * @{
 */

/**
 * @brief Initializes the LCD with user-defined configurations.
 * 
 * This function sets up the LCD based on the configuration specified in the
 * provided structure. It initializes the LCD in the mode and row settings
 * defined by the user.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @return     None
 * @note       User must set configurations using the @ref LCD_COMMANDS_define macros.
 */
void LCD_Init(LCD_t* LCD_cfg);

/**
 * @brief Sends a command to the LCD to be executed.
 * 
 * This function sends a command to the LCD to perform a specific action, such
 * as clearing the display or shifting the cursor.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @param [in]  command: Command to be executed (see @ref LCD_COMMANDS_define).
 * @return     None
 * @note       None
 */
void LCD_Send_Command(LCD_t* LCD_cfg, uint8 command);

/**
 * @brief Sends a character to the LCD to be displayed.
 * 
 * This function sends an ASCII character to the LCD to be displayed at the
 * current cursor position.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @param [in]  Char: ASCII character to be displayed on the screen.
 * @return     None
 * @note       None
 */
void LCD_Send_Char(LCD_t* LCD_cfg, uint8 Char);

/**
 * @brief Sends a character to the LCD to be displayed at a specific location.
 * 
 * This function sends an ASCII character to the LCD to be displayed at a
 * specific row and column location.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @param [in]  Char: ASCII character to be displayed on the screen.
 * @param [in]  row: Row number where the character should be displayed (see @ref LCD_ROWS_POS_define).
 * @param [in]  column: Column number where the character should be displayed (1...16).
 * @return     None
 * @note       None
 */
void LCD_Send_Char_Pos(LCD_t* LCD_cfg, uint8 Char, uint8 row, uint8 column);

/**
 * @brief Sends a string to the LCD to be displayed.
 * 
 * This function sends a string of characters to the LCD to be displayed from
 * the current cursor position.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @param [in]  string: Pointer to a string of characters to be displayed on the LCD.
 * @return     None
 * @note       None
 */
void LCD_Send_String(LCD_t* LCD_cfg, uint8 *string);

/**
 * @brief Sends a string to the LCD to be displayed at a specific location.
 * 
 * This function sends a string of characters to the LCD to be displayed at a
 * specific row and column location.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @param [in]  string: Pointer to a string of characters to be displayed on the LCD.
 * @param [in]  row: Row number where the string should be displayed (see @ref LCD_ROWS_POS_define).
 * @param [in]  column: Column number where the string should be displayed (1...16).
 * @return     None
 * @note       None
 */
void LCD_Send_String_Pos(LCD_t* LCD_cfg, uint8 *string, uint8 row, uint8 column);


/**
 * @brief Sends an enable signal to the LCD.
 * 
 * This function triggers the enable signal to the LCD, which is necessary for
 * executing commands and data transfers. The signal is typically sent for a
 * short duration to latch the data or command on the LCD.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * 
 * @return     None
 * 
 * @note       This function assumes that the enable pin is properly configured
 *             in the `LCD_cfg` structure.
 */
void LCD_Send_Enable_Signal(LCD_t* LCD_cfg);

/**
 * @brief Sets the location of the cursor on the LCD.
 * 
 * This function positions the cursor to the specified row and column on the
 * LCD. This is useful for placing characters at specific locations on the
 * display.
 * 
 * @param [in]  LCD_cfg: Pointer to the structure containing LCD configuration.
 * @param [in]  row:    Selects the row number of the displayed character (see @ref LCD_ROWS_POS_define).
 * @param [in]  column: Selects the column number of the displayed character (1...16).
 * 
 * @return     None
 * 
 * @note       This function assumes that the LCD is initialized and configured
 *             correctly according to the `LCD_cfg` structure.
 */
void LCD_Set_Cursor(LCD_t* LCD_cfg, uint8 row, uint8 column);
/** @} */

#endif /* INC_LCD_DRIVER_H_ */

/** @} */