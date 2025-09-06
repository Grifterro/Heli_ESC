# APP/CMakeLists.txt

file(GLOB APP_SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/Main/Src/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Board_Cfg/Src/*.c
    ${PROJECT_SOURCE_DIR}/MCU_Core/Startup/startup_stm32f303cbtx.s
    ${PROJECT_SOURCE_DIR}/MCU_Core/Sys/Src/*.c
)

add_library(APP_objs OBJECT ${APP_SRCS})

target_include_directories(APP_objs BEFORE PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Board_Cfg/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Main/Inc
    ${PROJECT_SOURCE_DIR}/MCU_Core/STM32F3xx_HAL_Driver/Inc
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Include
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Device/ST/STM32F3xx/Include
)

target_compile_definitions(APP_objs PRIVATE
    APP
    STM32F303xB
)


# === HAL_APP ===
file(GLOB HAL_APP_SRCS
    ${PROJECT_SOURCE_DIR}/MCU_Core/STM32F3xx_HAL_Driver/Src/*.c
)

add_library(HAL_APP OBJECT ${HAL_APP_SRCS})

target_include_directories(HAL_APP PRIVATE
    ${PROJECT_SOURCE_DIR}/MCU_Core/STM32F3xx_HAL_Driver/Inc
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Include
    ${PROJECT_SOURCE_DIR}/MCU_Core/CMSIS/Device/ST/STM32F3xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Board_Cfg/Inc
)

target_compile_definitions(HAL_APP PRIVATE
    STM32F303xB
    USE_HAL_DRIVER
    USER_VECT_TAB_ADDRESS
)
