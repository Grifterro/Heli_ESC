/**
  ******************************************************************************
  * @file      startup_stm32f303xx.s
  * @author    MCD Application Team
  * @brief     STM32F303xx devices vector table GCC toolchain.
  *            This module performs:
  *                - Set the initial SP
  *                - Set the initial PC == Reset_Handler_BootLoader,
  *                - Set the vector table entries with the exceptions ISR address,
  *                - Configure the clock system
  *                - Branches to main in the C library (which eventually
  *                  calls main()).
  *            After Reset the Cortex-M33 processor is in Thread mode,
  *            priority is Privileged, and the Stack is set to Main.
  *******************************************************************************
  * @attention
  *
  * Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  *******************************************************************************
  */

  .syntax unified
	.cpu cortex-m4
	.fpu fpv4-sp-d16
	.thumb

.global	g_pfnVectors_BootLoader
.global	Default_Handler_BootLoader

/* start address for the initialization values of the .data section.
defined in linker script */
.word	_sidata
/* start address for the .data section. defined in linker script */
.word	_sdata
/* end address for the .data section. defined in linker script */
.word	_edata
/* start address for the .bss section. defined in linker script */
.word	_sbss
/* end address for the .bss section. defined in linker script */
.word	_ebss

.equ  BootRAM,        0xF1E0F85F
/**
 * @brief  This is the code that gets called when the processor first
 *          starts execution following a reset event. Only the absolutely
 *          necessary set is performed, after which the application
 *          supplied main() routine is called.
 * @param  None
 * @retval : None
*/

    /*.section .bootloader_text.bootloader_reset, "ax", %progbits*/
	.weak	Reset_Handler_BootLoader
	.type	Reset_Handler_BootLoader, %function
Reset_Handler_BootLoader:
  ldr   sp, =_estack    /* set stack pointer */
/* Call the clock system initialization function.*/
  bl  BootLoader_SystemInit

/* Copy the data segment initializers from flash to SRAM */
  movs	r1, #0
  b	LoopCopyDataInit

CopyDataInit:
	ldr	r3, =_sidata
	ldr	r3, [r3, r1]
	str	r3, [r0, r1]
	adds	r1, r1, #4

LoopCopyDataInit:
	ldr	r0, =_sdata
	ldr	r3, =_edata
	adds	r2, r0, r1
	cmp	r2, r3
	bcc	CopyDataInit
	ldr	r2, =_sbss
	b	LoopFillZerobss
/* Zero fill the bss segment. */
FillZerobss:
	movs	r3, #0
	str	r3, [r2], #4

LoopFillZerobss:
	ldr	r3, = _ebss
	cmp	r2, r3
	bcc	FillZerobss

/* Call static constructors */
/*    bl __libc_init_array */
/* Call the application's entry point.*/
	bl	btl_main

LoopForever:
    b LoopForever

.size	Reset_Handler_BootLoader, .-Reset_Handler_BootLoader

/**
 * @brief  This is the code that gets called when the processor receives an
 *         unexpected interrupt.  This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 *
 * @param  None
 * @retval : None
*/
    .section	.text.Default_Handler_BootLoader,"ax",%progbits
Default_Handler_BootLoader:
Infinite_Loop:
	b	Infinite_Loop
	.size	Default_Handler_BootLoader, .-Default_Handler_BootLoader
/******************************************************************************
*
* The minimal vector table for a Cortex-M33.  Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
*
******************************************************************************/
 	.section	.bootloader_vector,"a",%progbits
	.type	g_pfnVectors_BootLoader, %object

	.global	Reset_Handler_BootLoader
	.global	NMI_Handler_BootLoader
	.global	HardFault_Handler_BootLoader
	.global	MemManage_Handler_BootLoader
	.global	BusFault_Handler_BootLoader
	.global	UsageFault_Handler_BootLoader
	.global	SecureFault_Handler_BootLoader
	.global	SVC_Handler_BootLoader
	.global	DebugMon_Handler_BootLoader
	.global	PendSV_Handler_BootLoader
	.global	SysTick_Handler_BootLoader
	.global	WWDG_IRQHandler_BootLoader
	.global	PVD_PVM_IRQHandler_BootLoader
	.global	RTC_IRQHandler_BootLoader
	.global	RTC_S_IRQHandler_BootLoader
	.global	TAMP_IRQHandler_BootLoader
	.global	RAMCFG_IRQHandler_BootLoader
	.global	FLASH_IRQHandler_BootLoader
	.global	FLASH_S_IRQHandler_BootLoader
	.global	GTZC_IRQHandler_BootLoader
	.global	RCC_IRQHandler_BootLoader
	.global	RCC_S_IRQHandler_BootLoader
	.global	EXTI0_IRQHandler_BootLoader
	.global	EXTI1_IRQHandler_BootLoader
	.global	EXTI2_IRQHandler_BootLoader
	.global	EXTI3_IRQHandler_BootLoader
	.global	EXTI4_IRQHandler_BootLoader
	.global	EXTI5_IRQHandler_BootLoader
	.global	EXTI6_IRQHandler_BootLoader
	.global	EXTI7_IRQHandler_BootLoader
	.global	EXTI8_IRQHandler_BootLoader
	.global	EXTI9_IRQHandler_BootLoader
	.global	EXTI10_IRQHandler_BootLoader
	.global	EXTI11_IRQHandler_BootLoader
	.global	EXTI12_IRQHandler_BootLoader
	.global	EXTI13_IRQHandler_BootLoader
	.global	EXTI14_IRQHandler_BootLoader
	.global	EXTI15_IRQHandler_BootLoader
	.global	IWDG_IRQHandler_BootLoader
	.global	GPDMA1_Channel0_IRQHandler_BootLoader
	.global	GPDMA1_Channel1_IRQHandler_BootLoader
	.global	GPDMA1_Channel2_IRQHandler_BootLoader
	.global	GPDMA1_Channel3_IRQHandler_BootLoader
	.global	GPDMA1_Channel4_IRQHandler_BootLoader
	.global	GPDMA1_Channel5_IRQHandler_BootLoader
	.global	GPDMA1_Channel6_IRQHandler_BootLoader
	.global	GPDMA1_Channel7_IRQHandler_BootLoader
	.global	ADC1_IRQHandler_BootLoader
	.global	DAC1_IRQHandler_BootLoader
	.global	FDCAN1_IT0_IRQHandler_BootLoader
	.global	FDCAN1_IT1_IRQHandler_BootLoader
	.global	TIM1_BRK_IRQHandler_BootLoader
	.global	TIM1_UP_IRQHandler_BootLoader
	.global	TIM1_TRG_COM_IRQHandler_BootLoader
	.global	TIM1_CC_IRQHandler_BootLoader
	.global	TIM2_IRQHandler_BootLoader
	.global	TIM3_IRQHandler_BootLoader
	.global	TIM4_IRQHandler_BootLoader
	.global	TIM5_IRQHandler_BootLoader
	.global	TIM6_IRQHandler_BootLoader
	.global	TIM7_IRQHandler_BootLoader
	.global	TIM8_BRK_IRQHandler_BootLoader
	.global	TIM8_UP_IRQHandler_BootLoader
	.global	TIM8_TRG_COM_IRQHandler_BootLoader
	.global	TIM8_CC_IRQHandler_BootLoader
	.global	I2C1_EV_IRQHandler_BootLoader
	.global	I2C1_ER_IRQHandler_BootLoader
	.global	I2C2_EV_IRQHandler_BootLoader
	.global	I2C2_ER_IRQHandler_BootLoader
	.global	SPI1_IRQHandler_BootLoader
	.global	SPI2_IRQHandler_BootLoader
	.global	USART1_IRQHandler_BootLoader
	.global	USART2_IRQHandler_BootLoader
	.global	USART3_IRQHandler_BootLoader
	.global	UART4_IRQHandler_BootLoader
	.global	UART5_IRQHandler_BootLoader
	.global	LPUART1_IRQHandler_BootLoader
	.global	LPTIM1_IRQHandler_BootLoader
	.global	LPTIM2_IRQHandler_BootLoader
	.global	TIM15_IRQHandler_BootLoader
	.global	TIM16_IRQHandler_BootLoader
	.global	TIM17_IRQHandler_BootLoader
	.global	COMP_IRQHandler_BootLoader
	.global	OTG_FS_IRQHandler_BootLoader
	.global	CRS_IRQHandler_BootLoader
	.global	FMC_IRQHandler_BootLoader
	.global	OCTOSPI1_IRQHandler_BootLoader
	.global	PWR_S3WU_IRQHandler_BootLoader
	.global	SDMMC1_IRQHandler_BootLoader
	.global	SDMMC2_IRQHandler_BootLoader
	.global	GPDMA1_Channel8_IRQHandler_BootLoader
	.global	GPDMA1_Channel9_IRQHandler_BootLoader
	.global	GPDMA1_Channel10_IRQHandler_BootLoader
	.global	GPDMA1_Channel11_IRQHandler_BootLoader
	.global	GPDMA1_Channel12_IRQHandler_BootLoader
	.global	GPDMA1_Channel13_IRQHandler_BootLoader
	.global	GPDMA1_Channel14_IRQHandler_BootLoader
	.global	GPDMA1_Channel15_IRQHandler_BootLoader
	.global	I2C3_EV_IRQHandler_BootLoader
	.global	I2C3_ER_IRQHandler_BootLoader
	.global	SAI1_IRQHandler_BootLoader
	.global	SAI2_IRQHandler_BootLoader
	.global	TSC_IRQHandler_BootLoader
	.global	RNG_IRQHandler_BootLoader
	.global	FPU_IRQHandler_BootLoader
	.global	HASH_IRQHandler_BootLoader
	.global	LPTIM3_IRQHandler_BootLoader
	.global	SPI3_IRQHandler_BootLoader
	.global	I2C4_ER_IRQHandler_BootLoader
	.global	I2C4_EV_IRQHandler_BootLoader
	.global	MDF1_FLT0_IRQHandler_BootLoader
	.global	MDF1_FLT1_IRQHandler_BootLoader
	.global	MDF1_FLT2_IRQHandler_BootLoader
	.global	MDF1_FLT3_IRQHandler_BootLoader
	.global	UCPD1_IRQHandler_BootLoader
	.global	ICACHE_IRQHandler_BootLoader
	.global	LPTIM4_IRQHandler_BootLoader
	.global	DCACHE1_IRQHandler_BootLoader
	.global	ADF1_IRQHandler_BootLoader
	.global	ADC4_IRQHandler_BootLoader
	.global	LPDMA1_Channel0_IRQHandler_BootLoader
	.global	LPDMA1_Channel1_IRQHandler_BootLoader
	.global	LPDMA1_Channel2_IRQHandler_BootLoader
	.global	LPDMA1_Channel3_IRQHandler_BootLoader
	.global	DMA2D_IRQHandler_BootLoader
	.global	DCMI_PSSI_IRQHandler_BootLoader
	.global	OCTOSPI2_IRQHandler_BootLoader
	.global	MDF1_FLT4_IRQHandler_BootLoader
	.global	MDF1_FLT5_IRQHandler_BootLoader
	.global	CORDIC_IRQHandler_BootLoader
	.global	FMAC_IRQHandler_BootLoader
	.global	LSECSSD_IRQHandler_BootLoader

g_pfnVectors_BootLoader:
	.word	_estack
	.word	Reset_Handler_BootLoader
	.word	NMI_Handler_BootLoader
	.word	HardFault_Handler_BootLoader
	.word	MemManage_Handler_BootLoader
	.word	BusFault_Handler_BootLoader
	.word	UsageFault_Handler_BootLoader
	.word	SecureFault_Handler_BootLoader
	.word	0
	.word	0
	.word	0
	.word	SVC_Handler_BootLoader
	.word	DebugMon_Handler_BootLoader
	.word	0
	.word	PendSV_Handler_BootLoader
	.word	SysTick_Handler_BootLoader
	.word	WWDG_IRQHandler_BootLoader
	.word	PVD_PVM_IRQHandler_BootLoader
	.word	RTC_IRQHandler_BootLoader
	.word	RTC_S_IRQHandler_BootLoader
	.word	TAMP_IRQHandler_BootLoader
	.word	RAMCFG_IRQHandler_BootLoader
	.word	FLASH_IRQHandler_BootLoader
	.word	FLASH_S_IRQHandler_BootLoader
	.word	GTZC_IRQHandler_BootLoader
	.word	RCC_IRQHandler_BootLoader
	.word	RCC_S_IRQHandler_BootLoader
	.word	EXTI0_IRQHandler_BootLoader
	.word	EXTI1_IRQHandler_BootLoader
	.word	EXTI2_IRQHandler_BootLoader
	.word	EXTI3_IRQHandler_BootLoader
	.word	EXTI4_IRQHandler_BootLoader
	.word	EXTI5_IRQHandler_BootLoader
	.word	EXTI6_IRQHandler_BootLoader
	.word	EXTI7_IRQHandler_BootLoader
	.word	EXTI8_IRQHandler_BootLoader
	.word	EXTI9_IRQHandler_BootLoader
	.word	EXTI10_IRQHandler_BootLoader
	.word	EXTI11_IRQHandler_BootLoader
	.word	EXTI12_IRQHandler_BootLoader
	.word	EXTI13_IRQHandler_BootLoader
	.word	EXTI14_IRQHandler_BootLoader
	.word	EXTI15_IRQHandler_BootLoader
	.word	IWDG_IRQHandler_BootLoader
	.word	0
	.word	GPDMA1_Channel0_IRQHandler_BootLoader
	.word	GPDMA1_Channel1_IRQHandler_BootLoader
	.word	GPDMA1_Channel2_IRQHandler_BootLoader
	.word	GPDMA1_Channel3_IRQHandler_BootLoader
	.word	GPDMA1_Channel4_IRQHandler_BootLoader
	.word	GPDMA1_Channel5_IRQHandler_BootLoader
	.word	GPDMA1_Channel6_IRQHandler_BootLoader
	.word	GPDMA1_Channel7_IRQHandler_BootLoader
	.word	ADC1_IRQHandler_BootLoader
	.word	DAC1_IRQHandler_BootLoader
	.word	FDCAN1_IT0_IRQHandler_BootLoader
	.word	FDCAN1_IT1_IRQHandler_BootLoader
	.word	TIM1_BRK_IRQHandler_BootLoader
	.word	TIM1_UP_IRQHandler_BootLoader
	.word	TIM1_TRG_COM_IRQHandler_BootLoader
	.word	TIM1_CC_IRQHandler_BootLoader
	.word	TIM2_IRQHandler_BootLoader
	.word	TIM3_IRQHandler_BootLoader
	.word	TIM4_IRQHandler_BootLoader
	.word	TIM5_IRQHandler_BootLoader
	.word	TIM6_IRQHandler_BootLoader
	.word	TIM7_IRQHandler_BootLoader
	.word	TIM8_BRK_IRQHandler_BootLoader
	.word	TIM8_UP_IRQHandler_BootLoader
	.word	TIM8_TRG_COM_IRQHandler_BootLoader
	.word	TIM8_CC_IRQHandler_BootLoader
	.word	I2C1_EV_IRQHandler_BootLoader
	.word	I2C1_ER_IRQHandler_BootLoader
	.word	I2C2_EV_IRQHandler_BootLoader
	.word	I2C2_ER_IRQHandler_BootLoader
	.word	SPI1_IRQHandler_BootLoader
	.word	SPI2_IRQHandler_BootLoader
	.word	USART1_IRQHandler_BootLoader
	.word	USART2_IRQHandler_BootLoader
	.word	USART3_IRQHandler_BootLoader
	.word	UART4_IRQHandler_BootLoader
	.word	UART5_IRQHandler_BootLoader
	.word	LPUART1_IRQHandler_BootLoader
	.word	LPTIM1_IRQHandler_BootLoader
	.word	LPTIM2_IRQHandler_BootLoader
	.word	TIM15_IRQHandler_BootLoader
	.word	TIM16_IRQHandler_BootLoader
	.word	TIM17_IRQHandler_BootLoader
	.word	COMP_IRQHandler_BootLoader
	.word	OTG_FS_IRQHandler_BootLoader
	.word	CRS_IRQHandler_BootLoader
	.word	FMC_IRQHandler_BootLoader
	.word	OCTOSPI1_IRQHandler_BootLoader
	.word	PWR_S3WU_IRQHandler_BootLoader
	.word	SDMMC1_IRQHandler_BootLoader
	.word	SDMMC2_IRQHandler_BootLoader
	.word	GPDMA1_Channel8_IRQHandler_BootLoader
	.word	GPDMA1_Channel9_IRQHandler_BootLoader
	.word	GPDMA1_Channel10_IRQHandler_BootLoader
	.word	GPDMA1_Channel11_IRQHandler_BootLoader
	.word	GPDMA1_Channel12_IRQHandler_BootLoader
	.word	GPDMA1_Channel13_IRQHandler_BootLoader
	.word	GPDMA1_Channel14_IRQHandler_BootLoader
	.word	GPDMA1_Channel15_IRQHandler_BootLoader
	.word	I2C3_EV_IRQHandler_BootLoader
	.word	I2C3_ER_IRQHandler_BootLoader
	.word	SAI1_IRQHandler_BootLoader
	.word	SAI2_IRQHandler_BootLoader
	.word	TSC_IRQHandler_BootLoader
	.word	0
	.word	RNG_IRQHandler_BootLoader
	.word	FPU_IRQHandler_BootLoader
	.word	HASH_IRQHandler_BootLoader
	.word	0
	.word	LPTIM3_IRQHandler_BootLoader
	.word	SPI3_IRQHandler_BootLoader
	.word	I2C4_ER_IRQHandler_BootLoader
	.word	I2C4_EV_IRQHandler_BootLoader
	.word	MDF1_FLT0_IRQHandler_BootLoader
	.word	MDF1_FLT1_IRQHandler_BootLoader
	.word	MDF1_FLT2_IRQHandler_BootLoader
	.word	MDF1_FLT3_IRQHandler_BootLoader
	.word	UCPD1_IRQHandler_BootLoader
	.word	ICACHE_IRQHandler_BootLoader
	.word	0
	.word	0
	.word	LPTIM4_IRQHandler_BootLoader
	.word	DCACHE1_IRQHandler_BootLoader
	.word	ADF1_IRQHandler_BootLoader
	.word	ADC4_IRQHandler_BootLoader
	.word	LPDMA1_Channel0_IRQHandler_BootLoader
	.word	LPDMA1_Channel1_IRQHandler_BootLoader
	.word	LPDMA1_Channel2_IRQHandler_BootLoader
	.word	LPDMA1_Channel3_IRQHandler_BootLoader
	.word	DMA2D_IRQHandler_BootLoader
	.word	DCMI_PSSI_IRQHandler_BootLoader
	.word	OCTOSPI2_IRQHandler_BootLoader
	.word	MDF1_FLT4_IRQHandler_BootLoader
	.word	MDF1_FLT5_IRQHandler_BootLoader
	.word	CORDIC_IRQHandler_BootLoader
	.word	FMAC_IRQHandler_BootLoader
	.word	LSECSSD_IRQHandler_BootLoader

	.size	g_pfnVectors_BootLoader, .-g_pfnVectors_BootLoader


/*******************************************************************************
*
* Provide weak aliases for each Exception handler to the Default_Handler_BootLoader.
* As they are weak aliases, any function with the same name will override
* this definition.
*
*******************************************************************************/

	// .weak	NMI_Handler
	// .thumb_set NMI_Handler,Default_Handler_BootLoader

	// .weak	HardFault_Handler
	// .thumb_set HardFault_Handler,Default_Handler_BootLoader

	// .weak	MemManage_Handler
	// .thumb_set MemManage_Handler,Default_Handler_BootLoader

	// .weak	BusFault_Handler
	// .thumb_set BusFault_Handler,Default_Handler_BootLoader

	// .weak	UsageFault_Handler
	// .thumb_set UsageFault_Handler,Default_Handler_BootLoader

	// .weak	SecureFault_Handler
	// .thumb_set SecureFault_Handler,Default_Handler_BootLoader

	// .weak	SVC_Handler
	// .thumb_set SVC_Handler,Default_Handler_BootLoader

	// .weak	DebugMon_Handler
	// .thumb_set DebugMon_Handler,Default_Handler_BootLoader

	// .weak	PendSV_Handler
	// .thumb_set PendSV_Handler,Default_Handler_BootLoader

	// .weak	SysTick_Handler
	// .thumb_set SysTick_Handler,Default_Handler_BootLoader

	// .weak	WWDG_IRQHandler
	// .thumb_set WWDG_IRQHandler,Default_Handler_BootLoader

	// .weak	PVD_PVM_IRQHandler
	// .thumb_set PVD_PVM_IRQHandler,Default_Handler_BootLoader

	// .weak	RTC_IRQHandler
	// .thumb_set RTC_IRQHandler,Default_Handler_BootLoader

	// .weak	RTC_S_IRQHandler
	// .thumb_set RTC_S_IRQHandler,Default_Handler_BootLoader

	// .weak	TAMP_IRQHandler
	// .thumb_set TAMP_IRQHandler,Default_Handler_BootLoader

	// .weak	RAMCFG_IRQHandler
	// .thumb_set RAMCFG_IRQHandler,Default_Handler_BootLoader

	// .weak	FLASH_IRQHandler
	// .thumb_set FLASH_IRQHandler,Default_Handler_BootLoader

	// .weak	FLASH_S_IRQHandler
	// .thumb_set FLASH_S_IRQHandler,Default_Handler_BootLoader

	// .weak	GTZC_IRQHandler
	// .thumb_set GTZC_IRQHandler,Default_Handler_BootLoader

	// .weak	RCC_IRQHandler
	// .thumb_set RCC_IRQHandler,Default_Handler_BootLoader

	// .weak	RCC_S_IRQHandler
	// .thumb_set RCC_S_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI0_IRQHandler
	// .thumb_set EXTI0_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI1_IRQHandler
	// .thumb_set EXTI1_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI2_IRQHandler
	// .thumb_set EXTI2_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI3_IRQHandler
	// .thumb_set EXTI3_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI4_IRQHandler
	// .thumb_set EXTI4_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI5_IRQHandler
	// .thumb_set EXTI5_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI6_IRQHandler
	// .thumb_set EXTI6_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI7_IRQHandler
	// .thumb_set EXTI7_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI8_IRQHandler
	// .thumb_set EXTI8_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI9_IRQHandler
	// .thumb_set EXTI9_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI10_IRQHandler
	// .thumb_set EXTI10_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI11_IRQHandler
	// .thumb_set EXTI11_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI12_IRQHandler
	// .thumb_set EXTI12_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI13_IRQHandler
	// .thumb_set EXTI13_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI14_IRQHandler
	// .thumb_set EXTI14_IRQHandler,Default_Handler_BootLoader

	// .weak	EXTI15_IRQHandler
	// .thumb_set EXTI15_IRQHandler,Default_Handler_BootLoader

	// .weak	IWDG_IRQHandler
	// .thumb_set IWDG_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel0_IRQHandler
	// .thumb_set GPDMA1_Channel0_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel1_IRQHandler
	// .thumb_set GPDMA1_Channel1_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel2_IRQHandler
	// .thumb_set GPDMA1_Channel2_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel3_IRQHandler
	// .thumb_set GPDMA1_Channel3_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel4_IRQHandler
	// .thumb_set GPDMA1_Channel4_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel5_IRQHandler
	// .thumb_set GPDMA1_Channel5_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel6_IRQHandler
	// .thumb_set GPDMA1_Channel6_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel7_IRQHandler
	// .thumb_set GPDMA1_Channel7_IRQHandler,Default_Handler_BootLoader

	// .weak	ADC1_IRQHandler
	// .thumb_set ADC1_IRQHandler,Default_Handler_BootLoader

	// .weak	DAC1_IRQHandler
	// .thumb_set DAC1_IRQHandler,Default_Handler_BootLoader

	// .weak	FDCAN1_IT0_IRQHandler
	// .thumb_set FDCAN1_IT0_IRQHandler,Default_Handler_BootLoader

	// .weak	FDCAN1_IT1_IRQHandler
	// .thumb_set FDCAN1_IT1_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM1_BRK_IRQHandler
	// .thumb_set TIM1_BRK_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM1_UP_IRQHandler
	// .thumb_set TIM1_UP_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM1_TRG_COM_IRQHandler
	// .thumb_set TIM1_TRG_COM_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM1_CC_IRQHandler
	// .thumb_set TIM1_CC_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM2_IRQHandler
	// .thumb_set TIM2_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM3_IRQHandler
	// .thumb_set TIM3_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM4_IRQHandler
	// .thumb_set TIM4_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM5_IRQHandler
	// .thumb_set TIM5_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM6_IRQHandler
	// .thumb_set TIM6_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM7_IRQHandler
	// .thumb_set TIM7_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM8_BRK_IRQHandler
	// .thumb_set TIM8_BRK_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM8_UP_IRQHandler
	// .thumb_set TIM8_UP_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM8_TRG_COM_IRQHandler
	// .thumb_set TIM8_TRG_COM_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM8_CC_IRQHandler
	// .thumb_set TIM8_CC_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C1_EV_IRQHandler
	// .thumb_set I2C1_EV_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C1_ER_IRQHandler
	// .thumb_set I2C1_ER_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C2_EV_IRQHandler
	// .thumb_set I2C2_EV_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C2_ER_IRQHandler
	// .thumb_set I2C2_ER_IRQHandler,Default_Handler_BootLoader

	// .weak	SPI1_IRQHandler
	// .thumb_set SPI1_IRQHandler,Default_Handler_BootLoader

	// .weak	SPI2_IRQHandler
	// .thumb_set SPI2_IRQHandler,Default_Handler_BootLoader

	// .weak	USART1_IRQHandler
	// .thumb_set USART1_IRQHandler,Default_Handler_BootLoader

	// .weak	USART2_IRQHandler
	// .thumb_set USART2_IRQHandler,Default_Handler_BootLoader

	// .weak	USART3_IRQHandler
	// .thumb_set USART3_IRQHandler,Default_Handler_BootLoader

	// .weak	UART4_IRQHandler
	// .thumb_set UART4_IRQHandler,Default_Handler_BootLoader

	// .weak	UART5_IRQHandler
	// .thumb_set UART5_IRQHandler,Default_Handler_BootLoader

	// .weak	LPUART1_IRQHandler
	// .thumb_set LPUART1_IRQHandler,Default_Handler_BootLoader

	// .weak	LPTIM1_IRQHandler
	// .thumb_set LPTIM1_IRQHandler,Default_Handler_BootLoader

	// .weak	LPTIM2_IRQHandler
	// .thumb_set LPTIM2_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM15_IRQHandler
	// .thumb_set TIM15_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM16_IRQHandler
	// .thumb_set TIM16_IRQHandler,Default_Handler_BootLoader

	// .weak	TIM17_IRQHandler
	// .thumb_set TIM17_IRQHandler,Default_Handler_BootLoader

	// .weak	COMP_IRQHandler
	// .thumb_set COMP_IRQHandler,Default_Handler_BootLoader

	// .weak	OTG_FS_IRQHandler
	// .thumb_set OTG_FS_IRQHandler,Default_Handler_BootLoader

	// .weak	CRS_IRQHandler
	// .thumb_set CRS_IRQHandler,Default_Handler_BootLoader

	// .weak	FMC_IRQHandler
	// .thumb_set FMC_IRQHandler,Default_Handler_BootLoader

	// .weak	OCTOSPI1_IRQHandler
	// .thumb_set OCTOSPI1_IRQHandler,Default_Handler_BootLoader

	// .weak	PWR_S3WU_IRQHandler
	// .thumb_set PWR_S3WU_IRQHandler,Default_Handler_BootLoader

	// .weak	SDMMC1_IRQHandler
	// .thumb_set SDMMC1_IRQHandler,Default_Handler_BootLoader

	// .weak	SDMMC2_IRQHandler
	// .thumb_set SDMMC2_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel8_IRQHandler
	// .thumb_set GPDMA1_Channel8_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel9_IRQHandler
	// .thumb_set GPDMA1_Channel9_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel10_IRQHandler
	// .thumb_set GPDMA1_Channel10_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel11_IRQHandler
	// .thumb_set GPDMA1_Channel11_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel12_IRQHandler
	// .thumb_set GPDMA1_Channel12_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel13_IRQHandler
	// .thumb_set GPDMA1_Channel13_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel14_IRQHandler
	// .thumb_set GPDMA1_Channel14_IRQHandler,Default_Handler_BootLoader

	// .weak	GPDMA1_Channel15_IRQHandler
	// .thumb_set GPDMA1_Channel15_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C3_EV_IRQHandler
	// .thumb_set I2C3_EV_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C3_ER_IRQHandler
	// .thumb_set I2C3_ER_IRQHandler,Default_Handler_BootLoader

	// .weak	SAI1_IRQHandler
	// .thumb_set SAI1_IRQHandler,Default_Handler_BootLoader

	// .weak	SAI2_IRQHandler
	// .thumb_set SAI2_IRQHandler,Default_Handler_BootLoader

	// .weak	TSC_IRQHandler
	// .thumb_set TSC_IRQHandler,Default_Handler_BootLoader

	// .weak	RNG_IRQHandler
	// .thumb_set RNG_IRQHandler,Default_Handler_BootLoader

	// .weak	FPU_IRQHandler
	// .thumb_set FPU_IRQHandler,Default_Handler_BootLoader

	// .weak	HASH_IRQHandler
	// .thumb_set HASH_IRQHandler,Default_Handler_BootLoader

	// .weak	LPTIM3_IRQHandler
	// .thumb_set LPTIM3_IRQHandler,Default_Handler_BootLoader

	// .weak	SPI3_IRQHandler
	// .thumb_set SPI3_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C4_ER_IRQHandler
	// .thumb_set I2C4_ER_IRQHandler,Default_Handler_BootLoader

	// .weak	I2C4_EV_IRQHandler
	// .thumb_set I2C4_EV_IRQHandler,Default_Handler_BootLoader

	// .weak	MDF1_FLT0_IRQHandler
	// .thumb_set MDF1_FLT0_IRQHandler,Default_Handler_BootLoader

	// .weak	MDF1_FLT1_IRQHandler
	// .thumb_set MDF1_FLT1_IRQHandler,Default_Handler_BootLoader

	// .weak	MDF1_FLT2_IRQHandler
	// .thumb_set MDF1_FLT2_IRQHandler,Default_Handler_BootLoader

	// .weak	MDF1_FLT3_IRQHandler
	// .thumb_set MDF1_FLT3_IRQHandler,Default_Handler_BootLoader

	// .weak	UCPD1_IRQHandler
	// .thumb_set UCPD1_IRQHandler,Default_Handler_BootLoader

	// .weak	ICACHE_IRQHandler
	// .thumb_set ICACHE_IRQHandler,Default_Handler_BootLoader

	// .weak	LPTIM4_IRQHandler
	// .thumb_set LPTIM4_IRQHandler,Default_Handler_BootLoader

	// .weak	DCACHE1_IRQHandler
	// .thumb_set DCACHE1_IRQHandler,Default_Handler_BootLoader

	// .weak	ADF1_IRQHandler
	// .thumb_set ADF1_IRQHandler,Default_Handler_BootLoader

	// .weak	ADC4_IRQHandler
	// .thumb_set ADC4_IRQHandler,Default_Handler_BootLoader

	// .weak	LPDMA1_Channel0_IRQHandler
	// .thumb_set LPDMA1_Channel0_IRQHandler,Default_Handler_BootLoader

	// .weak	LPDMA1_Channel1_IRQHandler
	// .thumb_set LPDMA1_Channel1_IRQHandler,Default_Handler_BootLoader

	// .weak	LPDMA1_Channel2_IRQHandler
	// .thumb_set LPDMA1_Channel2_IRQHandler,Default_Handler_BootLoader

	// .weak	LPDMA1_Channel3_IRQHandler
	// .thumb_set LPDMA1_Channel3_IRQHandler,Default_Handler_BootLoader

	// .weak	DMA2D_IRQHandler
	// .thumb_set DMA2D_IRQHandler,Default_Handler_BootLoader

	// .weak	DCMI_PSSI_IRQHandler
	// .thumb_set DCMI_PSSI_IRQHandler,Default_Handler_BootLoader

	// .weak	OCTOSPI2_IRQHandler
	// .thumb_set OCTOSPI2_IRQHandler,Default_Handler_BootLoader

	// .weak	MDF1_FLT4_IRQHandler
	// .thumb_set MDF1_FLT4_IRQHandler,Default_Handler_BootLoader

	// .weak	MDF1_FLT5_IRQHandler
	// .thumb_set MDF1_FLT5_IRQHandler,Default_Handler_BootLoader

	// .weak	CORDIC_IRQHandler
	// .thumb_set CORDIC_IRQHandler,Default_Handler_BootLoader

	// .weak	FMAC_IRQHandler
	// .thumb_set FMAC_IRQHandler,Default_Handler_BootLoader

	// .weak	LSECSSD_IRQHandler
	// .thumb_set LSECSSD_IRQHandler,Default_Handler_BootLoader


