#******************************************************************************
#* @file           : main CMakeLists.txt
#*
#******************************************************************************
#* @attention This software has been developed by Fabian Donchór since 2025.
#* email: fabian.donchor@gmail.com
#* All rights reserved.
#******************************************************************************

cmake_minimum_required(VERSION 3.2)
project(Heli_ESC C ASM)

# Set toolchain.
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/MCU_Core/CMAKE_TOOLCHAIN/toolchain-arm-none-eabi.cmake)

# Defaults to Debug if not set.
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()

# Mode-dependent conditional logic
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  message(STATUS "Compilation in DEBUG mode")
  add_compile_definitions(DEBUG)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
  message(STATUS "Compiling in RELEASE mode")
  add_compile_definitions(NDEBUG)
endif()

# Output paths
set(OUT_DIR ${CMAKE_SOURCE_DIR}/Out)
set(BIN_DIR ${OUT_DIR}/Bin)
set(MAP_DIR ${OUT_DIR}/Map)
set(LST_DIR ${OUT_DIR}/Lst)
set(DEBUG_DIR ${OUT_DIR}/Debug)

add_custom_target(create_output_dirs
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BIN_DIR}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${MAP_DIR}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${LST_DIR}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${DEBUG_DIR}
    COMMENT "Creating output directories"
)

# Add subprojects
add_subdirectory(APP)
add_subdirectory(BootLoader)
add_subdirectory(MCU_Core)

# ===== APP =====
add_executable(APP.elf
    $<TARGET_OBJECTS:APP_objs>
    $<TARGET_OBJECTS:HAL_APP>
)

target_link_options(APP.elf PRIVATE
    -T${CMAKE_SOURCE_DIR}/MCU_Core/Linker/STM32F303CBTX_FLASH_APP.ld
    -Wl,-Map=${MAP_DIR}/APP.map
    -Wl,--gc-sections -Wl,--start-group -lc -lm -Wl,--end-group -specs=nosys.specs
)
set(APP_ELF ${BIN_DIR}/APP.elf)
add_custom_command(TARGET APP.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:APP.elf> ${BIN_DIR}/APP.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex   $<TARGET_FILE:APP.elf> ${BIN_DIR}/APP.hex
    COMMAND ${CMAKE_OBJDUMP} -d        $<TARGET_FILE:APP.elf> > ${LST_DIR}/APP.lst
    COMMAND ${CMAKE_OBJDUMP} -S        $<TARGET_FILE:APP.elf> > ${LST_DIR}/APP.S
    COMMAND ${CMAKE_NM}                $<TARGET_FILE:APP.elf> > ${DEBUG_DIR}/APP.elf.sym
    COMMAND ${CMAKE_COMMAND} -E copy   $<TARGET_FILE:APP.elf> ${DEBUG_DIR}/APP.debug
    COMMAND ${CMAKE_COMMAND} -E copy   $<TARGET_FILE:APP.elf> ${BIN_DIR}/APP.elf
    COMMAND ${CMAKE_SIZE}              $<TARGET_FILE:APP.elf>
    COMMENT "Generating output files for APP"
)
add_dependencies(APP.elf create_output_dirs)

# ===== BOOTLOADER =====
add_executable(BootLoader.elf
    $<TARGET_OBJECTS:BOOTLOADER_objs>
    $<TARGET_OBJECTS:HAL_BOOTLOADER>
)

target_link_options(BootLoader.elf PRIVATE
    -T${CMAKE_SOURCE_DIR}/MCU_Core/Linker/STM32F303CBTX_FLASH_BTL.ld
    -Wl,-Map=${MAP_DIR}/BootLoader.map
    -Wl,--gc-sections -Wl,--start-group -lc -lm -Wl,--end-group -specs=nosys.specs
)
add_custom_command(TARGET BootLoader.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:BootLoader.elf> ${BIN_DIR}/BootLoader.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex   $<TARGET_FILE:BootLoader.elf> ${BIN_DIR}/BootLoader.hex
    COMMAND ${CMAKE_OBJDUMP} -d        $<TARGET_FILE:BootLoader.elf> > ${LST_DIR}/BootLoader.lst
    COMMAND ${CMAKE_OBJDUMP} -S        $<TARGET_FILE:BootLoader.elf> > ${LST_DIR}/BootLoader.S
    COMMAND ${CMAKE_NM}                $<TARGET_FILE:BootLoader.elf> > ${DEBUG_DIR}/BootLoader.elf.sym
    COMMAND ${CMAKE_COMMAND} -E copy   $<TARGET_FILE:BootLoader.elf> ${DEBUG_DIR}/BootLoader.debug
    COMMAND ${CMAKE_COMMAND} -E copy   $<TARGET_FILE:BootLoader.elf> ${BIN_DIR}/BootLoader.elf
    COMMAND ${CMAKE_SIZE}              $<TARGET_FILE:BootLoader.elf>
    COMMENT "Generating output files for BootLoader"
)
add_dependencies(BootLoader.elf create_output_dirs)
