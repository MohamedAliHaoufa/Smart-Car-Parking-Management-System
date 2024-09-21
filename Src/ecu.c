/**
 * @file ecu.c
 * @author Mohamed Ali Haoufa
 * @brief Header file containing all necessary information and functionality for managing STM32F401xx MCU-based peripherals.
 * @version 0.1
 * @date 2024-09-21
 *
 * This file contains the initialization and control logic for peripherals 
 * including LEDs, LCDs, UART, PIR sensors, and servo motors.
 *
 * @copyright Copyright (c) 2024
 */

/**
 * @defgroup ECU_Module ECU Definitions and APIs
 * @brief Definitions and APIs for the ECU (Electronic Control Unit) system.
 * @{
 */

/** @defgroup Includes
 * @{
 * @brief Required libraries for ECU module functionalities.
 */
#include "ecu.h"

/** @} */

/** @defgroup Functions_Declarations
 * @{
 * @brief Declaration of callback functions for UART operations.
 */
void Enter_UART_CallBack(void);
void Exit_UART_CallBack(void);
/** @} */

/** @defgroup Global_Variables_Definitions
 * @{
 * @brief Global variable definitions for LEDs, LCDs, UART, and system states.
 */
static LED_cfg_t Green_LED;           /**< Green LED configuration */
static LED_cfg_t Red_LED;             /**< Red LED configuration */
static LCD_t Admin_LCD;               /**< LCD configuration for admin */
static LCD_t User_LCD;                /**< LCD configuration for users */
static USART_cfg_t Enter_Gate_UART;   /**< UART configuration for entry gate */
static USART_cfg_t Exit_Gate_UART;    /**< UART configuration for exit gate */
static GPIO_PinConfig_t PIR;          /**< PIR sensor configuration */
volatile uint8 Enter_Flag, Exit_Flag; /**< Flags to manage entry and exit */
uint8 Free_Slots = 3;                 /**< Number of free parking slots */
uint8 Print_Slots_LCD_Flag;           /**< Flag to trigger printing free slots */
static uint8 Users_IDs[USERS_COUNT];  /**< Array storing users' IDs */
static uint8 User1_Password[4];       /**< Array storing user1 Password */
static uint8 User2_Password[4];       /**< Array storing user2 Password */
static uint8 User3_Password[4];       /**< Array storing user3 Password */
static uint8 User1_flag = 1;	      /**< To check re-entrance from the users1 ID */
static uint8 User2_flag = 1;	      /**< To check re-entrance from the users2 ID */
static uint8 User3_flag = 1;	      /**< To check re-entrance from the users3 ID */

/**
 * @brief Definitions for combining arrays.
 * 
 * - `SIZE1`: Size of the first array.
 * - `SIZE2`: Size of the second array.
 * - `SIZE3`: Size of the third array.
 * - `SIZE4`: Size of the fourth array.
 * - `TOTAL_SIZE`: Total size for the combined array.
 */
#define SIZE1 3
#define SIZE2 4
#define SIZE3 4
#define SIZE4 4
#define TOTAL_SIZE (SIZE1 + SIZE2 + SIZE3 + SIZE4)

/**
 * @brief Array to hold the combined data of all arrays.
 * 
 * This array combines `Users_IDs`, `User1_Password`, `User2_Password`, and `User3_Password`.
 */
static uint8_t combinedArray[TOTAL_SIZE];

//unsigned char ch1[]  = {0x11,0x2,0x3,0x4,0x5,0x6,0x7};
//unsigned char ch2[7] = {0};

/** @} */

/** @defgroup API_Definitions
 * @{
 * @brief API definitions for the ECU functionalities.
 */

/**
 * @brief Initializes all hardware components and peripherals.
 *
 * This function sets up all the essential peripherals, including clock initialization, 
 * LED configuration, LCD, UART, and sensor setups. Must be called during system startup.
 *
 * @return None
 */
void ECU_Init(void){
    // Clock initialization
    MCAL_RCC_Enable_Peripheral(RCC_GPIOA);
    MCAL_RCC_Enable_Peripheral(RCC_GPIOB);
    MCAL_RCC_Enable_Peripheral(RCC_GPIOE);
    MCAL_RCC_Enable_Peripheral(RCC_GPIOD);
    MCAL_RCC_Enable_Peripheral(RCC_TIM2);

    // EEPROM initialization
    EEPROM_Init();


    // LED initialization
    Green_LED.LED_Port = GPIOA;
    Green_LED.LED_Mode = LED_Active_Low;
    Green_LED.LED_Pin.GPIO_PinNumber = GPIO_PIN_11;
    Green_LED.LED_Pin.GPIO_MODE = GPIO_MODE_OUT;
    Green_LED.LED_Pin.GPIO_PinOPType = GPIO_OP_TYPE_PP;
    Green_LED.LED_Pin.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    Green_LED.LED_Pin.GPIO_PinSpeed = GPIO_SPEED_FAST;
    LED_Init(&Green_LED);

    Red_LED.LED_Port = GPIOA;
    Red_LED.LED_Mode = LED_Active_Low;
    Red_LED.LED_Pin.GPIO_PinNumber = GPIO_PIN_0;
    Red_LED.LED_Pin.GPIO_MODE = GPIO_MODE_OUT;
    Red_LED.LED_Pin.GPIO_PinOPType = GPIO_OP_TYPE_PP;
    Red_LED.LED_Pin.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    Red_LED.LED_Pin.GPIO_PinSpeed = GPIO_SPEED_FAST;
    LED_Init(&Red_LED);

    // LCD initialization
    Admin_LCD.Mode = LCD_4BIT;
    Admin_LCD.GPIO_PORT = GPIOD;
    Admin_LCD.Entry_Mode = LCD_ENTRY_MODE_INC_SHIFT_OFF;
    Admin_LCD.Display_Mode = LCD_DISPLAY_ON_UNDERLINE_OFF_CURSOR_OFF;
    Admin_LCD.EN_PIN = GPIO_PIN_10;
    Admin_LCD.RS_PIN = GPIO_PIN_11;
    Admin_LCD.D4_PIN = GPIO_PIN_12;
    Admin_LCD.D5_PIN = GPIO_PIN_13;
    Admin_LCD.D6_PIN = GPIO_PIN_14;
    Admin_LCD.D7_PIN = GPIO_PIN_15;
    LCD_Init(&Admin_LCD);

    User_LCD.Mode = LCD_4BIT;
    User_LCD.GPIO_PORT = GPIOA;
    User_LCD.Entry_Mode = LCD_ENTRY_MODE_INC_SHIFT_OFF;
    User_LCD.Display_Mode = LCD_DISPLAY_ON_UNDERLINE_OFF_CURSOR_OFF;
    User_LCD.RS_PIN = GPIO_PIN_5;
    User_LCD.EN_PIN = GPIO_PIN_6;
    User_LCD.D4_PIN = GPIO_PIN_12;
    User_LCD.D5_PIN = GPIO_PIN_13;
    User_LCD.D6_PIN = GPIO_PIN_14;
    User_LCD.D7_PIN = GPIO_PIN_15;
    LCD_Init(&User_LCD);

    // UART initialization
    Enter_Gate_UART.USART_Mode = UART_Mode_TX_RX;
    Enter_Gate_UART.BaudRate = UART_BaudRate_115200;
    Enter_Gate_UART.HwFlowCtl = UART_HwFlowCtl_NONE;
    Enter_Gate_UART.IRQ_Enable = UART_IRQ_Enable_RXNE;
    Enter_Gate_UART.P_IRQ_CallBack = Enter_UART_CallBack;
    Enter_Gate_UART.Parity = UART_Parity_NONE;
    Enter_Gate_UART.Payload_Length = UART_Payload_Length_8B;
    Enter_Gate_UART.StopBits = UART_StopBits_1;
    MCAL_USART_Init(ENTER_USART_INSTANT, &Enter_Gate_UART);

    Exit_Gate_UART.USART_Mode = UART_Mode_TX_RX;
    Exit_Gate_UART.BaudRate = UART_BaudRate_115200;
    Exit_Gate_UART.HwFlowCtl = UART_HwFlowCtl_NONE;
    Exit_Gate_UART.IRQ_Enable = UART_IRQ_Enable_RXNE;
    Exit_Gate_UART.P_IRQ_CallBack = Exit_UART_CallBack;
    Exit_Gate_UART.Parity = UART_Parity_NONE;
    Exit_Gate_UART.Payload_Length = UART_Payload_Length_8B;
    Exit_Gate_UART.StopBits = UART_StopBits_1;
    MCAL_USART_Init(EXIT_USART_INSTANT, &Exit_Gate_UART);

    // PIR sensor initialization
    PIR.GPIO_MODE = GPIO_MODE_IN;
    PIR.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    PIR.GPIO_PinNumber = ENTER_PIR_PIN;
    PIR.GPIO_PinSpeed = GPIO_SPEED_FAST;
    MCAL_GPIO_Init(ENTER_PIR_PORT, &PIR);

    PIR.GPIO_MODE = GPIO_MODE_IN;
    PIR.GPIO_PinPuPdControl = GPIO_NO_PUPD;
    PIR.GPIO_PinNumber = EXIT_PIR_PIN;
    PIR.GPIO_PinSpeed = GPIO_SPEED_FAST;
    MCAL_GPIO_Init(EXIT_PIR_PORT, &PIR);

    // Servo motor initialization
    Timer2_init();
    Servo1_Entry_Gate_Init();
    Servo2_Exit_Gate_Init();

    // Keypad initialization
    keypad_init();
    

}

/**
 * @brief Initializes user IDs and displays them on the LCD.
 * 
 * This function is called at the very start of the system to set the users' IDs.
 * It prompts the admin to enter user IDs via a keypad and displays the entered IDs
 * on the LCD. It also sets the default screen for the rest of the program.
 * 
 * @param[in]  None
 * @return     None
 */
void Admin_Init(void) {
    
    //EEPROM_Write_NBytes(0x0AAF, ch1, 7);
    //EEPROM_Init();   
    //for(int j=0; j<30000; j++);
    //EEPROM_Read_byte(0x0AAF, ch2, 7);
    
    uint8 keypad_buffer;
        
    /* Prompt the admin to enter user IDs and Passwords*/
    
    /* Get User1 ID and Password ************************************/
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user1 ID:", LCD_FIRST_ROW, 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User1 ID: ", LCD_SECOND_ROW, 1);

    do {
        keypad_buffer = keypad_Get_Pressed_Key();
    } while('F' == keypad_buffer);
    LCD_Send_Char(&Admin_LCD, keypad_buffer);
    Users_IDs[USER1] = keypad_buffer;
    
    LCD_Send_Command(&Admin_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user1 PWD:", LCD_FIRST_ROW, 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User1 Password: ", LCD_SECOND_ROW, 1);
    for(int i=0; i<4; i++){
      do {
        keypad_buffer = keypad_Get_Pressed_Key();
      } while('F' == keypad_buffer);
      User1_Password[i] = keypad_buffer;
      LCD_Send_Char_Pos(&Admin_LCD, keypad_buffer,LCD_THIRD_ROW,i);
      for(int j=0; j<30000; j++);
    }
    
    /* Get User2 ID and Password ************************************/
    LCD_Send_Command(&Admin_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user2 ID:", LCD_FIRST_ROW, 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User2 ID: ", LCD_SECOND_ROW, 2);
    do {
        keypad_buffer = keypad_Get_Pressed_Key();
    } while('F' == keypad_buffer);
    LCD_Send_Char(&Admin_LCD, keypad_buffer);
    Users_IDs[USER2] = keypad_buffer;
    
    LCD_Send_Command(&Admin_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user2 PWD:", LCD_FIRST_ROW, 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User2 Password: ", LCD_SECOND_ROW, 1);
    for(int i=0; i<4; i++){
      do {
        keypad_buffer = keypad_Get_Pressed_Key();
      } while('F' == keypad_buffer);
      User2_Password[i] = keypad_buffer;
      LCD_Send_Char_Pos(&Admin_LCD, keypad_buffer,LCD_THIRD_ROW,i);
      for(int j=0; j<30000; j++);
    }

    /* Get User3 ID and Password ************************************/
    LCD_Send_Command(&Admin_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user3 ID:", LCD_FIRST_ROW, 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User3 ID: ", LCD_SECOND_ROW, 2);
    do {
        keypad_buffer = keypad_Get_Pressed_Key();
    } while('F' == keypad_buffer);
    LCD_Send_Char(&Admin_LCD, keypad_buffer);
    Users_IDs[USER3] = keypad_buffer;

    LCD_Send_Command(&Admin_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"Enter user3 PWD:", LCD_FIRST_ROW, 1);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User3 Password: ", LCD_SECOND_ROW, 1);
    for(int i=0; i<4; i++){
      do {
        keypad_buffer = keypad_Get_Pressed_Key();
      } while('F' == keypad_buffer);
      User3_Password[i] = keypad_buffer;
      LCD_Send_Char_Pos(&Admin_LCD, keypad_buffer,LCD_THIRD_ROW,i);
      for(int j=0; j<30000; j++);
    }
    
    // Combine arrays into the combinedArray
    combineArrays(Users_IDs, SIZE1, User1_Password, SIZE2, User2_Password, SIZE3, User3_Password, SIZE4, combinedArray);
    
    // Write the combined data (IDs and Passwords) to EEPROM at address 0x0AAF
    EEPROM_Write_NBytes(0x0AAF, combinedArray, 15);
    
    /* Set the default screen for the rest of the program */
    LCD_Send_Command(&Admin_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"System is ON", LCD_FIRST_ROW, 3);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User1 ID: ", LCD_SECOND_ROW, 6);
    LCD_Send_Char(&Admin_LCD, Users_IDs[USER1]);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User2 ID: ", LCD_THIRD_ROW, 2);
    LCD_Send_Char(&Admin_LCD, Users_IDs[USER2]);
    LCD_Send_String_Pos(&Admin_LCD, (uint8*)"User3 ID: ", LCD_FOURTH_ROW, 2);
    LCD_Send_Char(&Admin_LCD, Users_IDs[USER3]);
}

/**
 * @brief Prints the number of free slots on the UserLCD.
 * 
 * This function updates the UserLCD with the number of free slots if the
 * `Print_Slots_LCD_Flag` is set. If there are no free slots, it displays
 * a message indicating that parking is full.
 * 
 * @param[in]  None
 * @return     None
 * 
 * @note Must set `Print_Slots_LCD_Flag` to 1 before calling this function.
 */
void UserLCD_PrintFreeSlots(void) {
    /* Check if we need to print free slots */
    if (Print_Slots_LCD_Flag) {
        Print_Slots_LCD_Flag = 0;
        LCD_Send_Command(&User_LCD, LCD_CLEAR_DISPLAY);
        if (0 >= Free_Slots) {
            LCD_Send_String_Pos(&User_LCD, (uint8*)"----Welcome!---", LCD_FIRST_ROW, 4);
            LCD_Send_String_Pos(&User_LCD, (uint8*)"Parking is full!", LCD_SECOND_ROW, 1);
	    LCD_Send_String_Pos(&User_LCD, (uint8*)"ID not allowed", LCD_THIRD_ROW, -3);

        } else {
            LCD_Send_String_Pos(&User_LCD, (uint8*)"----Welcome!---", LCD_FIRST_ROW, 4);
	    LCD_Send_String_Pos(&User_LCD, (uint8*)"Please Scan ID!!", LCD_SECOND_ROW, 1);
            LCD_Send_Char_Pos(&User_LCD, (Free_Slots + '0'), LCD_THIRD_ROW, -2);
            LCD_Send_String_Pos(&User_LCD, (uint8*)"Slots free!", LCD_THIRD_ROW, 0);
        }
    }

}

/**
 * @brief Checks if the given ID is present in the saved IDs.
 * 
 * This function searches for the specified ID in the list of saved IDs and
 * returns the result of the search.
 * 
 * @param[in]  _ID  ID to check.
 * @return     ID_Found if the ID is found, ID_NOT_Found otherwise.
 */
ID_Check_Result Check_ID(uint8 _ID) {
    uint8 counter;
    uint8 found_flag = 0;

    for (counter = 0; counter < NO_OF_SLOTS; counter++) {
        if (_ID == Users_IDs[counter]) {
            found_flag = 1;
            break;
        }
    }

    return (found_flag == 1) ? ID_Found : ID_NOT_Found;
}

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
uint8 Check_Flag(uint8 _ID) {
   if (_ID == Users_IDs[0]) {
      return User1_flag;
    } else if (_ID == Users_IDs[1]) {
      return User2_flag;
    } else if (_ID == Users_IDs[2]) {
      return User3_flag;
    } else {
      return 0;
    }
}

/**
 * @brief Toggles the flag associated with the given ID.
 * 
 * This function toggles the flag of a user identified by the provided ID. 
 * If the flag is currently set (1), it will be reset (0), and vice versa.
 * 
 * @param[in]  _ID  ID whose flag is to be toggled.
 */
void Flag_SET_RESET(uint8 _ID) {
   if (_ID == Users_IDs[0]) {
      User1_flag = !User1_flag;
   } else if (_ID == Users_IDs[1]) {
      User2_flag = !User2_flag;
   } else if (_ID == Users_IDs[2]) {
      User3_flag = !User3_flag;
   }
}

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
uint8 Check_Password(uint8 _ID) {
   LCD_Send_Command(&User_LCD, LCD_CLEAR_DISPLAY);
   LCD_Send_String_Pos(&User_LCD, (uint8*)"ID Scanned!!", LCD_FIRST_ROW, 1);
   LCD_Send_String_Pos(&User_LCD, (uint8*)"Enter Password:", LCD_SECOND_ROW, 1);

   uint8 count = 0;
   uint8 keypad_buffer;
   uint8 enteredPassword[4];

   if (_ID == Users_IDs[0]) {
      for (int i = 0; i < 4; i++) {
         do {
            keypad_buffer = keypad_Get_Pressed_Key();
         } while ('F' == keypad_buffer);
         enteredPassword[i] = keypad_buffer;
         LCD_Send_Char_Pos(&User_LCD, '*', LCD_THIRD_ROW, i);
         for (int j = 0; j < 5000; j++);
         if (enteredPassword[i] == User1_Password[i]) {
            count++;
         }
      }
   } else if (_ID == Users_IDs[1]) {
      for (int i = 0; i < 4; i++) {
         do {
            keypad_buffer = keypad_Get_Pressed_Key();
         } while ('F' == keypad_buffer);
         enteredPassword[i] = keypad_buffer;
         LCD_Send_Char_Pos(&User_LCD, '*', LCD_THIRD_ROW, i);
         for (int j = 0; j < 5000; j++);
         if (enteredPassword[i] == User2_Password[i]) {
            count++;
         }
      }
   } else if (_ID == Users_IDs[2]) {
      for (int i = 0; i < 4; i++) {
         do {
            keypad_buffer = keypad_Get_Pressed_Key();
         } while ('F' == keypad_buffer);
         enteredPassword[i] = keypad_buffer;
         LCD_Send_Char_Pos(&User_LCD, '*', LCD_THIRD_ROW, i);
         for (int j = 0; j < 5000; j++);
         if (enteredPassword[i] == User3_Password[i]) {
            count++;
         }
      }
   }

   return (count == 4) ? 1 : 0;
}


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
 void combineArrays(uint8_t* array1, int size1, uint8_t* array2, int size2, uint8_t* array3, int size3, uint8_t* array4, int size4, uint8_t* combinedArray) {
    int index = 0;

    // Copy array1
    for (int i = 0; i < size1; i++) {
        combinedArray[index++] = array1[i];
    }
    
    // Copy array2
    for (int i = 0; i < size2; i++) {
        combinedArray[index++] = array2[i];
    }
    
    // Copy array3
    for (int i = 0; i < size3; i++) {
        combinedArray[index++] = array3[i];
    }
    
    // Copy array4
    for (int i = 0; i < size4; i++) {
        combinedArray[index++] = array4[i];
    }
}


/**
 * @brief Opens the entry gate and displays a message on the LCD.
 * 
 * This function activates the servo to open the entry gate, turns on the green
 * LED to indicate the gate is open, and waits until the PIR sensor detects that
 * the gate is closed before closing the gate.
 * 
 * @param[in]  None
 * @return     None
 */
void Enter_Gate_Open(void) {
    LCD_Send_Command(&User_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String(&User_LCD, (uint8*)" Enter gate open!");
    Servo1_Entry_Gate(SERVO_UP);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    while (MCAL_GPIO_ReadPin(ENTER_PIR_PORT, ENTER_PIR_PIN));
    Servo1_Entry_Gate(SERVO_DOWN);
}

/**
 * @brief Opens the exit gate and displays a message on the LCD.
 * 
 * This function activates the servo to open the exit gate, turns on the green
 * LED to indicate the gate is open, and waits until the PIR sensor detects that
 * the gate is closed before closing the gate.
 * 
 * @param[in]  None
 * @return     None
 */
void Exit_Gate_Open(void) {
    LCD_Send_Command(&User_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String(&User_LCD, (uint8*)" Exit gate open!");
    Servo2_Exit_Gate(SERVO_UP);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Green_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Green_LED);
    for (int i = 0; i < 50000; i++);
    while (MCAL_GPIO_ReadPin(EXIT_PIR_PORT, EXIT_PIR_PIN));
    Servo2_Exit_Gate(SERVO_DOWN);
}

/**
 * @brief Triggers an alarm and displays an "UNKNOWN ID!" message on the LCD.
 * 
 * This function activates the red LED to indicate an error and sets the servos
 * to the down position. It also displays "UNKNOWN ID!" on the LCD to inform the
 * user of the error.
 * 
 * @param[in]  None
 * @return     None
 */
void Wrong_RFID(void) {
    LCD_Send_Command(&User_LCD, LCD_CLEAR_DISPLAY);
    LCD_Send_String(&User_LCD, (uint8*)" UNKNOWN ID!");
    Servo1_Entry_Gate(SERVO_DOWN);
    Servo2_Exit_Gate(SERVO_DOWN);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
}

/**
 * @brief Triggers an alarm by echoing the received ID on UART and flashing the red LED.
 * 
 * This function retrieves the entered ID from the specified USART instance, echoes
 * the ID back on UART, and triggers the red LED to flash multiple times as an alarm
 * indication.
 * 
 * @param[in] _USART  Pointer to the USART instance that contains the received ID.
 * 
 * @return None
 * 
 * @note The function uses blocking delays to flash the LED.
 */
void Trigger_Alarm(USART_TypeDef* _USART) {
    uint8_t ID;
    
    /* Flush UART buffer and flash red LED */
    
    /* Get received ID from UART */
    MCAL_USART_ReceiveData(_USART, (uint16*)&ID, disable);

    /* Echo the ID on UART */
    MCAL_USART_SendData(_USART, (uint16*)&ID, disable);

    /* Flash the red LED */
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOn(&Red_LED);
    for (int i = 0; i < 50000; i++);
    LED_TurnOff(&Red_LED);
    for (int i = 0; i < 50000; i++);
}

/**
 * @brief Callback function for handling entry UART events.
 * 
 * This function sets the `Enter_Flag` to 1 when called, indicating that an entry
 * event has occurred via UART.
 * 
 * @param[in] None
 * @return None
 */
void Enter_UART_CallBack(void) {
    Enter_Flag = 1;
}

/**
 * @brief Callback function for handling exit UART events.
 * 
 * This function sets the `Exit_Flag` to 1 when called, indicating that an exit
 * event has occurred via UART.
 * 
 * @param[in] None
 * @return None
 */
void Exit_UART_CallBack(void) {
    Exit_Flag = 1;
}

/** @} */

/** @} */
