# === TOOLCHAIN FILE FOR ARM-NONE-EABI (STM32F3xx, Cortex-M33) ===

# System i architektura
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Kompilatory i narzędzia binarne
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_SIZE arm-none-eabi-size)
set(CMAKE_NM arm-none-eabi-nm)

# Nie używamy libc hosta
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# === Flagi procesora (STM32F3xx) ===
set(MCU_FLAGS "-mcpu=cortex-m33 -mthumb -mfpu=fpv5-sp-d16 -mfloat-abi=hard -ffreestanding -fdata-sections -ffunction-sections")

# === Flagi domyślne ===
set(CMAKE_C_FLAGS_INIT "${MCU_FLAGS}")
set(CMAKE_ASM_FLAGS_INIT "${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-nostartfiles -Wl,--gc-sections")

# === Flagi dla trybu Debug ===
set(CMAKE_C_FLAGS_DEBUG "-g -O0 ${MCU_FLAGS}")
set(CMAKE_ASM_FLAGS_DEBUG "-g -O0 ${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "-nostartfiles -Wl,--gc-sections")

# === Flagi dla trybu Release ===
set(CMAKE_C_FLAGS_RELEASE "-O2 ${MCU_FLAGS}")
set(CMAKE_ASM_FLAGS_RELEASE "-O2 ${MCU_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-nostartfiles -Wl,--gc-sections")
