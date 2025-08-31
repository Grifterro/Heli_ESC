/*
******************************************************************************
**
** @file        : FLASH_BOOTLOADER.ld
**
** @author      : Fabian Donchór
**
** @brief       : Linker script for STM32F303CBTx Device from STM32F3 series
**                      128KBytes FLASH
**                      8KBytes CCMRAM
**                      32KBytes RAM
**
**  Target      : STMicroelectronics STM32
**
**  Distribution: The file is distributed as is, without any warranty
**                of any kind.
**
*******************************************************************************
** @attention This software has been developed by Fabian Donchór since 2025.
** email: fabian.donchor@gmail.com
** All rights reserved.
*******************************************************************************
*/

ENTRY(Reset_Handler)

PROVIDE(_estack = ORIGIN(RAM) + LENGTH(RAM));
PROVIDE(APP_ADDRESS = 0x08008000);

MEMORY
{
  FLASH_BootLoader (rx)  : ORIGIN = 0x08000000, LENGTH = 32K
  RAM              (xrw) : ORIGIN = 0x20000000, LENGTH = 32K
}

SECTIONS
{
  .text :
  {
    KEEP(*(.bootloader_vector))
    KEEP(*(.bootloader_text.bootloader_reset))
    *(.text*)
    *(.rodata*)
    *(.ARM.extab*)
    *(.ARM.exidx*)
    _etext = .;
  } > FLASH_BootLoader

  .data : AT (_etext)
  {
    _sidata = _etext;
    _sdata = .;
    *(.data*)
    _edata = .;
  } > RAM

  .bss :
  {
    _sbss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } > RAM
}
