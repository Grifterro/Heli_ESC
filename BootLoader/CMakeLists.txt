# BootLoader/CMakeLists.txt

file(GLOB BOOTLOADER_SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/Main/Src/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Board_Cfg/Src/*.c
    ${PROJECT_SOURCE_DIR}/MCU_Core/Startup/startup_bootloader.s
)

add_library(BOOTLOADER_objs OBJECT ${BOOTLOADER_SRCS})

target_include_directories(BOOTLOADER_objs BEFORE PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Board_Cfg/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Main/Inc
    ${PROJECT_SOURCE_DIR}/MCU_Core/STM32F3xx_HAL_Driver/Inc
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Include
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Device/ST/STM32F3xx/Include
)

target_compile_definitions(BOOTLOADER_objs PRIVATE
    BOOTLOADER
    STM32F303xC
)


# === HAL_BOOTLOADER ===
file(GLOB HAL_BOOTLOADER_SRCS
    ${PROJECT_SOURCE_DIR}/MCU_Core/STM32F3xx_HAL_Driver/Src/*.c
)

add_library(HAL_BOOTLOADER OBJECT ${HAL_BOOTLOADER_SRCS})

target_include_directories(HAL_BOOTLOADER PRIVATE
    ${PROJECT_SOURCE_DIR}/MCU_Core/STM32F3xx_HAL_Driver/Inc
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Include
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Device/ST/STM32F3xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Board_Cfg/Inc
)

target_compile_definitions(HAL_BOOTLOADER PRIVATE
    STM32F303xC
)