# Specify the minimum version of CMake
cmake_minimum_required(VERSION 3.13)

# Define the project name and version
project(Smart-Car-Parking-Management-System
    VERSION 1.0
    DESCRIPTION " TESTING CMAKE IN MY C CODE "  
    LANGUAGES C CXX ASM)

# Set the CPU architecture and other flags
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# Set the desired machine architecture and flags
set(MACH cortex-m4)
set(CMAKE_C_FLAGS "-g -mcpu=${MACH} -mthumb -mfloat-abi=soft -std=gnu11 -Wall -O0")
set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")

# Include directories for headers
include_directories(
    Inc
    drivers/Inc
    bsp/Inc
    CMSIS/Inc
)

# Include test directories conditionally (if needed)
include_directories(tests/Inc)

# Define source files from different directories
file(GLOB_RECURSE SRC_FILES Src/*.c)
file(GLOB_RECURSE BSP_FILES bsp/Src/*.c)
file(GLOB_RECURSE DRIVER_FILES drivers/Src/*.c)
file(GLOB_RECURSE STARTUP_FILES startup/*.s)

# Add executable target for the project
add_executable(${PROJECT_NAME}.elf ${SRC_FILES} ${BSP_FILES} ${DRIVER_FILES} ${STARTUP_FILES})

# Linker script and map file options
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/stm32f401vetx_FLASH.ld)
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=${MACH} -mthumb -mfloat-abi=soft --specs=nano.specs -T ${LINKER_SCRIPT} -Wl,-Map=${PROJECT_BINARY_DIR}/${PROJECT_NAME}.map")

# Generate a binary file from the ELF file
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND arm-none-eabi-objcopy -O binary ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin
    COMMENT "Generating ${PROJECT_NAME}.bin"
)

# Generate a hex file from the ELF file
add_custom_command(TARGET ${PROJECT_NAME}.elf POST_BUILD
    COMMAND arm-none-eabi-objcopy -O ihex ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex
    COMMENT "Generating ${PROJECT_NAME}.hex"
)

# Add custom target for semi-hosting
#add_executable(final_SH.elf ${SRC_FILES} ${BSP_FILES} ${DRIVER_FILES} ${STARTUP_FILES})
#set_target_properties(final_SH.elf PROPERTIES LINK_FLAGS "-mcpu=${MACH} -mthumb -mfloat-abi=soft --specs=rdimon.specs -Wl,-Map=${PROJECT_BINARY_DIR}/final_SH.map")

# Add clean command (CMake will handle most of the cleanups)
add_custom_target(clean_all
    COMMAND rm -rf ${PROJECT_BINARY_DIR}/*.elf ${PROJECT_BINARY_DIR}/*.bin ${PROJECT_BINARY_DIR}/*.hex
    COMMENT "Cleaning build files"
)
