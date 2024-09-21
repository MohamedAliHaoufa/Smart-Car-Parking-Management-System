/**
 * @file stm32f401xx.h
 * @author Mohamed Ali Haoufa
 * @brief Header file containing all the necessary information about the STM32F401xx MCU.
 * 
 * This file provides definitions, memory maps, and register structures 
 * for the STM32F401xx series of microcontrollers. It includes base addresses 
 * for various memory regions and peripheral registers.
 * 
 * @version 1.0
 * @date 2024-09-21
 * 
 * @attention
 * This file is designed specifically for the STM32F401xx series microcontrollers. Ensure that 
 * all references and addresses are compliant with the specific microcontroller variant being used.
 * 
 * @copyright
 * (c) 2024
 */

#ifndef INC_STM32F401XX_H_
#define INC_STM32F401XX_H_

/** @defgroup STM32F401XX_HEADER STM32F401xx MCU Header File
 * @{
 * @brief Header file containing all the necessary information about the STM32F401xx MCU.
 */

//----------------------------------------------
// Section: Includes
//----------------------------------------------

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include "Platform_Types.h"


//----------------------------------------------
// Section: Memory Base Addresses
//----------------------------------------------

/** @defgroup MEMORY_BASE_ADDRESSES Memory Base Addresses
 * @{
 */

/** @brief Base address of Flash memory */
#define FLASH_MEMORY_BASE                  0x08000000UL  

/** @brief Base address of System memory */
#define SYSTEM_MEMORY_BASE                 0x1FFFF000UL  

/** @brief Base address of SRAM memory */
#define SRAM_MEMORY_BASE                   0x20000000UL  

/** @brief Base address of Peripheral registers */
#define PERIPHERALS_BASE                   0x40000000UL  

/** @brief Base address of Cortex-M4 internal peripherals */
#define CORTEX_M4_INTERNAL_BASE            0xE0000000UL  

/** @} */ // MEMORY_BASE_ADDRESSES

//----------------------------------------------
// Section: Base Addresses for Cortex-M4 Peripherals
//----------------------------------------------

/** @defgroup CORTEX_M4_BASE_ADDRESSES Cortex-M4 Peripherals Base Addresses
 * @{
 */

/** @brief Base address of NVIC (Nested Vectored Interrupt Controller) */
#define NVIC_BASE                          0xE000E100UL  

/** @brief Base address of System Control Block (SCB) */
#define SCB_BASE                           0xE000ED00UL  

/** @brief Base address of SysTick Timer */
#define STK_BASE                           0xE000E010UL  

/** @} */ // CORTEX_M4_BASE_ADDRESSES

//----------------------------------------------
// Section: Base Addresses for AHB Peripherals
//----------------------------------------------

/** @defgroup AHB_PERIPHERALS_BASE_ADDRESSES AHB Peripherals Base Addresses
 * @{
 */

/** @brief Base address of RCC (Reset and Clock Control) */
#define RCC_BASE                           0x40023800UL  

/** @brief Base address of CRC (Cyclic Redundancy Check) */
#define CRC_BASE                           0x40023000UL  

/** @} */ // AHB_PERIPHERALS_BASE_ADDRESSES

//----------------------------------------------
// Section: Base Addresses for APB2 Peripherals
//----------------------------------------------

/** @defgroup APB2_PERIPHERALS_BASE_ADDRESSES APB2 Peripherals Base Addresses
 * @{
 */

/** @brief Base address of GPIOA (General Purpose I/O port A) */
#define GPIOA_BASE                         0x40020000UL  

/** @brief Base address of GPIOB (General Purpose I/O port B) */
#define GPIOB_BASE                         0x40020400UL  

/** @brief Base address of GPIOC (General Purpose I/O port C) */
#define GPIOC_BASE                         0x40020800UL  

/** @brief Base address of GPIOD (General Purpose I/O port D) */
#define GPIOD_BASE                         0x40020C00UL  

/** @brief Base address of GPIOE (General Purpose I/O port E) */
#define GPIOE_BASE                         0x40021000UL  

/** @brief Base address of EXTI (External Interrupt/Event Controller) */
#define EXTI_BASE                          0x40013C00UL  

/** @brief Base address of TIM1 (Timer 1) */
#define TIM1_BASE                          0x40010000UL  

/** @brief Base address of TIM2 (Timer 2) */
#define TIM2_BASE                          0x40000000UL  

/** @brief Base address of USART1 (Universal Synchronous/Asynchronous Receiver Transmitter 1) */
#define USART1_BASE                        0x40011000UL  

/** @brief Base address of USART6 (Universal Synchronous/Asynchronous Receiver Transmitter 6) */
#define USART6_BASE                        0x40011400UL  

/** @brief Base address of SPI1 (Serial Peripheral Interface 1) */
#define SPI1_BASE                          0x40013000UL  

/** @brief Base address of SYSCFG (System Configuration Controller) */
#define SYSCFG_BASE                        0x40013800UL  

/** @} */ // APB2_PERIPHERALS_BASE_ADDRESSES

//----------------------------------------------
// Section: Base Addresses for APB1 Peripherals
//----------------------------------------------

/** @defgroup APB1_PERIPHERALS_BASE_ADDRESSES APB1 Peripherals Base Addresses
 * @{
 */

/** @brief Base address of USART2 (Universal Synchronous/Asynchronous Receiver Transmitter 2) */
#define USART2_BASE                        0x40004400UL  

/** @brief Base address of SPI2 (Serial Peripheral Interface 2) */
#define SPI2_BASE                          0x40003800UL  

/** @brief Base address of I2C1 (Inter-Integrated Circuit 1) */
#define I2C1_BASE                          0x40005400UL  

/** @brief Base address of I2C2 (Inter-Integrated Circuit 2) */
#define I2C2_BASE                          0x40005800UL  

/** @} */ // APB1_PERIPHERALS_BASE_ADDRESSES

/********************************** START : Peripheral register definition structure **********************************************/
/**
 * @defgroup Peripheral_Registers Peripheral Register Definitions
 * @{
 * @brief Structures defining the register layouts for various peripherals.
 */

/** @defgroup NVIC_Nvic_Registers NVIC Register Map
 * @{
 * @brief NVIC (Nested Vectored Interrupt Controller) Register Map.
 */
typedef struct {
    vuint32_t ISER[3];         /*!< Interrupt Set-Enable Registers */
    uint32 RESERVED0[29];     /*!< Reserved */
    vuint32_t ICER[3];         /*!< Interrupt Clear-Enable Registers */
    uint32 RESERVED1[29];     /*!< Reserved */
    vuint32_t ISPR[3];         /*!< Interrupt Set-Pending Registers */
    uint32 RESERVED2[29];     /*!< Reserved */
    vuint32_t ICPR[3];         /*!< Interrupt Clear-Pending Registers */
    uint32 RESERVED3[29];     /*!< Reserved */
    vuint32_t IABR[3];         /*!< Interrupt Active Bit Registers */
    uint32 RESERVED4[61];     /*!< Reserved */
    vuint8_t IP[80];           /*!< Interrupt Priority Registers */
    uint32 RESERVED5[684];    /*!< Reserved */
    vuint32_t STIR;            /*!< Software Trigger Interrupt Register */
} NVIC_TypeDef;
/** @} */

/** @defgroup SCB_Scb_Registers SCB Register Map
 * @{
 * @brief SCB (System Control Block) Register Map.
 */
typedef struct {
    vuint32_t CPUID;           /*!< CPU ID Base Register */
    vuint32_t ICSR;            /*!< Interrupt Control and State Register */
    vuint32_t VTOR;            /*!< Vector Table Offset Register */
    vuint32_t AIRCR;           /*!< Application Interrupt and Reset Control Register */
    vuint32_t SCR;             /*!< System Control Register */
    vuint32_t CCR;             /*!< Configuration and Control Register */
    vuint8_t  SHP[12];         /*!< System Handler Priority Registers */
    vuint32_t SHCSR;           /*!< System Handler Control and State Register */
    vuint32_t CFSR;            /*!< Configurable Fault Status Register */
    vuint32_t HFSR;            /*!< Hard Fault Status Register */
    uint32  RESERVED;          /*!< Reserved */
    vuint32_t MMAR;            /*!< Memory Management Fault Address Register */
    vuint32_t BFAR;            /*!< Bus Fault Address Register */
} SCB_TypeDef;
/** @} */

/** @defgroup SysTick_SysTick_Registers SysTick Timer Register Map
 * @{
 * @brief SysTick Timer Register Map.
 */
typedef struct {
    vuint32_t CTRL;            /*!< Control and Status Register */
    vuint32_t LOAD;            /*!< Reload Value Register */
    vuint32_t VAL;             /*!< Current Value Register */
    vuint32_t CALIB;           /*!< Calibration Value Register */
} STK_TypeDef;
/** @} */

/** @defgroup GPIO_Gpio_Registers GPIO Register Map
 * @{
 * @brief GPIO (General-Purpose Input/Output) Register Map.
 */
typedef struct {
    vuint32_t MODER;           /*!< Mode Register */
    vuint32_t OTYPER;          /*!< Output Type Register */
    vuint32_t OSPEEDR;         /*!< Output Speed Register */
    vuint32_t PUPDR;           /*!< Pull-up/Pull-down Register */
    vuint32_t IDR;             /*!< Input Data Register */
    vuint32_t ODR;             /*!< Output Data Register */
    vuint32_t BSRR;            /*!< Bit Set/Reset Register */
    vuint32_t LCKR;            /*!< Configuration Lock Register */
    vuint32_t AFR[2];          /*!< Alternate Function Registers */
} GPIO_TypeDef;
/** @} */

/** @defgroup RCC_Rcc_Registers RCC Register Map
 * @{
 * @brief RCC (Reset and Clock Control) Register Map.
 */
typedef struct {
    vuint32_t CR;              /*!< Clock Control Register */
    vuint32_t PLLCFGR;         /*!< PLL Configuration Register */
    vuint32_t CFGR;            /*!< Clock Configuration Register */
    vuint32_t CIR;             /*!< Clock Interrupt Register */
    vuint32_t AHB1RSTR;        /*!< AHB1 Peripheral Reset Register */
    vuint32_t AHB2RSTR;        /*!< AHB2 Peripheral Reset Register */
    uint32  RESERVED0[2];     /*!< Reserved */
    vuint32_t APB1RSTR;        /*!< APB1 Peripheral Reset Register */
    vuint32_t APB2RSTR;        /*!< APB2 Peripheral Reset Register */
    uint32  RESERVED1[2];     /*!< Reserved */
    vuint32_t AHB1ENR;         /*!< AHB1 Peripheral Clock Enable Register */
    vuint32_t AHB2ENR;         /*!< AHB2 Peripheral Clock Enable Register */
    uint32  RESERVED2[2];     /*!< Reserved */
    vuint32_t APB1ENR;         /*!< APB1 Peripheral Clock Enable Register */
    vuint32_t APB2ENR;         /*!< APB2 Peripheral Clock Enable Register */
    uint32  RESERVED3[2];     /*!< Reserved */
    vuint32_t AHB1LPENR;       /*!< AHB1 Peripheral Low Power Enable Register */
    vuint32_t AHB2LPENR;       /*!< AHB2 Peripheral Low Power Enable Register */
    uint32  RESERVED4[2];     /*!< Reserved */
    vuint32_t APB1LPENR;       /*!< APB1 Peripheral Low Power Enable Register */
    vuint32_t APB2LPENR;       /*!< APB2 Peripheral Low Power Enable Register */
    uint32  RESERVED5[2];     /*!< Reserved */
    vuint32_t BDCR;            /*!< Backup Domain Control Register */
    vuint32_t CSR;             /*!< Clock Control and Status Register */
    uint32  RESERVED6[2];     /*!< Reserved */
    vuint32_t SSCGR;           /*!< Spread Spectrum Clock Generation Register */
    vuint32_t PLLI2SCFGR;      /*!< PLLI2S Configuration Register */
    uint32  RESERVED7;        /*!< Reserved */
    vuint32_t DCKCFGR;         /*!< Dedicated Clocks Configuration Register */
} RCC_TypeDef;
/** @} */

/** @defgroup EXTI_Exti_Registers EXTI Register Map
 * @{
 * @brief EXTI (External Interrupts) Register Map.
 */
typedef struct {
    vuint32_t IMR;             /*!< Interrupt Mask Register */
    vuint32_t EMR;             /*!< Event Mask Register */
    vuint32_t RTSR;            /*!< Rising Trigger Selection Register */
    vuint32_t FTSR;            /*!< Falling Trigger Selection Register */
    vuint32_t SWIER;           /*!< Software Interrupt Event Register */
    vuint32_t PR;              /*!< Pending Register */
} EXTI_TypeDef;
/** @} */

/** @defgroup SYSCFG_Syscfg_Registers SYSCFG Register Map
 * @{
 * @brief SYSCFG (System Configuration) Register Map.
 */
typedef struct {
    vuint32_t MEMRMP;       /*!< SYSCFG Memory Remap Register */
    vuint32_t PMC;          /*!< SYSCFG Peripheral Mode Configuration Register */
    vuint32_t EXTICR[4];    /*!< SYSCFG External Interrupt Configuration Registers */
    uint32    RESERVED1[2]; /*!< Reserved */
    vuint32_t CMPCR;        /*!< SYSCFG Compensation Cell Control Register */
    uint32    RESERVED2[2]; /*!< Reserved */
    vuint32_t CFGR;         /*!< SYSCFG Configuration Register */
} SYSCFG_RegDef_t;
/** @} */

/** @defgroup USART_Usart_Registers USART Register Map
 * @{
 * @brief USART (Universal Synchronous Asynchronous Receiver Transmitter) Register Map.
 */
typedef struct {
     uint32 SR;   /*!< USART Status Register */
     uint32 DR;   /*!< USART Data Register */
     uint32 BRR;  /*!< USART Baud Rate Register */
     uint32 CR1;  /*!< USART Control Register 1 */
     uint32 CR2;  /*!< USART Control Register 2 */
     uint32 CR3;  /*!< USART Control Register 3 */
     uint32 GTPR; /*!< USART Guard Time and Prescaler Register */
} USART_TypeDef;
/** @} */

/** @defgroup SPI_Spi_Registers SPI Register Map
 * @{
 * @brief SPI (Serial Peripheral Interface) Register Map.
 */
typedef struct {
     uint32 CR1;     /*!< SPI Control Register 1 */
     uint32 CR2;     /*!< SPI Control Register 1 */
     uint32 SR;      /*!< SPI Status Register */
     uint32 DR;      /*!< SPI Data Register */
     uint32 CRCPR;   /*!< SPI CRC Polynomial Register */
     uint32 RXCRCR;  /*!< SPI RX CRC Register */
     uint32 TXCRCR;  /*!< SPI TX CRC Register */
     uint32 I2SCFGR; /*!< SPI I2S Configuration Register */
     uint32 I2SPR;   /*!< SPI I2S Prescaler Register */
} SPI_TypeDef;
/** @} */

/** @defgroup I2C_I2c_Registers I2C Register Map
 * @{
 * @brief I2C (Inter-Integrated Circuit) Register Map.
 */
typedef struct {
     uint32 CR1;     /*!< I2C Control Register 1 */
     uint32 CR2;     /*!< I2C Control Register 2 */
     uint32 OAR1;    /*!< I2C Own Address Register 1 */
     uint32 OAR2;    /*!< I2C Own Address Register 2 */
     uint32 DR;      /*!< I2C Data Register */
     uint32 SR1;     /*!< I2C Status Register 1 */
     uint32 SR2;     /*!< I2C Status Register 2 */
     uint32 CCR;     /*!< I2C Clock Control Register */
     uint32 TRISE;   /*!< I2C TRISE Register */
} I2C_TypeDef;
/** @} */

/** @defgroup CRC_Crc_Registers CRC Register Map
 * @{
 * @brief CRC (Cyclic Redundancy Check) Register Map.
 */
typedef struct {
    uint32 CR;          /*!< CRC Control Register */
    uint32 SR;          /*!< CRC Status Register */
    uint32 DR;          /*!< CRC Data Register */
    uint32 IDR;         /*!< CRC Independent Data Register */
    uint32 POL;         /*!< CRC Polynomial Register */
    uint32 RESERVED;    /*!< Reserved */
    uint32 INIT;        /*!< CRC Initial Value Register */
} CRC_TypeDef;
/** @} */

/** @defgroup TIM1_Tim1_Registers TIM1 Register Map
 * @{
 * @brief TIM1 (Timer 1) Register Map.
 */
typedef struct {
    uint32 CR1;         /*!< TIM1 Control Register 1 */
    uint32 CR2;         /*!< TIM1 Control Register 2 */
    uint32 SMCR;        /*!< TIM1 Slave Mode Control Register */
    uint32 DIER;        /*!< TIM1 DMA/Interrupt Enable Register */
    uint32 SR;          /*!< TIM1 Status Register */
    uint32 EGR;         /*!< TIM1 Event Generation Register */
    uint32 CCMR1;       /*!< TIM1 Capture/Compare Mode Register 1 */
    uint32 CCMR2;       /*!< TIM1 Capture/Compare Mode Register 2 */
    uint32 CCER;        /*!< TIM1 Capture/Compare Enable Register */
    uint32 CNT;         /*!< TIM1 Counter Register */
    uint32 PSC;         /*!< TIM1 Prescaler Register */
    uint32 ARR;         /*!< TIM1 Auto-Reload Register */
    uint32 RCR;         /*!< TIM1 Repetition Counter Register */
    uint32 CCR1;        /*!< TIM1 Capture/Compare Register 1 */
    uint32 CCR2;        /*!< TIM1 Capture/Compare Register 2 */
    uint32 CCR3;        /*!< TIM1 Capture/Compare Register 3 */
    uint32 CCR4;        /*!< TIM1 Capture/Compare Register 4 */
    uint32 BDTR;        /*!< TIM1 Break and Dead-Time Register */
    uint32 DCR;         /*!< TIM1 DMA Control Register */
    uint32 DMAR;        /*!< TIM1 DMA Address Register */
    uint32 OR;          /*!< TIM1 Option Register */
} TIM1_TypeDef;
/** @} */

/** @} Peripheral Definitions */
/********************************** END : Peripheral Definitions ***************************************************/


/* Peripheral instances ------------------------------------------------------*/

/********************************** START : Peripheral instances definitions **********************************************/
/** @defgroup Peripheral_Instances Peripheral Instances
 * @{
 * @brief Peripheral instances for various hardware modules in the STM32 microcontroller.
 */

/** @defgroup NVIC_NVIC_Instance NVIC Instance
 * @{
 * @brief Instance of the Nested Vectored Interrupt Controller (NVIC).
 */
#define NVIC        ((NVIC_TypeDef*)NVIC_BASE) /**< Pointer to the NVIC registers. */
/** @} */

/** @defgroup SCB_SCB_Instance SCB Instance
 * @{
 * @brief Instance of the System Control Block (SCB).
 */
#define SCB         ((SCB_TypeDef*)SCB_BASE) /**< Pointer to the SCB registers. */
/** @} */

/** @defgroup SysTick_SysTick_Instance SysTick Timer Instance
 * @{
 * @brief Instance of the SysTick Timer.
 */
#define STK         ((STK_TypeDef*)STK_BASE) /**< Pointer to the SysTick Timer registers. */
/** @} */

/** @defgroup GPIO_GPIO_Instances GPIO Instances
 * @{
 * @brief Instances of the General-Purpose Input/Output (GPIO) ports.
 */
#define GPIOA       ((GPIO_TypeDef*)GPIOA_BASE) /**< Pointer to GPIOA registers. */
#define GPIOB       ((GPIO_TypeDef*)GPIOB_BASE) /**< Pointer to GPIOB registers. */
#define GPIOC       ((GPIO_TypeDef*)GPIOC_BASE) /**< Pointer to GPIOC registers. */
#define GPIOD       ((GPIO_TypeDef*)GPIOD_BASE) /**< Pointer to GPIOD registers. */
#define GPIOE       ((GPIO_TypeDef*)GPIOE_BASE) /**< Pointer to GPIOE registers. */
/** @} */

/** @defgroup RCC_RCC_Instance RCC Instance
 * @{
 * @brief Instance of the Reset and Clock Control (RCC).
 */
#define RCC         ((RCC_TypeDef*)RCC_BASE) /**< Pointer to the RCC registers. */
/** @} */

/** @defgroup EXTI_EXTI_Instance EXTI Instance
 * @{
 * @brief Instance of the External Interrupts (EXTI).
 */
#define EXTI        ((EXTI_TypeDef*)EXTI_BASE) /**< Pointer to the EXTI registers. */
/** @} */

/** @defgroup SYSCFG_SYSCFG_Instance SYSCFG Instance
 * @{
 * @brief Instance of the System Configuration (SYSCFG).
 */
#define SYSCFG      ((SYSCFG_RegDef_t*)SYSCFG_BASE) /**< Pointer to the SYSCFG registers. */
/** @} */

/** @defgroup TIM_TIM_Instances Timer Instances
 * @{
 * @brief Instances of the Timers (TIM1 and TIM2).
 */
#define TIM1        ((TIM1_TypeDef*)TIM1_BASE) /**< Pointer to TIM1 registers. */
#define TIM2        ((TIM1_TypeDef*)TIM2_BASE) /**< Pointer to TIM2 registers. */
/** @} */

/** @defgroup USART_USART_Instances USART Instances
 * @{
 * @brief Instances of the Universal Synchronous Asynchronous Receiver Transmitters (USART1, USART2, and USART6).
 */
#define USART1      ((USART_TypeDef*)USART1_BASE) /**< Pointer to USART1 registers. */
#define USART2      ((USART_TypeDef*)USART2_BASE) /**< Pointer to USART2 registers. */
#define USART6      ((USART_TypeDef*)USART6_BASE) /**< Pointer to USART6 registers. */
/** @} */

/** @defgroup SPI_SPI_Instances SPI Instances
 * @{
 * @brief Instances of the Serial Peripheral Interfaces (SPI1 and SPI2).
 */
#define SPI1        ((SPI_TypeDef*)SPI1_BASE) /**< Pointer to SPI1 registers. */
#define SPI2        ((SPI_TypeDef*)SPI2_BASE) /**< Pointer to SPI2 registers. */
/** @} */

/** @defgroup I2C_I2C_Instances I2C Instances
 * @{
 * @brief Instances of the Inter-Integrated Circuits (I2C1 and I2C2).
 */
#define I2C1        ((I2C_TypeDef*)I2C1_BASE) /**< Pointer to I2C1 registers. */
#define I2C2        ((I2C_TypeDef*)I2C2_BASE) /**< Pointer to I2C2 registers. */
/** @} */

/** @defgroup CRC_CRC_Instance CRC Instance
 * @{
 * @brief Instance of the Cyclic Redundancy Check (CRC).
 */
#define CRC         ((CRC_TypeDef*)CRC_BASE) /**< Pointer to the CRC registers. */
/** @} */

/** @} End of Peripheral Instances */

/** @defgroup I2C_Registers I2C Registers
 * @{
 * @brief Bit definitions for the I2C peripheral registers.
 */

/** @defgroup I2C_CR1_Register_Bit_Definitions I2C CR1 Register Bit Definitions
 * @{
 * @brief Bit definitions for the I2C Control Register 1 (CR1).
 */

/** @brief Position and mask for the Peripheral Enable bit in the I2C_CR1 register. */
#define I2C_CR1_PE_Pos                      (0U)       /*!< Position of Peripheral Enable bit */
#define I2C_CR1_PE_Msk                      (0x1UL << I2C_CR1_PE_Pos)   /*!< Bit mask for Peripheral Enable */
#define I2C_CR1_PE                          I2C_CR1_PE_Msk             /*!< Peripheral Enable */

/** @brief Position and mask for the SMBus Mode bit in the I2C_CR1 register. */
#define I2C_CR1_SMBUS_Pos                   (1U)       /*!< Position of SMBus Mode bit */
#define I2C_CR1_SMBUS_Msk                   (0x1UL << I2C_CR1_SMBUS_Pos) /*!< Bit mask for SMBus Mode */
#define I2C_CR1_SMBUS                       I2C_CR1_SMBUS_Msk          /*!< SMBus Mode */

/** @brief Position and mask for the SMBus Type bit in the I2C_CR1 register. */
#define I2C_CR1_SMBTYPE_Pos                 (3U)       /*!< Position of SMBus Type bit */
#define I2C_CR1_SMBTYPE_Msk                 (0x1UL << I2C_CR1_SMBTYPE_Pos) /*!< Bit mask for SMBus Type */
#define I2C_CR1_SMBTYPE                     I2C_CR1_SMBTYPE_Msk        /*!< SMBus Type */

/** @brief Position and mask for the ARP Enable bit in the I2C_CR1 register. */
#define I2C_CR1_ENARP_Pos                   (4U)       /*!< Position of ARP Enable bit */
#define I2C_CR1_ENARP_Msk                   (0x1UL << I2C_CR1_ENARP_Pos) /*!< Bit mask for ARP Enable */
#define I2C_CR1_ENARP                       I2C_CR1_ENARP_Msk          /*!< ARP Enable */

/** @brief Position and mask for the PEC Enable bit in the I2C_CR1 register. */
#define I2C_CR1_ENPEC_Pos                   (5U)       /*!< Position of PEC Enable bit */
#define I2C_CR1_ENPEC_Msk                   (0x1UL << I2C_CR1_ENPEC_Pos) /*!< Bit mask for PEC Enable */
#define I2C_CR1_ENPEC                       I2C_CR1_ENPEC_Msk          /*!< PEC Enable */

/** @brief Position and mask for the General Call Enable bit in the I2C_CR1 register. */
#define I2C_CR1_ENGC_Pos                    (6U)       /*!< Position of General Call Enable bit */
#define I2C_CR1_ENGC_Msk                    (0x1UL << I2C_CR1_ENGC_Pos)  /*!< Bit mask for General Call Enable */
#define I2C_CR1_ENGC                        I2C_CR1_ENGC_Msk           /*!< General Call Enable */

/** @brief Position and mask for the Clock Stretching Disable bit in the I2C_CR1 register. */
#define I2C_CR1_NOSTRETCH_Pos               (7U)       /*!< Position of Clock Stretching Disable bit */
#define I2C_CR1_NOSTRETCH_Msk               (0x1UL << I2C_CR1_NOSTRETCH_Pos) /*!< Bit mask for Clock Stretching Disable */
#define I2C_CR1_NOSTRETCH                   I2C_CR1_NOSTRETCH_Msk       /*!< Clock Stretching Disable (Slave mode) */

/** @brief Position and mask for the Start Generation bit in the I2C_CR1 register. */
#define I2C_CR1_START_Pos                   (8U)       /*!< Position of Start Generation bit */
#define I2C_CR1_START_Msk                   (0x1UL << I2C_CR1_START_Pos) /*!< Bit mask for Start Generation */
#define I2C_CR1_START                       I2C_CR1_START_Msk           /*!< Start Generation */

/** @brief Position and mask for the Stop Generation bit in the I2C_CR1 register. */
#define I2C_CR1_STOP_Pos                    (9U)       /*!< Position of Stop Generation bit */
#define I2C_CR1_STOP_Msk                    (0x1UL << I2C_CR1_STOP_Pos)  /*!< Bit mask for Stop Generation */
#define I2C_CR1_STOP                        I2C_CR1_STOP_Msk            /*!< Stop Generation */

/** @brief Position and mask for the Acknowledge Enable bit in the I2C_CR1 register. */
#define I2C_CR1_ACK_Pos                     (10U)      /*!< Position of Acknowledge Enable bit */
#define I2C_CR1_ACK_Msk                     (0x1UL << I2C_CR1_ACK_Pos)   /*!< Bit mask for Acknowledge Enable */
#define I2C_CR1_ACK                         I2C_CR1_ACK_Msk             /*!< Acknowledge Enable */

/** @brief Position and mask for the Acknowledge/PEC Position bit in the I2C_CR1 register. */
#define I2C_CR1_POS_Pos                     (11U)      /*!< Position of Acknowledge/PEC Position bit */
#define I2C_CR1_POS_Msk                     (0x1UL << I2C_CR1_POS_Pos)   /*!< Bit mask for Acknowledge/PEC Position */
#define I2C_CR1_POS                         I2C_CR1_POS_Msk             /*!< Acknowledge/PEC Position (for data reception) */

/** @brief Position and mask for the Packet Error Checking bit in the I2C_CR1 register. */
#define I2C_CR1_PEC_Pos                     (12U)      /*!< Position of Packet Error Checking bit */
#define I2C_CR1_PEC_Msk                     (0x1UL << I2C_CR1_PEC_Pos)   /*!< Bit mask for Packet Error Checking */
#define I2C_CR1_PEC                         I2C_CR1_PEC_Msk             /*!< Packet Error Checking */

/** @brief Position and mask for the SMBus Alert bit in the I2C_CR1 register. */
#define I2C_CR1_ALERT_Pos                   (13U)      /*!< Position of SMBus Alert bit */
#define I2C_CR1_ALERT_Msk                   (0x1UL << I2C_CR1_ALERT_Pos) /*!< Bit mask for SMBus Alert */
#define I2C_CR1_ALERT                       I2C_CR1_ALERT_Msk           /*!< SMBus Alert */

/** @brief Position and mask for the Software Reset bit in the I2C_CR1 register. */
#define I2C_CR1_SWRST_Pos                   (15U)      /*!< Position of Software Reset bit */
#define I2C_CR1_SWRST_Msk                   (0x1UL << I2C_CR1_SWRST_Pos) /*!< Bit mask for Software Reset */
#define I2C_CR1_SWRST                       I2C_CR1_SWRST_Msk           /*!< Software Reset */

/** @} */

/** @defgroup I2C_CR2_Register_Bit_Definitions I2C CR2 Register Bit Definitions
 * @{
 * @brief Bit definitions for the I2C Control Register 2 (CR2).
 */

/** @brief Position and mask for the Peripheral Clock Frequency bits in the I2C_CR2 register. */
#define I2C_CR2_FREQ_Pos                    (0U)       /*!< Position of Peripheral Clock Frequency bits */
#define I2C_CR2_FREQ_Msk                    (0x3FUL << I2C_CR2_FREQ_Pos)  /*!< Bit mask for Peripheral Clock Frequency */
#define I2C_CR2_FREQ                        I2C_CR2_FREQ_Msk             /*!< Peripheral Clock Frequency */

/** @brief Position and mask for the Error Interrupt Enable bit in the I2C_CR2 register. */
#define I2C_CR2_ITERREN_Pos                 (8U)       /*!< Position of Error Interrupt Enable bit */
#define I2C_CR2_ITERREN_Msk                 (0x1UL << I2C_CR2_ITERREN_Pos) /*!< Bit mask for Error Interrupt Enable */
#define I2C_CR2_ITERREN                     I2C_CR2_ITERREN_Msk          /*!< Error Interrupt Enable */

/** @brief Position and mask for the Event Interrupt Enable bit in the I2C_CR2 register. */
#define I2C_CR2_ITEVTEN_Pos                 (9U)       /*!< Position of Event Interrupt Enable bit */
#define I2C_CR2_ITEVTEN_Msk                 (0x1UL << I2C_CR2_ITEVTEN_Pos) /*!< Bit mask for Event Interrupt Enable */
#define I2C_CR2_ITEVTEN                     I2C_CR2_ITEVTEN_Msk          /*!< Event Interrupt Enable */

/** @brief Position and mask for the Buffer Interrupt Enable bit in the I2C_CR2 register. */
#define I2C_CR2_ITBUFEN_Pos                 (10U)      /*!< Position of Buffer Interrupt Enable bit */
#define I2C_CR2_ITBUFEN_Msk                 (0x1UL << I2C_CR2_ITBUFEN_Pos) /*!< Bit mask for Buffer Interrupt Enable */
#define I2C_CR2_ITBUFEN                     I2C_CR2_ITBUFEN_Msk          /*!< Buffer Interrupt Enable */

/** @brief Position and mask for the DMA Requests Enable bit in the I2C_CR2 register. */
#define I2C_CR2_DMAEN_Pos                   (11U)      /*!< Position of DMA Requests Enable bit */
#define I2C_CR2_DMAEN_Msk                   (0x1UL << I2C_CR2_DMAEN_Pos)   /*!< Bit mask for DMA Requests Enable */
#define I2C_CR2_DMAEN                       I2C_CR2_DMAEN_Msk            /*!< DMA Requests Enable */

/** @brief Position and mask for the Last DMA Transfer bit in the I2C_CR2 register. */
#define I2C_CR2_LAST_Pos                    (12U)      /*!< Position of Last DMA Transfer bit */
#define I2C_CR2_LAST_Msk                    (0x1UL << I2C_CR2_LAST_Pos)    /*!< Bit mask for Last DMA Transfer */
#define I2C_CR2_LAST                        I2C_CR2_LAST_Msk             /*!< Last DMA Transfer */
/** @} */


/** @defgroup I2C_OAR2_Register_Bit_Definitions I2C OAR2 Register Bit Definitions
 *  @{
 */

/**
 * @brief Bit definitions for the I2C_OAR2 register.
 */
#define I2C_OAR2_ENDUAL_Pos                 (0U)                                   /*!< Position of Dual Addressing Mode Enable bit */
#define I2C_OAR2_ENDUAL_Msk                 (0x1UL << I2C_OAR2_ENDUAL_Pos)         /*!< Bit mask for Dual Addressing Mode Enable */
#define I2C_OAR2_ENDUAL                     I2C_OAR2_ENDUAL_Msk                    /*!< Dual Addressing Mode Enable */

#define I2C_OAR2_ADD2_Pos                   (1U)                                   /*!< Position of Second Address bit */
#define I2C_OAR2_ADD2_Msk                   (0x1UL << I2C_OAR2_ADD2_Pos)           /*!< Bit mask for Second Address bit */
#define I2C_OAR2_ADD2                       I2C_OAR2_ADD2_Msk                      /*!< Second Address bit */

/** @} */

/** @defgroup I2C_SR1_Register_Bit_Definitions I2C SR1 Register Bit Definitions
 *  @{
 */

/**
 * @brief Bit definitions for the I2C_SR1 register.
 */
#define I2C_SR1_SB_Pos                      (0U)                                   /*!< Position of Start Bit (Master mode) */
#define I2C_SR1_SB_Msk                      (0x1UL << I2C_SR1_SB_Pos)              /*!< Bit mask for Start Bit (Master mode) */
#define I2C_SR1_SB                          I2C_SR1_SB_Msk                         /*!< Start Bit (Master mode) */

#define I2C_SR1_ADDR_Pos                    (1U)                                   /*!< Position of Address Sent (Master mode) or Matched (Slave mode) */
#define I2C_SR1_ADDR_Msk                    (0x1UL << I2C_SR1_ADDR_Pos)            /*!< Bit mask for Address Sent or Matched */
#define I2C_SR1_ADDR                        I2C_SR1_ADDR_Msk                       /*!< Address Sent (Master mode) or Matched (Slave mode) */

#define I2C_SR1_BTF_Pos                     (2U)                                   /*!< Position of Byte Transfer Finished bit */
#define I2C_SR1_BTF_Msk                     (0x1UL << I2C_SR1_BTF_Pos)             /*!< Bit mask for Byte Transfer Finished */
#define I2C_SR1_BTF                         I2C_SR1_BTF_Msk                        /*!< Byte Transfer Finished */

#define I2C_SR1_ADD10_Pos                   (3U)                                   /*!< Position of 10-bit Address Header Sent (Master mode) */
#define I2C_SR1_ADD10_Msk                   (0x1UL << I2C_SR1_ADD10_Pos)           /*!< Bit mask for 10-bit Address Header Sent */
#define I2C_SR1_ADD10                       I2C_SR1_ADD10_Msk                      /*!< 10-bit Address Header Sent (Master mode) */

#define I2C_SR1_STOPF_Pos                   (4U)                                   /*!< Position of Stop Detection (Slave mode) */
#define I2C_SR1_STOPF_Msk                   (0x1UL << I2C_SR1_STOPF_Pos)           /*!< Bit mask for Stop Detection (Slave mode) */
#define I2C_SR1_STOPF                       I2C_SR1_STOPF_Msk                     /*!< Stop Detection (Slave mode) */

#define I2C_SR1_RXNE_Pos                    (6U)                                   /*!< Position of Data Register Not Empty (Receiver) */
#define I2C_SR1_RXNE_Msk                    (0x1UL << I2C_SR1_RXNE_Pos)            /*!< Bit mask for Data Register Not Empty (Receiver) */
#define I2C_SR1_RXNE                        I2C_SR1_RXNE_Msk                       /*!< Data Register Not Empty (Receiver) */

#define I2C_SR1_TXE_Pos                     (7U)                                   /*!< Position of Data Register Empty (Transmitter) */
#define I2C_SR1_TXE_Msk                     (0x1UL << I2C_SR1_TXE_Pos)             /*!< Bit mask for Data Register Empty (Transmitter) */
#define I2C_SR1_TXE                         I2C_SR1_TXE_Msk                        /*!< Data Register Empty (Transmitter) */

#define I2C_SR1_BERR_Pos                    (8U)                                   /*!< Position of Bus Error bit */
#define I2C_SR1_BERR_Msk                    (0x1UL << I2C_SR1_BERR_Pos)            /*!< Bit mask for Bus Error */
#define I2C_SR1_BERR                        I2C_SR1_BERR_Msk                       /*!< Bus Error */

#define I2C_SR1_ARLO_Pos                    (9U)                                   /*!< Position of Arbitration Lost (Master mode) */
#define I2C_SR1_ARLO_Msk                    (0x1UL << I2C_SR1_ARLO_Pos)            /*!< Bit mask for Arbitration Lost (Master mode) */
#define I2C_SR1_ARLO                        I2C_SR1_ARLO_Msk                      /*!< Arbitration Lost (Master mode) */

#define I2C_SR1_AF_Pos                      (10U)                                  /*!< Position of Acknowledge Failure bit */
#define I2C_SR1_AF_Msk                      (0x1UL << I2C_SR1_AF_Pos)              /*!< Bit mask for Acknowledge Failure */
#define I2C_SR1_AF                          I2C_SR1_AF_Msk                        /*!< Acknowledge Failure */

#define I2C_SR1_OVR_Pos                     (11U)                                  /*!< Position of Overrun/Underrun bit */
#define I2C_SR1_OVR_Msk                     (0x1UL << I2C_SR1_OVR_Pos)             /*!< Bit mask for Overrun/Underrun */
#define I2C_SR1_OVR                         I2C_SR1_OVR_Msk                       /*!< Overrun/Underrun */

#define I2C_SR1_PECERR_Pos                  (12U)                                  /*!< Position of PEC Error in Reception bit */
#define I2C_SR1_PECERR_Msk                  (0x1UL << I2C_SR1_PECERR_Pos)          /*!< Bit mask for PEC Error in Reception */
#define I2C_SR1_PECERR                      I2C_SR1_PECERR_Msk                    /*!< PEC Error in Reception */

#define I2C_SR1_TIMEOUT_Pos                 (14U)                                  /*!< Position of Timeout or Tlow Error bit */
#define I2C_SR1_TIMEOUT_Msk                 (0x1UL << I2C_SR1_TIMEOUT_Pos)         /*!< Bit mask for Timeout or Tlow Error */
#define I2C_SR1_TIMEOUT                     I2C_SR1_TIMEOUT_Msk                   /*!< Timeout or Tlow Error */

#define I2C_SR1_SMBALERT_Pos                (15U)                                  /*!< Position of SMBus Alert bit */
#define I2C_SR1_SMBALERT_Msk                (0x1UL << I2C_SR1_SMBALERT_Pos)        /*!< Bit mask for SMBus Alert */
#define I2C_SR1_SMBALERT                    I2C_SR1_SMBALERT_Msk                  /*!< SMBus Alert */

/** @} */

/** @defgroup I2C_SR2_Register_Bit_Definitions I2C SR2 Register Bit Definitions
 *  @{
 */

/**
 * @brief Bit definitions for the I2C_SR2 register.
 */
#define I2C_SR2_MSL_Pos                     (0U)                                   /*!< Position of Master/Slave bit */
#define I2C_SR2_MSL_Msk                     (0x1UL << I2C_SR2_MSL_Pos)             /*!< Bit mask for Master/Slave */
#define I2C_SR2_MSL                         I2C_SR2_MSL_Msk                       /*!< Master/Slave */

#define I2C_SR2_BUSY_Pos                    (1U)                                   /*!< Position of Bus Busy bit */
#define I2C_SR2_BUSY_Msk                    (0x1UL << I2C_SR2_BUSY_Pos)            /*!< Bit mask for Bus Busy */
#define I2C_SR2_BUSY                        I2C_SR2_BUSY_Msk                      /*!< Bus Busy */

#define I2C_SR2_TRA_Pos                     (2U)                                   /*!< Position of Transmitter/Receiver bit */
#define I2C_SR2_TRA_Msk                     (0x1UL << I2C_SR2_TRA_Pos)             /*!< Bit mask for Transmitter/Receiver */
#define I2C_SR2_TRA                         I2C_SR2_TRA_Msk                       /*!< Transmitter/Receiver */

#define I2C_SR2_GENCALL_Pos                 (4U)                                   /*!< Position of General Call Address (Slave mode) bit */
#define I2C_SR2_GENCALL_Msk                 (0x1UL << I2C_SR2_GENCALL_Pos)         /*!< Bit mask for General Call Address (Slave mode) */
#define I2C_SR2_GENCALL                     I2C_SR2_GENCALL_Msk                   /*!< General Call Address (Slave mode) */

#define I2C_SR2_SMBDEFAULT_Pos              (5U)                                   /*!< Position of SMBus Device Default Address (Slave mode) bit */
#define I2C_SR2_SMBDEFAULT_Msk              (0x1UL << I2C_SR2_SMBDEFAULT_Pos)      /*!< Bit mask for SMBus Device Default Address (Slave mode) */
#define I2C_SR2_SMBDEFAULT                  I2C_SR2_SMBDEFAULT_Msk                /*!< SMBus Device Default Address (Slave mode) */

#define I2C_SR2_SMBHOST_Pos                 (6U)                                   /*!< Position of SMBus Host Header (Slave mode) bit */
#define I2C_SR2_SMBHOST_Msk                 (0x1UL << I2C_SR2_SMBHOST_Pos)         /*!< Bit mask for SMBus Host Header (Slave mode) */
#define I2C_SR2_SMBHOST                     I2C_SR2_SMBHOST_Msk                   /*!< SMBus Host Header (Slave mode) */

#define I2C_SR2_DUALF_Pos                   (7U)                                   /*!< Position of Dual Flag (Slave mode) bit */
#define I2C_SR2_DUALF_Msk                   (0x1UL << I2C_SR2_DUALF_Pos)           /*!< Bit mask for Dual Flag (Slave mode) */
#define I2C_SR2_DUALF                       I2C_SR2_DUALF_Msk                     /*!< Dual Flag (Slave mode) */

#define I2C_SR2_PEC_Pos                     (8U)                                   /*!< Position of PEC Register (Slave mode) bit */
#define I2C_SR2_PEC_Msk                     (0xFFUL << I2C_SR2_PEC_Pos)            /*!< Bit mask for PEC Register (Slave mode) */
#define I2C_SR2_PEC                         I2C_SR2_PEC_Msk                       /*!< PEC Register (Slave mode) */

/** @} */

/** @defgroup I2C_CCR_Register_Bit_Definitions I2C CCR Register Bit Definitions
 *  @{
 */

/**
 * @brief Bit definitions for the I2C_CCR register.
 */
#define I2C_CCR_CCR_Pos                     (0U)                                   /*!< Position of Clock Control Register */
#define I2C_CCR_CCR_Msk                     (0xFFFUL << I2C_CCR_CCR_Pos)            /*!< Bit mask for Clock Control Register */
#define I2C_CCR_CCR                         I2C_CCR_CCR_Msk                        /*!< Clock Control Register */

#define I2C_CCR_DUTY_Pos                    (14U)                                  /*!< Position of Duty Cycle bit */
#define I2C_CCR_DUTY_Msk                    (0x1UL << I2C_CCR_DUTY_Pos)            /*!< Bit mask for Duty Cycle bit */
#define I2C_CCR_DUTY                        I2C_CCR_DUTY_Msk                       /*!< Duty Cycle bit */

/** @} */

/** @defgroup I2C_TRISE_Register_Bit_Definitions I2C TRISE Register Bit Definitions
 *  @{
 */

/**
 * @brief Bit definitions for the I2C_TRISE register.
 */
#define I2C_TRISE_TRISE_Pos                 (0U)                                   /*!< Position of TRISE bits */
#define I2C_TRISE_TRISE_Msk                 (0x3FUL << I2C_TRISE_TRISE_Pos)        /*!< Bit mask for TRISE bits */
#define I2C_TRISE_TRISE                     I2C_TRISE_TRISE_Msk                   /*!< TRISE bits */

/** @} */

/** @} */

/**
 * @defgroup RCC_Bit_Positions RCC Bit Position Definitions
 * @brief Bit position definitions for various registers in the RCC peripheral.
 * @{
 */

/**
 * @defgroup RCC_CR_Bit_Positions RCC_CR Bit Position Definitions
 * @brief Bit position definitions for RCC_CR register.
 * @{
 */
#define RCC_CR_HSION        0  /**< HSI Oscillator Enable */
#define RCC_CR_HSIRDY       1  /**< HSI Oscillator Ready */
#define RCC_CR_HSITRIM      3  /**< HSI Oscillator Trimming */
#define RCC_CR_HSICAL       8  /**< HSI Oscillator Calibration */
#define RCC_CR_HSEON        16 /**< HSE Oscillator Enable */
#define RCC_CR_HSERDY       17 /**< HSE Oscillator Ready */
#define RCC_CR_HSEBYP       18 /**< HSE Oscillator Bypass */
#define RCC_CR_CSSON        19 /**< Clock Security System Enable */
#define RCC_CR_PLLON        24 /**< Main PLL Enable */
#define RCC_CR_PLLRDY       25 /**< Main PLL Ready */
#define RCC_CR_PLLI2SON     26 /**< PLLI2S Enable */
#define RCC_CR_PLLI2SRDY    27 /**< PLLI2S Ready */
#define RCC_CR_PLLSAION     28 /**< PLLSAI Enable */
#define RCC_CR_PLLSAIRDY    29 /**< PLLSAI Ready */
/** @} RCC_CR_Bit_Positions */

/**
 * @defgroup RCC_PLLCFGR_Bit_Positions RCC_PLLCFGR Bit Position Definitions
 * @brief Bit position definitions for RCC_PLLCFGR register.
 * @{
 */
#define RCC_PLLCFGR_PLLM    0  /**< Main PLL Division Factor for PLL VCO */
#define RCC_PLLCFGR_PLLN    6  /**< Main PLL Multiplication Factor for VCO */
#define RCC_PLLCFGR_PLLP    16 /**< Main PLL Division Factor for Main System Clock */
#define RCC_PLLCFGR_PLLSRC  22 /**< Main PLL, PLLI2S, and PLLSAI Entry Clock Source */
#define RCC_PLLCFGR_PLLQ    24 /**< Main PLLQ Division Factor for PLLI2S Clock Output */
/** @} RCC_PLLCFGR_Bit_Positions */

/**
 * @defgroup RCC_CFGR_Bit_Positions RCC_CFGR Bit Position Definitions
 * @brief Bit position definitions for RCC_CFGR register.
 * @{
 */
#define RCC_CFGR_SW         0  /**< System Clock Switch */
#define RCC_CFGR_SWS        2  /**< System Clock Switch Status */
#define RCC_CFGR_HPRE       4  /**< AHB Prescaler */
#define RCC_CFGR_PPRE1      10 /**< APB1 Low-Speed Prescaler (APB1CLK) */
#define RCC_CFGR_PPRE2      13 /**< APB2 High-Speed Prescaler (APB2CLK) */
#define RCC_CFGR_RTCPRE     16 /**< HSE division factor for RTC clock */
#define RCC_CFGR_MCO1       21 /**< Microcontroller Clock Output 1 */
#define RCC_CFGR_I2SSRC     23 /**< I2S APB2 Clock Source Selection */
#define RCC_CFGR_MCO1PRE    24 /**< MCO1 Prescaler */
#define RCC_CFGR_MCO2PRE    27 /**< MCO2 Prescaler */
#define RCC_CFGR_MCO2       30 /**< Microcontroller Clock Output 2 */
/** @} RCC_CFGR_Bit_Positions */

/**
 * @defgroup RCC_CIR_Bit_Positions RCC_CIR Bit Position Definitions
 * @brief Bit position definitions for RCC_CIR register.
 * @{
 */
#define RCC_CIR_LSIRDYF     0  /**< LSI Ready Interrupt flag */
#define RCC_CIR_LSERDYF     1  /**< LSE Ready Interrupt flag */
#define RCC_CIR_HSIRDYF     2  /**< HSI Ready Interrupt flag */
#define RCC_CIR_HSERDYF     3  /**< HSE Ready Interrupt flag */
#define RCC_CIR_PLLRDYF     4  /**< PLL Ready Interrupt flag */
#define RCC_CIR_PLLI2SRDYF  5  /**< PLLI2S Ready Interrupt flag */
#define RCC_CIR_PLLSAIRDYF  6  /**< PLLSAI Ready Interrupt flag */
#define RCC_CIR_CSSF        7  /**< Clock Security System Interrupt flag */
#define RCC_CIR_LSIRDYIE    8  /**< LSI Ready Interrupt Enable */
#define RCC_CIR_LSERDYIE    9  /**< LSE Ready Interrupt Enable */
#define RCC_CIR_HSIRDYIE    10 /**< HSI Ready Interrupt Enable */
#define RCC_CIR_HSERDYIE    11 /**< HSE Ready Interrupt Enable */
#define RCC_CIR_PLLRDYIE    12 /**< PLL Ready Interrupt Enable */
#define RCC_CIR_PLLI2SRDYIE 13 /**< PLLI2S Ready Interrupt Enable */
#define RCC_CIR_PLLSAIRDYIE 14 /**< PLLSAI Ready Interrupt Enable */
#define RCC_CIR_LSIRDYC     16 /**< LSI Ready Interrupt Clear */
#define RCC_CIR_LSERDYC     17 /**< LSE Ready Interrupt Clear */
#define RCC_CIR_HSIRDYC     18 /**< HSI Ready Interrupt Clear */
#define RCC_CIR_HSERDYC     19 /**< HSE Ready Interrupt Clear */
#define RCC_CIR_PLLRDYC     20 /**< PLL Ready Interrupt Clear */
#define RCC_CIR_PLLI2SRDYC  21 /**< PLLI2S Ready Interrupt Clear */
#define RCC_CIR_PLLSAIRDYC  22 /**< PLLSAI Ready Interrupt Clear */
/** @} RCC_CIR_Bit_Positions */

/**
 * @defgroup RCC_AHB1RSTR_Bit_Positions RCC_AHB1RSTR Bit Position Definitions
 * @brief Bit position definitions for RCC_AHB1RSTR register.
 * @{
 */
#define RCC_AHB1RSTR_GPIOA       0  /**< GPIOA Reset */
#define RCC_AHB1RSTR_GPIOB       1  /**< GPIOB Reset */
#define RCC_AHB1RSTR_GPIOC       2  /**< GPIOC Reset */
#define RCC_AHB1RSTR_GPIOD       3  /**< GPIOD Reset */
#define RCC_AHB1RSTR_GPIOE       4  /**< GPIOE Reset */
#define RCC_AHB1RSTR_GPIOF       5  /**< GPIOF Reset */
#define RCC_AHB1RSTR_GPIOG       6  /**< GPIOG Reset */
#define RCC_AHB1RSTR_GPIOH       7  /**< GPIOH Reset */
#define RCC_AHB1RSTR_GPIOI       8  /**< GPIOI Reset */
#define RCC_AHB1RSTR_CRC         12 /**< CRC Reset */
#define RCC_AHB1RSTR_DMA1        21 /**< DMA1 Reset */
#define RCC_AHB1RSTR_DMA2        22 /**< DMA2 Reset */
#define RCC_AHB1RSTR_ETHMAC      25 /**< Ethernet MAC Reset */
#define RCC_AHB1RSTR_OTGHS       29 /**< USB OTG HS Reset */
#define RCC_AHB1RSTR_OTGHSULPI   30 /**< USB OTG HS ULPI Reset */
/** @} RCC_AHB1RSTR_Bit_Positions */

/**
 * @defgroup RCC_AHB2RSTR_Bit_Positions RCC_AHB2RSTR Bit Position Definitions
 * @brief Bit position definitions for RCC_AHB2RSTR register.
 * @{
 */
#define RCC_AHB2RSTR_DCMI        0  /**< DCMI Reset */
#define RCC_AHB2RSTR_CRYP        4  /**< CRYP Reset */
#define RCC_AHB2RSTR_HASH        5  /**< HASH Reset */
#define RCC_AHB2RSTR_RNG         6  /**< RNG Reset */
#define RCC_AHB2RSTR_OTGFS       7  /**< USB OTG FS Reset */
/** @} RCC_AHB2RSTR_Bit_Positions */

/**
 * @defgroup RCC_AHB3RSTR_Bit_Positions RCC_AHB3RSTR Bit Position Definitions
 * @brief Bit position definitions for RCC_AHB3RSTR register.
 * @{
 */
#define RCC_AHB3RSTR_FSMC        0  /**< FSMC Reset */
/** @} RCC_AHB3RSTR_Bit_Positions */

/**
 * @defgroup RCC_APB1RSTR_Bit_Positions RCC_APB1RSTR Bit Position Definitions
 * @brief Bit position definitions for RCC_APB1RSTR register.
 * @{
 */
#define RCC_APB1RSTR_TIM2        0  /**< TIM2 Reset */
#define RCC_APB1RSTR_TIM3        1  /**< TIM3 Reset */
#define RCC_APB1RSTR_TIM4        2  /**< TIM4 Reset */
#define RCC_APB1RSTR_TIM5        3  /**< TIM5 Reset */
#define RCC_APB1RSTR_TIM6        4  /**< TIM6 Reset */
#define RCC_APB1RSTR_TIM7        5  /**< TIM7 Reset */
#define RCC_APB1RSTR_TIM12       6  /**< TIM12 Reset */
#define RCC_APB1RSTR_TIM13       7  /**< TIM13 Reset */
#define RCC_APB1RSTR_TIM14       8  /**< TIM14 Reset */
#define RCC_APB1RSTR_WWDG        11 /**< WWDG Reset */
#define RCC_APB1RSTR_SPI2        14 /**< SPI2 Reset */
#define RCC_APB1RSTR_SPI3        15 /**< SPI3 Reset */
#define RCC_APB1RSTR_USART2      17 /**< USART2 Reset */
#define RCC_APB1RSTR_USART3      18 /**< USART3 Reset */
#define RCC_APB1RSTR_UART4       19 /**< UART4 Reset */
#define RCC_APB1RSTR_UART5       20 /**< UART5 Reset */
#define RCC_APB1RSTR_I2C1        21 /**< I2C1 Reset */
#define RCC_APB1RSTR_I2C2        22 /**< I2C2 Reset */
#define RCC_APB1RSTR_I2C3        23 /**< I2C3 Reset */
#define RCC_APB1RSTR_CAN1        25 /**< CAN1 Reset */
#define RCC_APB1RSTR_CAN2        26 /**< CAN2 Reset */
#define RCC_APB1RSTR_PWR         28 /**< Power Interface Reset */
#define RCC_APB1RSTR_DAC         29 /**< DAC Reset */
#define RCC_APB1RSTR_UART7       30 /**< UART7 Reset */
#define RCC_APB1RSTR_UART8       31 /**< UART8 Reset */
/** @} RCC_APB1RSTR_Bit_Positions */

/**
 * @defgroup RCC_APB2RSTR_Bit_Positions RCC_APB2RSTR Bit Position Definitions
 * @brief Bit position definitions for RCC_APB2RSTR register.
 * @{
 */
#define RCC_APB2RSTR_TIM1        0  /**< TIM1 Reset */
#define RCC_APB2RSTR_TIM8        1  /**< TIM8 Reset */
#define RCC_APB2RSTR_USART1      4  /**< USART1 Reset */
#define RCC_APB2RSTR_USART6      5  /**< USART6 Reset */
#define RCC_APB2RSTR_ADC         8  /**< ADC Reset */
#define RCC_APB2RSTR_SDIO        11 /**< SDIO Reset */
#define RCC_APB2RSTR_SPI1        12 /**< SPI1 Reset */
#define RCC_APB2RSTR_SYSCFG      14 /**< System Configuration Controller Reset */
#define RCC_APB2RSTR_TIM9        16 /**< TIM9 Reset */
#define RCC_APB2RSTR_TIM10       17 /**< TIM10 Reset */
#define RCC_APB2RSTR_TIM11       18 /**< TIM11 Reset */
/** @} RCC_APB2RSTR_Bit_Positions */

/**
 * @defgroup RCC_AHB1LPENR_Bit_Positions RCC_AHB1LPENR Bit Position Definitions
 * @brief Bit position definitions for RCC_AHB1LPENR register.
 * @{
 */
#define RCC_AHB1LPENR_GPIOALPEN   0  /**< GPIOA Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOBLPEN   1  /**< GPIOB Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOCLPEN   2  /**< GPIOC Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIODLPEN   3  /**< GPIOD Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOELPEN   4  /**< GPIOE Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOFLPEN   5  /**< GPIOF Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOGLPEN   6  /**< GPIOG Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOHLPEN   7  /**< GPIOH Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_GPIOILPEN   8  /**< GPIOI Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_CRCEN       12 /**< CRC Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_DMA1LPEN    21 /**< DMA1 Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_DMA2LPEN    22 /**< DMA2 Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_ETHMACLPEN  25 /**< Ethernet MAC Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_ETHMACTXLPEN 26 /**< Ethernet MAC Transmit Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_ETHMACRXLPEN 27 /**< Ethernet MAC Receive Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_ETHMACPTPLPEN 28 /**< Ethernet MAC PTP Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_OTGHSLPEN   29 /**< USB OTG HS Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB1LPENR_OTGHSHULPI  30 /**< USB OTG HS ULPI Peripheral Clock in Low Power Mode Enable */
/** @} RCC_AHB1LPENR_Bit_Positions */

/**
 * @defgroup RCC_AHB2LPENR_Bit_Positions RCC_AHB2LPENR Bit Position Definitions
 * @brief Bit position definitions for RCC_AHB2LPENR register.
 * @{
 */
#define RCC_AHB2LPENR_DCMILPEN   0  /**< DCMI Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB2LPENR_CRYPLPEN   4  /**< CRYP Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB2LPENR_HASHLPEN   5  /**< HASH Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB2LPENR_RNGLPEN    6  /**< RNG Peripheral Clock in Low Power Mode Enable */
#define RCC_AHB2LPENR_OTGFSLPEN  7  /**< USB OTG FS Peripheral Clock in Low Power Mode Enable */
/** @} RCC_AHB2LPENR_Bit_Positions */

/**
 * @defgroup RCC_AHB3LPENR_Bit_Positions RCC_AHB3LPENR Bit Position Definitions
 * @brief Bit position definitions for RCC_AHB3LPENR register.
 * @{
 */
#define RCC_AHB3LPENR_FSMCLPEN   0  /**< FSMC Peripheral Clock in Low Power Mode Enable */
/** @} RCC_AHB3LPENR_Bit_Positions */

/**
 * @defgroup RCC_APB1LPENR_Bit_Positions RCC_APB1LPENR Bit Position Definitions
 * @brief Bit position definitions for RCC_APB1LPENR register.
 * @{
 */
#define RCC_APB1LPENR_TIM2LPEN   0  /**< TIM2 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM3LPEN   1  /**< TIM3 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM4LPEN   2  /**< TIM4 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM5LPEN   3  /**< TIM5 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM6LPEN   4  /**< TIM6 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM7LPEN   5  /**< TIM7 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM12LPEN  6  /**< TIM12 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM13LPEN  7  /**< TIM13 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_TIM14LPEN  8  /**< TIM14 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_WWDGLPEN   11 /**< WWDG Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_SPI2LPEN   14 /**< SPI2 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_SPI3LPEN   15 /**< SPI3 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_USART2LPEN 17 /**< USART2 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_USART3LPEN 18 /**< USART3 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_UART4LPEN  19 /**< UART4 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_UART5LPEN  20 /**< UART5 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_I2C1LPEN   21 /**< I2C1 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_I2C2LPEN   22 /**< I2C2 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_I2C3LPEN   23 /**< I2C3 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_CAN1LPEN   25 /**< CAN1 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_CAN2LPEN   26 /**< CAN2 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_PWRLPEN    28 /**< Power Interface Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_DACLPEN    29 /**< DAC Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_UART7LPEN  30 /**< UART7 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB1LPENR_UART8LPEN  31 /**< UART8 Peripheral Clock in Low Power Mode Enable */
/** @} RCC_APB1LPENR_Bit_Positions */

/**
 * @defgroup RCC_APB2LPENR_Bit_Positions RCC_APB2LPENR Bit Position Definitions
 * @brief Bit position definitions for RCC_APB2LPENR register.
 * @{
 */
#define RCC_APB2LPENR_TIM1LPEN   0  /**< TIM1 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_TIM8LPEN   1  /**< TIM8 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_USART1LPEN 4  /**< USART1 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_USART6LPEN 5  /**< USART6 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_ADCLPEN    8  /**< ADC Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_SDIOLPEN   11 /**< SDIO Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_SPI1LPEN   12 /**< SPI1 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_SYSCFGLPEN 14 /**< System Configuration Controller Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_TIM9LPEN   16 /**< TIM9 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_TIM10LPEN  17 /**< TIM10 Peripheral Clock in Low Power Mode Enable */
#define RCC_APB2LPENR_TIM11LPEN  18 /**< TIM11 Peripheral Clock in Low Power Mode Enable */
/** @} RCC_APB2LPENR_Bit_Positions */

/**
 * @defgroup RCC_BDCR_Bit_Positions RCC_BDCR Bit Position Definitions
 * @brief Bit position definitions for RCC_BDCR register.
 * @{
 */
#define RCC_BDCR_LSEON     0  /**< External Low-Speed Oscillator Enable */
#define RCC_BDCR_LSERDY    1  /**< External Low-Speed Oscillator Ready */
#define RCC_BDCR_LSEBYP    2  /**< External Low-Speed Oscillator Bypass */
#define RCC_BDCR_RTCSEL    8  /**< RTC Clock Source Selection */
#define RCC_BDCR_RTCEN     15 /**< RTC Clock Enable */
#define RCC_BDCR_BDRST     16 /**< Backup Domain Software Reset */
/** @} RCC_BDCR_Bit_Positions */

/**
 * @defgroup RCC_CSR_Bit_Positions RCC_CSR Bit Position Definitions
 * @brief Bit position definitions for RCC_CSR register.
 * @{
 */
#define RCC_CSR_LSION      0  /**< Internal Low-Speed Oscillator Enable */
#define RCC_CSR_LSIRDY     1  /**< Internal Low-Speed Oscillator Ready */
#define RCC_CSR_RMVF       24 /**< Remove Reset Flag */
#define RCC_CSR_OBLRSTF    25 /**< Option Byte Loader Reset Flag */
#define RCC_CSR_PINRSTF    26 /**< PIN Reset Flag */
#define RCC_CSR_PORRSTF    27 /**< POR/PDR Reset Flag */
#define RCC_CSR_SFTRSTF    28 /**< Software Reset Flag */
#define RCC_CSR_IWDGRSTF   29 /**< Independent Watchdog Reset Flag */
#define RCC_CSR_WWDGRSTF   30 /**< Window Watchdog Reset Flag */
#define RCC_CSR_LPWRRSTF   31 /**< Low-Power Reset Flag */
/** @} RCC_CSR_Bit_Positions */

/**
 * @defgroup RCC_SSCGR_Bit_Positions RCC_SSCGR Bit Position Definitions
 * @brief Bit position definitions for RCC_SSCGR register.
 * @{
 */
#define RCC_SSCGR_MODPER    0  /**< Modulation Period */
#define RCC_SSCGR_INCSTEP   13 /**< Increase Step */
#define RCC_SSCGR_SPREADSEL 15 /**< Spread Select */
#define RCC_SSCGR_SSCGEN    31 /**< Spread Spectrum Clock Generation Enable */
/** @} RCC_SSCGR_Bit_Positions */

/**
 * @defgroup RCC_PLLI2SCFGR_Bit_Positions RCC_PLLI2SCFGR Bit Position Definitions
 * @brief Bit position definitions for RCC_PLLI2SCFGR register.
 * @{
 */
#define RCC_PLLI2SCFGR_PLLI2SN  6  /**< PLLI2S N Factor */
#define RCC_PLLI2SCFGR_PLLI2SR  28 /**< PLLI2S R Factor */
/** @} RCC_PLLI2SCFGR_Bit_Positions */

/** @} RCC_Bit_Positions */



/**
 * @defgroup GPIO_Base_Address_to_Code GPIO Base Address to Code Conversion Macros
 * @{
 * @brief Macros for converting GPIO base addresses to corresponding port codes.
 */

/**
 * @brief Macro to convert GPIO base address to port code.
 *
 * @param x GPIOx base address.
 * @return Corresponding port code for the given GPIO base address.
 */
#define GPIO_BASEADDR_TO_CODE(x)  (   (x == GPIOA)?0:\
                                      (x == GPIOB)?1:\
                                      (x == GPIOC)?2:\
                                      (x == GPIOD)?3:\
                                      (x == GPIOE)?4:0 )

/** @} GPIO_Base_Address_to_Code */

/** @} */


#include "stm32f401xx_gpio_driver.h"        /**< Include GPIO driver header file */
#include "stm32f401xx_rcc_driver.h"         /**< Include RCC driver header file */
#include "stm32f401xx_usart_driver.h"       /**< Include USART driver header file */
#include "stm32f401xx_i2c_driver.h"       /**< Include I2C driver header file */
#include "stm32f401xx_spi_driver.h"       /**< Include SPI driver header file */
#include "stm32f401xx_nvic_driver.h"        /**< Include NVIC driver header file */
#include "stm32f401xx_systick_driver.h"     /**< Include SYSTICK driver header file */
#include "stm32f401xx_timer_driver.h"       /**< Include TIMER driver header file */

/** @} */

#endif /* INC_STM32F401XX_H_ */
