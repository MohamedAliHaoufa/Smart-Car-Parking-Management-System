#/
# * @file Makefile
# * @author Mohamed Ali Haoufa
# * @brief Makefile for building and managing the STM32F401VE project.
# * @version 1.0
# * @date 2024-09-19
# *
# * @details
# * This Makefile handles compilation, linking, and generation of binaries
# * and hex files for the STM32F401VE project. It includes rules for
# * preprocessing, assembly, and semi-hosted builds. It also manages
# * directory creation, cleaning of the build, and OpenOCD loading.
# *
# * @section Directories
# * - SRC: Contains the main source (.c) files.
# * - INC: Contains the main header (.h) files.
# * - BIN: Output directory for final binary files.
# * - BUILD: Directory for intermediate build files (preprocessed, object, assembly).
# * - PP: Directory for preprocessed files.
# * - ASM: Directory for assembly files.
# * - OBJ: Directory for object files.
# * - TESTS: Directory for test-related files.
# * - TESTS_SRC: Directory for test-related source files.
# * - TESTS_INC: Directory for test-related header files.
# * - DRIVERS_SRC: Contains driver-specific source files.
# * - DRIVERS_INC: Contains driver-specific header files.
# * - BSP_SRC: Board Support Package (BSP) source files.
# * - BSP_INC: Board Support Package (BSP) header files.
# * - STARTUP: Contains startup assembly files.
# * - CMSIS_INC: Contains CMSIS (Cortex Microcontroller Software Interface Standard) header files.
# *
# * @section Toolchain
# * This Makefile uses the ARM GCC toolchain ("arm-none-eabi-gcc") for compilation and linking.
# *
# * @section Targets
# * - all: Builds the entire project.
# * - semi: Builds the project with semi-hosting enabled.
# * - clean: Removes all generated build artifacts.
# * - load: Flash the generated binary onto the STM32F401VE using OpenOCD.
# *
# * @section Flags
# * @subsection Compiler Flags
# * - -mcpu=$(MACH): Target architecture (Cortex-M4).
# * - -mthumb: Enables Thumb instruction set.
# * - -std=gnu11: Use GNU C11 standard.
# * - -Wall: Enable all warnings.
# * - -O0: Disable optimization for debugging.
# * - -I$(INC): Include the header files from the inc directories
# *
# * @subsection Linker Flags
# * - -T stm32f401vetx_FLASH.ld: Use custom linker script for STM32F401VE.
# * - --specs=nano.specs: Use newlib-nano for reduced binary size.
# * - --specs=rdimon.specs: Enable semi-hosting for debugging.
# *
# * @copyright Copyright (c) 2024 All rights reserved.
# */

# Compiler and flags
CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -g -mcpu=$(MACH) -mthumb -mfloat-abi=soft -std=gnu11 -Wall -O0 -I$(INC) -I$(DRIVERS_INC) -I$(BSP_INC) -I$(CMSIS_INC) # Added -I$(INC) -I$(DRIVERS_INC) -I$(BSP_INC) -I$(CMSIS_INC) to include the header files from the inc directories
CFLAGS_TEST= $(CFLAGS) -I$(TESTS_INC) -I/path/to/cmocka/include  # Add include path for testing framework


# Specific flags for preprocessing, assembly, and linking
CFLAGS_Preprocessing= $(CFLAGS) -E
CFLAGS_CompilationNoLinking= $(CFLAGS) -c
CFLAGS_Assembly= $(CFLAGS) -S
LDFLAGS = -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=nano.specs -T stm32f401vetx_FLASH.ld -Wl,-Map=$(BIN)/Smart-Car-Parking-Managment-System.map

# Semi-hosting linking flags
LDFLAGS_SH = -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=rdimon.specs -T stm32f401vetx_FLASH.ld -Wl,-Map=$(BIN)/Smart-Car-Parking-Managment-System.map

# Project setup
Project_name=Smart-Car-Parking-Managment-System
Test_executable=test_executable

# Directories
SRC=Src
INC=Inc
BIN=bin
BUILD=build
PP=build/pp
ASM=build/asm
OBJ=build/obj
TESTS=tests
TESTS_SRC=tests/Src
TESTS_INC=tests/Inc
DRIVERS_SRC=drivers/Src
DRIVERS_INC=drivers/Inc
BSP_SRC=bsp/Src
BSP_INC=bsp/Inc
STARTUP=startup
CMSIS_INC=CMSIS/Inc

# Create necessary directories
DIRS = $(BIN) $(BUILD) $(OBJ) $(PP) $(ASM) $(TESTS) $(TESTS_SRC) $(TESTS_INC)

# Rule to create directories if they do not exist
dirs:
	@mkdir -p $(DIRS)

# Source and object files
SRCS=$(wildcard $(SRC)/*.c)
BSP_FILES=$(wildcard $(BSP_SRC)/*.c)
DRIVERS_FILES=$(wildcard $(DRIVERS_SRC)/*.c)
Startup_FILES=$(wildcard $(STARTUP)/*.s) # Include startup files

OBJS0=$(patsubst $(STARTUP)/%.s, $(OBJ)/%.o, $(Startup_FILES))

PPS=$(patsubst $(SRC)/%.c, $(PP)/%.i, $(SRCS))
ASMS=$(patsubst $(SRC)/%.c, $(ASM)/%.s, $(SRCS))
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

PPS1=$(patsubst $(BSP_SRC)/%.c, $(PP)/%.i, $(BSP_FILES))
ASMS1=$(patsubst $(BSP_SRC)/%.c, $(ASM)/%.s, $(BSP_FILES))
OBJS1=$(patsubst $(BSP_SRC)/%.c, $(OBJ)/%.o, $(BSP_FILES))

PPS2=$(patsubst $(DRIVERS_SRC)/%.c, $(PP)/%.i, $(DRIVERS_FILES))
ASMS2=$(patsubst $(DRIVERS_SRC)/%.c, $(ASM)/%.s, $(DRIVERS_FILES))
OBJS2=$(patsubst $(DRIVERS_SRC)/%.c, $(OBJ)/%.o, $(DRIVERS_FILES))

# Build the entire project, generating ELF, hex, and binary files
all: dirs $(OBJS0) $(PPS) $(ASMS) $(OBJS) $(PPS1) $(ASMS1) $(OBJS1) $(PPS2) $(ASMS2) $(OBJS2) $(BIN)/$(Project_name).elf $(BIN)/$(Project_name).hex $(BIN)/$(Project_name).bin
	@echo "=======Build is Done============"

# Build with semi-hosting support
semi: dirs $(OBJS0) $(PPS) $(ASMS) $(OBJS) $(PPS1) $(ASMS1) $(OBJS1) $(PPS2) $(ASMS2) $(OBJS2) $(BIN)/final_SH.elf
	@echo "=======Build is Done============"

# Preprocessing rules
$(PP)/%.i: $(SRC)/%.c
	$(CC) $(CFLAGS_Preprocessing) -o $@ $^
$(PP)/%.i: $(DRIVERS_SRC)/%.c
	$(CC) $(CFLAGS_Preprocessing) -o $@ $^
$(PP)/%.i: $(BSP_SRC)/%.c
	$(CC) $(CFLAGS_Preprocessing) -o $@ $^

# Assembly rules
$(ASM)/%.s: $(SRC)/%.c
	$(CC) $(CFLAGS_Assembly) -o $@ $^
$(ASM)/%.s: $(DRIVERS_SRC)/%.c
	$(CC) $(CFLAGS_Assembly) -o $@ $^
$(ASM)/%.s: $(BSP_SRC)/%.c
	$(CC) $(CFLAGS_Assembly) -o $@ $^

# Compilation rules
$(OBJ)/%.o: $(STARTUP)/%.s
	$(CC) $(CFLAGS_CompilationNoLinking) -o $@ $^
$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS_CompilationNoLinking) -o $@ $^
$(OBJ)/%.o: $(DRIVERS_SRC)/%.c
	$(CC) $(CFLAGS_CompilationNoLinking) -o $@ $^
$(OBJ)/%.o: $(BSP_SRC)/%.c
	$(CC) $(CFLAGS_CompilationNoLinking) -o $@ $^

# Linking rules
$(BIN)/$(Project_name).elf:  $(OBJS0) $(OBJS) $(OBJS1) $(OBJS2)
	$(CC) $(LDFLAGS) -o $@ $^

# Semi-hosting linking rule
$(BIN)/final_SH.elf:  $(OBJS0) $(OBJS) $(OBJS1) $(OBJS2)
	$(CC) $(LDFLAGS_SH) -o $@ $^

# Create binary and hex files
$(BIN)/$(Project_name).bin: $(BIN)/$(Project_name).elf
	arm-none-eabi-objcopy -O binary $< $@

$(BIN)/$(Project_name).hex: $(BIN)/$(Project_name).elf
	arm-none-eabi-objcopy -O ihex $< $@

# Clean all generated files and directories
clean:
	rm -rf $(OBJ)/*.o $(ASM)/*.s $(PP)/*.i $(BIN)/*.elf $(BIN)/*.map $(BIN)/*.bin $(BIN)/*.hex $(BIN) $(BUILD) $(OBJ) $(PP) $(ASM)
	@echo "=======Clean is Done============"

# Load the binary onto the STM32F401VE board using OpenOCD
load:
	openocd -f target/stm32f4x.cfg # board/stm32f4discovery.cfg

# Unit testing rules
# Compile the test source files
TEST_SRCS=$(wildcard $(TESTS_SRC)/*.c)
TEST_OBJS=$(patsubst $(TESTS_SRC)/%.c, $(BUILD)/%.o, $(TEST_SRCS))

# Include the CMocka library for testing (assuming installed and linked properly)
# CFLAGS_TEST += -I/path/to/cmocka/include
LDFLAGS_TEST += -L/path/to/cmocka/lib -lcmocka

# Rule to build the test executable
$(BUILD)/$(Test_executable): $(TEST_OBJS) $(OBJS0) $(OBJS) $(OBJS1) $(OBJS2)
	$(CC) $(CFLAGS_TEST) $(TEST_OBJS) $(OBJS0) $(OBJS) $(OBJS1) $(OBJS2) $(LDFLAGS_TEST) -o $@

# Rule to run tests
test: $(BUILD)/$(Test_executable)
	./$(BUILD)/$(Test_executable)

