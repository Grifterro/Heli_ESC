# MCU_Core/CMakeLists.txt

set(SYS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Sys/Src)

file(GLOB RUNTIME_SOURCES
    ${SYS_DIR}/*.c
)

add_library(MCU_CORE_RUNTIME OBJECT
    ${RUNTIME_SOURCES}
)

target_include_directories(MCU_CORE_RUNTIME PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS/Device/ST/STM32F3xx/Include
)

target_compile_definitions(MCU_CORE_RUNTIME PRIVATE
    STM32F303xB
)
