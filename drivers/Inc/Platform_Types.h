/**
 * @file Platform_Types.h
 * @author Mohamed Ali Haoufa
 * @brief Defines data types and macros for STM32F401xx microcontrollers.
 * @version 0.1
 * @date 2024-09-21
 *
 * @details This header file provides standard data types, CPU-specific types, and macros for use
 *          with STM32F401xx series microcontrollers. It includes definitions for CPU bit and byte
 *          order, as well as various data type definitions suited for the platform.
 *
 * @note This file is specifically tailored for the STM32F401xx family. Ensure compatibility with
 *       other microcontroller series before use.
 *
 * @copyright Copyright (c) 2024 Mohamed Ali Haoufa
 */

/**
 * @defgroup Platform_Types Platform Standard Types
 * @brief Defines standard platform types for STM32F4xx microcontrollers.
 * @{
 */

#ifndef PLATFORM_TYPES_H_
#define PLATFORM_TYPES_H_

/**
 * @brief CPU Type Definitions
 *
 * Defines the different CPU types supported.
 */
#define CPU_TYPE_8        8  /**< 8-bit CPU */
#define CPU_TYPE_16       16 /**< 16-bit CPU */
#define CPU_TYPE_32       32 /**< 32-bit CPU */
#define CPU_TYPE_64       64 /**< 64-bit CPU */

/**
 * @brief Bit Order Definitions
 *
 * Defines the bit order conventions.
 */
#define MSB_FIRST         0  /**< Most Significant Bit first */
#define LSB_FIRST         1  /**< Least Significant Bit first */

/**
 * @brief Byte Order Definitions
 *
 * Defines the byte order conventions.
 */
#define HIGH_BYTE_FIRST   0  /**< High byte first */
#define LOW_BYTE_FIRST    1  /**< Low byte first */

/**
 * @brief Selected CPU Characteristics
 *
 * Defines the CPU characteristics used in this file.
 */
#define CPU_TYPE          CPU_TYPE_32     /**< 32-bit CPU */
#define CPU_BIT_ORDER     LSB_FIRST       /**< Bit order: Least Significant Bit first */
#define CPU_BYTE_ORDER    LOW_BYTE_FIRST  /**< Byte order: Low byte first */

/**
 * @brief Standard Data Types
 *
 * Defines standard data types used across the platform.
 */
typedef unsigned char       boolean;        /**< Boolean type, 1 byte */
typedef signed char         sint8;          /**< Signed 8-bit integer */
typedef unsigned char       uint8;          /**< Unsigned 8-bit integer */
typedef signed short        sint16;         /**< Signed 16-bit integer */
typedef unsigned short      uint16;         /**< Unsigned 16-bit integer */
typedef signed long         sint32;         /**< Signed 32-bit integer */
typedef signed long long    sint64;         /**< Signed 64-bit integer */
typedef unsigned long       uint32;         /**< Unsigned 32-bit integer */
typedef unsigned long long  uint64;         /**< Unsigned 64-bit integer */

/**
 * @brief Least Type Definitions
 *
 * Defines types with the minimum size constraints useful for memory-limited systems.
 */
typedef unsigned long       uint8_least;    /**< Unsigned minimum 8-bit integer */
typedef unsigned long       uint16_least;   /**< Unsigned minimum 16-bit integer */
typedef unsigned long       uint32_least;   /**< Unsigned minimum 32-bit integer */
typedef signed long         sint8_least;    /**< Signed minimum 8-bit integer */
typedef signed long         sint16_least;   /**< Signed minimum 16-bit integer */
typedef signed long         sint32_least;   /**< Signed minimum 32-bit integer */

/**
 * @brief Floating-Point Types
 *
 * Defines floating-point data types.
 */
typedef float               float32;        /**< 32-bit floating point */
typedef double              float64;        /**< 64-bit floating point */

/**
 * @brief Pointer Types
 *
 * Defines generic pointer types.
 */
typedef void*               VoidPtr;        /**< Generic pointer type */
typedef const void*        ConstVoidPtr;   /**< Constant generic pointer type */

/**
 * @brief Volatile Types
 *
 * Defines volatile data types used for hardware registers.
 */
typedef volatile unsigned char  vuint8_t;   /**< Volatile 8-bit unsigned integer */
typedef volatile unsigned short vuint16_t;  /**< Volatile 16-bit unsigned integer */
typedef volatile unsigned long  vuint32_t;  /**< Volatile 32-bit unsigned integer */

/**
 * @brief Boolean Constants
 *
 * Defines standard boolean constants.
 */
#ifndef TRUE
#define TRUE    1 /**< Boolean true */
#endif

#ifndef FALSE
#define FALSE   0 /**< Boolean false */
#endif

#define SET             TRUE      /**< Set macro */
#define RESET           FALSE     /**< Reset macro */
#define FLAG_SET        SET         /**< Flag set macro */
#define FLAG_RESET      RESET       /**< Flag reset macro */

#endif /* PLATFORM_TYPES_H_ */

/** @} */
