#******************************************************************************
#* @file           : toolchain-arm-none-eabi.cmake
#*                   TOOLCHAIN FILE FOR ARM-NONE-EABI (STM32F3xx, Cortex-M4)
#******************************************************************************
#* @attention This software has been developed by Fabian Donchór since 2025.
#* email: fabian.donchor@gmail.com
#* All rights reserved.
#******************************************************************************

# System and Architecture
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Compilers and binary tools
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_SIZE arm-none-eabi-size)
set(CMAKE_NM arm-none-eabi-nm)

# We don't use the host libc
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# === Processor Flags (STM32F3xx) ===
set(MCU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffreestanding -fdata-sections -ffunction-sections")

# === Default Flags ===
set(CMAKE_C_FLAGS_INIT "${MCU_FLAGS}")
set(CMAKE_ASM_FLAGS_INIT "${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-nostartfiles -Wl,--gc-sections")

# === Flags for Debug mode ===
set(CMAKE_C_FLAGS_DEBUG "-g -O0 ${MCU_FLAGS}")
set(CMAKE_ASM_FLAGS_DEBUG "-g -O0 ${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "-nostartfiles -Wl,--gc-sections")

# === Flags for Release Mode ===
set(CMAKE_C_FLAGS_RELEASE "-O2 ${MCU_FLAGS}")
set(CMAKE_ASM_FLAGS_RELEASE "-O2 ${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-nostartfiles -Wl,--gc-sections")
