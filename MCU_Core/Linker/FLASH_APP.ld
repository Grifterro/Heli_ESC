ENTRY(Reset_Handler_APP)

__stack_size__ = 0x2000;

PROVIDE(_stack_top = ORIGIN(RAM) + LENGTH(RAM));
PROVIDE(_stack_limit = _stack_top - __stack_size__);
PROVIDE(_estack = _stack_top);

MEMORY
{
  FLASH_APP (rx)     : ORIGIN = 0x08004000,   LENGTH = 96K
  RAM       (xrw)    : ORIGIN = 0x20000000,   LENGTH = 32K
  CCMRAM    (xrw)    : ORIGIN = 0x10000000,   LENGTH = 8K
}

SECTIONS
{
  /* Sekcja .text zawiera wszystko co ma być w flashu */
  .text :
  {
    KEEP(*(.app_vector))
    KEEP(*(.app_text.app_reset))
    *(.text*)
    *(.rodata*)
    *(.ARM.extab*)
    *(.ARM.exidx*)
    _etext = .;
  } > FLASH_APP

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
