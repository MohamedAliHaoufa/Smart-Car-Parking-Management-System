/**
 * @file app_states.h
 * @author Mohamed Ali Haoufa
 * @brief Header file containing definitions and macros for managing application states on the STM32F401xx MCU.
 * @version 0.1
 * @date 2024-09-21
 * 
 * This file provides definitions for the application states and macros used in managing these states
 * for the STM32F401xx microcontroller. It includes state definitions and function pointer declarations
 * for handling different application states.
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#ifndef INCS_APP_STATES_H_
#define INCS_APP_STATES_H_

/**
 * @defgroup App_States Application States
 * @brief Definitions and APIs for managing application states.
 * @{
 */

/** @defgroup Includes
 * @{
 * @brief Required libraries for managing application states.
 */
#include "ecu.h" /**< Include header for ECU definitions and functions */
/** @} */

/**
 * @enum STATES
 * @brief Enum representing various application states.
 * 
 * This enumeration defines the different states that the application can be in.
 */
typedef enum {
    Init_STATE,       /**< Initialization state */
    Admin_STATE,      /**< Administration state */
    Idle_STATE,       /**< Idle state */
    Enter_Gate_STATE, /**< State for entering the gate */
    Exit_Gate_STATE,  /**< State for exiting the gate */
    Full_STATE        /**< Full state */
} STATES;

/**
 * @defgroup State_Macros State Macros
 * @brief Macros for defining and managing application state handler functions.
 * @{
 */

/**
 * @macro STATE_API
 * @brief Macro to define a state handler function.
 * 
 * @param _NAME Name of the state.
 * 
 * This macro defines a function prototype for the state handler function corresponding to
 * the specified state.
 */
#define STATE_API(_NAME)    void ST_##_NAME(void)

/**
 * @macro STATE_NAME
 * @brief Macro to create a state handler function name.
 * 
 * @param _NAME Name of the state.
 * 
 * This macro generates the name of the state handler function based on the state name.
 */
#define STATE_NAME(_NAME)   ST_##_NAME

/** @} */ // End of State_Macros group


/** @defgroup Function Prototypes
 * @{
 * @brief Function Prototypes for the Application states APIs.
 */

/**
 * @brief Function pointer for the current application state handler.
 * 
 * This pointer is used to reference the handler function corresponding to the current application state.
 */
extern void (*fp_App_State_Handler)(); /**< Pointer to the current application state handler function */

/** @} */

/**
 * @defgroup State_Handlers State Handlers
 * @brief Function prototypes for handling different application states.
 * @{
 */

/**
 * @brief Handler function for the initialization state.
 */
STATE_API(Init_STATE);

/**
 * @brief Handler function for the administration state.
 */
STATE_API(Admin_STATE);

/**
 * @brief Handler function for the idle state.
 */
STATE_API(Idle_STATE);

/**
 * @brief Handler function for the entering gate state.
 */
STATE_API(Enter_Gate_STATE);

/**
 * @brief Handler function for the exiting gate state.
 */
STATE_API(Exit_Gate_STATE);

/**
 * @brief Handler function for the full state.
 */
STATE_API(Full_STATE);

/** @} */ // End of State_Handlers group

/** @} */ // End of App_States group

#endif /* INCS_APP_STATES_H_ */

