/**
 * @file ecu.h  
 * @author Mohamed Ali Haoufa
 * @brief Header file containing all the necessary information about the STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 * 
 * This file contains the definitions and macros for the STM32F401xx microcontroller
 * peripherals and memory maps. It also provides APIs for the initialization and management 
 * of key hardware components and system peripherals used in the application.
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#ifndef INCS_ECU_H_
#define INCS_ECU_H_

/**
 * @defgroup ECU_Module ECU Definitions and APIs
 * @brief Definitions and APIs for the ECU (Electronic Control Unit) system.
 * @{
 */

/** @defgroup Includes
 * @{
 * @brief Required libraries for ECU module functionalities.
 */
#include "servo_motor_driver.h"
#include "lcd_driver.h"
#include "led_driver.h"
#include "keypad_driver.h"
#include "eeprom_flash.h"
/** @} */


/**
 * @enum ID_Check_Result
 * @defgroup ID_Check Enum representing the result of ID check.
 * @{
 * 
 * This enumeration defines possible outcomes of checking an ID in the system.
 */
typedef enum {
    ID_NOT_Found, /**< ID was not found */
    ID_Found      /**< ID was found */
} ID_Check_Result;
/** @} */

/**
 * @defgroup ECU_Macros Configuration Macros
 * @brief Macros for system configuration.
 * @{
 */

/** @brief Number of parking slots */
#define NO_OF_SLOTS            3

/** @brief Total number of users */
#define USERS_COUNT            3

/** @brief User 1 ID */
#define USER1                  0

/** @brief User 2 ID */
#define USER2                  1

/** @brief User 3 ID */
#define USER3                  2

/** @brief Enter gate USART instance */
#define ENTER_USART_INSTANT    USART1

/** @brief Exit gate USART instance */
#define EXIT_USART_INSTANT     USART2

/** @brief Enter gate PIR sensor GPIO port */
#define ENTER_PIR_PORT         GPIOA

/** @brief Enter gate PIR sensor GPIO pin */
#define ENTER_PIR_PIN          GPIO_PIN_7

/** @brief Exit gate PIR sensor GPIO port */
#define EXIT_PIR_PORT          GPIOA

/** @brief Exit gate PIR sensor GPIO pin */
#define EXIT_PIR_PIN           GPIO_PIN_1

/** @} */ // End of ECU_Macros group

/*
 * =============================================
 * APIs Supported by "ECU"
 * =============================================
 */

/**
 * @defgroup ECU_APIs ECU APIs
 * @brief APIs for managing the ECU functionalities.
 * @{
 */

/**
 * @brief Initializes all hardware components and peripherals.
 * 
 * This function initializes the necessary peripherals for the application, including
 * USART, servo motors, LCD, LED, and keypad drivers.
 * 
 * @return None
 * @note Must be called on system boot.
 */
void ECU_Init(void);

/**
 * @brief Initializes the admin settings, including setting up user IDs.
 * 
 * This function is called at system startup to set the user IDs and configure
 * the initial admin settings.
 * 
 * @return None
 */
void Admin_Init(void);

/**
 * @brief Prints the number of free parking slots on the LCD.
 * 
 * This function prints the number of available parking slots on the user LCD 
 * when requested by setting the `Print_Slots_LCD_Flag`.
 * 
 * @return None
 * @note `Print_Slots_LCD_Flag` must be set to 1 before calling this function.
 */
void UserLCD_PrintFreeSlots(void);

/**
 * @brief Checks if the given ID exists in the system.
 * 
 * This function checks if the provided ID exists among the saved user IDs.
 * 
 * @param[in] _ID The ID to check.
 * @return ID_Found if the ID is found, ID_NOT_Found otherwise.
 */
ID_Check_Result Check_ID(uint8 _ID);

/**
 * @brief Returns the status flag associated with the given ID.
 * 
 * This function checks the flag status for the specified user ID.
 * It compares the input ID with stored user IDs and returns the corresponding
 * flag value if a match is found.
 * 
 * @param[in]  _ID  ID whose flag status is to be checked.
 * 
 * @return User flag if the ID matches; 0 if no match is found.
 */
uint8 Check_Flag(uint8 _ID);

/**
 * @brief Toggles the flag associated with the given ID.
 * 
 * This function toggles the flag of a user identified by the provided ID. 
 * If the flag is currently set (1), it will be reset (0), and vice versa.
 * 
 * @param[in]  _ID  ID whose flag is to be toggled.
 */
void Flag_SET_RESET(uint8 _ID);

/**
 * @brief Checks if the entered password matches the stored password for the given ID.
 * 
 * This function prompts the user to enter a 4-digit password using a keypad.
 * It compares the entered password with the stored password for the corresponding ID.
 * If the passwords match, the function returns 1; otherwise, it returns 0.
 * 
 * @param[in]  _ID  ID for which the password is being checked.
 * 
 * @return 1 if the entered password matches the stored password, 0 otherwise.
 */
uint8 Check_Password(uint8 _ID);

/**
 * @brief Combines four arrays into a single array.
 *
 * This function merges four separate arrays into one single array. It copies the contents of each input array 
 * sequentially into the `combinedArray`. The sizes of the arrays and the final combined array should be managed 
 * carefully to avoid buffer overflows.
 *
 * @param[in] array1 Pointer to the first input array.
 * @param[in] size1 Number of elements in the first array.
 * @param[in] array2 Pointer to the second input array.
 * @param[in] size2 Number of elements in the second array.
 * @param[in] array3 Pointer to the third input array.
 * @param[in] size3 Number of elements in the third array.
 * @param[in] array4 Pointer to the fourth input array.
 * @param[in] size4 Number of elements in the fourth array.
 * @param[out] combinedArray Pointer to the array where the combined data will be stored. 
 *                           The size of this array must be at least `size1 + size2 + size3 + size4`.
 *
 * @return void
 *
 */
void combineArrays(uint8_t* array1, int size1, uint8_t* array2, int size2, uint8_t* array3, int size3, uint8_t* array4, int size4, uint8_t* combinedArray);

/**
 * @brief Opens the entrance gate and displays the status on the LCD.
 * 
 * This function opens the entrance gate and prints a message on the LCD 
 * indicating that the gate is open.
 * 
 * @return None
 */
void Enter_Gate_Open(void);

/**
 * @brief Opens the exit gate and displays the status on the LCD.
 * 
 * This function opens the exit gate and prints a message on the LCD 
 * indicating that the gate is open.
 * 
 * @return None
 */
void Exit_Gate_Open(void);

/**
 * @brief Triggers the alarm and prints "UNKNOWN ID!" on the LCD.
 * 
 * This function triggers an alarm when an unrecognized RFID tag is presented, 
 * and displays a message indicating the unknown ID on the LCD.
 * 
 * @return None
 */
void Wrong_RFID(void);

/**
 * @brief Echoes the entered ID via USART and flashes the red LED.
 * 
 * This function echoes the entered ID through the specified USART and flashes the red LED 
 * to signal an alarm condition.
 * 
 * @param[in] _USART Pointer to the USART instance that received the ID.
 * @return None
 */
void Trigger_Alarm(USART_TypeDef* _USART);

/** @} */ // End of ECU_APIs group

/** @} */ // End of ECU_module group

#endif /* INCS_ECU_H_ */

