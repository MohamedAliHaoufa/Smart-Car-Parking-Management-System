/**
 * @file app_states.c  
 * @author Mohamed Ali Haoufa
 * @brief Application state machine implementation for managing entry/exit gates and parking slots using the STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 * 
 * This file defines the application states and associated functions to manage the parking system,
 * including initializing the system, handling user entry/exit, and updating the number of available parking slots.
 * 
 * @copyright
 * Copyright (c) 2024
 */

#include "app_states.h"

/**
 * @defgroup App_States Application States
 * @brief Definitions and APIs for managing application states.
 * @{
 */

/**
 * @brief Flags and variables used for managing system state.
 */
extern volatile uint8 Enter_Flag, Exit_Flag; ///< Flags for entry and exit state triggers.
extern uint8 Free_Slots, Print_Slots_LCD_Flag; ///< Available parking slots and LCD print flag.

/**
 * @brief Function pointer to manage current state transitions.
 */
void (*fp_App_State_Handler)() = STATE_NAME(Init_STATE); ///< Pointer to current state handler function.

STATES APP_Current_State; ///< Current application state.

/**
 * @brief Initializes the system and sets up the initial state.
 */
STATE_API(Init_STATE){
	APP_Current_State = Init_STATE;

	// Initialize the ECU and peripherals
	ECU_Init();

	// Transition to the Admin state
	fp_App_State_Handler = STATE_NAME(Admin_STATE);
}

/**
 * @brief Admin state to initialize the user IDs and prepare the system.
 */
STATE_API(Admin_STATE){
	APP_Current_State = Admin_STATE;

	// Set up user IDs
	Admin_Init();

	// Trigger flag to print the number of free slots on the LCD
	Print_Slots_LCD_Flag = 1;

	// Transition to the Idle state
	fp_App_State_Handler = STATE_NAME(Idle_STATE);
}

/**
 * @brief Idle state where the system waits for user input (entry/exit requests).
 */
STATE_API(Idle_STATE){
	APP_Current_State = Idle_STATE;

	// Display the number of free slots on the User LCD
	UserLCD_PrintFreeSlots();

	
	// Handle exit request
	if(Exit_Flag != 0){
		// Ensure there is someone inside the parking lot
		if(NO_OF_SLOTS != Free_Slots){
			fp_App_State_Handler = STATE_NAME(Exit_Gate_STATE);
		} else {
			Exit_Flag = 0;
			Trigger_Alarm(EXIT_USART_INSTANT);
		}
	}

	// Handle entry request
	if(Enter_Flag != 0){
		// Always proceed to entry as there are free slots
		fp_App_State_Handler = STATE_NAME(Enter_Gate_STATE);
	}
}

/**
 * @brief Handles the logic for opening the entry gate.
 */
STATE_API(Enter_Gate_STATE){
	uint8 ID;

	APP_Current_State = Enter_Gate_STATE;

	// Clear the entry flag
	Enter_Flag = 0;
	
	MCAL_USART_SendString(USART1, (uint8_t *)" Your Scanned ID is: ", 22);

	// Receive the RFID card ID from the USART
	MCAL_USART_ReceiveData(ENTER_USART_INSTANT, (uint16*)&ID, disable);

	// Echo the received ID on the USART
	MCAL_USART_SendData(ENTER_USART_INSTANT, (uint16*)&ID, disable);
	
	// Check the ID validity
	if(ID_Found == (Check_ID(ID) && Check_Flag(ID) && Check_Password(ID))){
		Free_Slots--;
		Enter_Gate_Open();
		Flag_SET_RESET(ID);
	} else {
		Wrong_RFID();
	}

	// Set next state based on the availability of slots
	fp_App_State_Handler = (Free_Slots > 0) ? STATE_NAME(Idle_STATE) : STATE_NAME(Full_STATE);
	Print_Slots_LCD_Flag = 1;
}

/**
 * @brief Handles the logic for opening the exit gate.
 */
STATE_API(Exit_Gate_STATE){
	uint8 ID;

	APP_Current_State = Exit_Gate_STATE;

	// Clear the exit flag
	Exit_Flag = 0;

	MCAL_USART_SendString(USART2, (uint8_t *)" Your Scanned ID is: ", 22);
	
	// Receive the RFID card ID from the USART
	MCAL_USART_ReceiveData(EXIT_USART_INSTANT, (uint16*)&ID, disable);

	// Echo the received ID on the USART
	MCAL_USART_SendData(EXIT_USART_INSTANT, (uint16*)&ID, disable);

	// Check the ID validity
	if(ID_Found == (Check_ID(ID) && (!Check_Flag(ID)) && Check_Password(ID))){
		Free_Slots++;
		Exit_Gate_Open();
		Flag_SET_RESET(ID);
	} else {
		Wrong_RFID();
	}

	// Set next state based on the availability of slots
	fp_App_State_Handler = (Free_Slots > 0) ? STATE_NAME(Idle_STATE) : STATE_NAME(Full_STATE);
	Print_Slots_LCD_Flag = 1;
}

/**
 * @brief Full state where the parking lot is full, and no entry is allowed.
 */
STATE_API(Full_STATE){
	APP_Current_State = Full_STATE;

	// Display the number of free slots on the User LCD
	UserLCD_PrintFreeSlots();

	//MCAL_USART_SendString(USART1, "You can't enter any ID, Parking is Full!", 41);

	// Handle entry request when the parking is full
	if(Enter_Flag != 0){
		Enter_Flag = 0;
		Trigger_Alarm(ENTER_USART_INSTANT);
	}

	// Handle exit request
	if(Exit_Flag != 0){
		fp_App_State_Handler = STATE_NAME(Exit_Gate_STATE);
	}
}

/** @} */ // End of App_States group

