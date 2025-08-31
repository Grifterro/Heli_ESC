/**
  ******************************************************************************
  * @file      startup_stm32f303xx.s
  * @author    MCD Application Team
  * @brief     STM32F303xx devices vector table GCC toolchain.
  *            This module performs:
  *                - Set the initial SP
  *                - Set the initial PC == Reset_Handler_APP,
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
	.cpu cortex-m33
	.fpu fpv5-sp-d16
	.thumb

.global	g_pfnVectors_APP
.global	Default_Handler_APP

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

    /*.section .app_text.app_reset, "ax", %progbits*/
	.weak	Reset_Handler_APP
	.type	Reset_Handler_APP, %function
Reset_Handler_APP:
  ldr   sp, =_estack    /* set stack pointer */

/* Conditionally set SCB->VTOR if it doesn't point to the APP */
  ldr   r0, =0xE000ED08             /* Address of SCB->VTOR */
  ldr   r1, [r0]                    /* Current value of VTOR */
  ldr   r2, =0x08020000             /* APP address (location of the APP vector) */
  cmp   r1, r2
  beq   skip_vtor_set
  str   r2, [r0]
  skip_vtor_set:

/* Call the clock system initialization function.*/
  bl  SystemInit

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
	bl	main

LoopForever:
    b LoopForever

.size	Reset_Handler_APP, .-Reset_Handler_APP

/**
 * @brief  This is the code that gets called when the processor receives an
 *         unexpected interrupt.  This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 *
 * @param  None
 * @retval : None
*/
    .section	.text.Default_Handler_APP,"ax",%progbits
Default_Handler_APP:
Infinite_Loop:
	b	Infinite_Loop
	.size	Default_Handler_APP, .-Default_Handler_APP
/******************************************************************************
*
* The minimal vector table for a Cortex-M33.  Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
*
******************************************************************************/
 	.section	.app_vector,"a",%progbits
	.type	g_pfnVectors_APP, %object

	.global	Reset_Handler_APP
	.global	NMI_Handler_APP
	.global	HardFault_Handler_APP
	.global	MemManage_Handler_APP
	.global	BusFault_Handler_APP
	.global	UsageFault_Handler_APP
	.global	SecureFault_Handler_APP
	.global	SVC_Handler_APP
	.global	DebugMon_Handler_APP
	.global	PendSV_Handler_APP
	.global	SysTick_Handler_APP
	.global	WWDG_IRQHandler_APP
	.global	PVD_PVM_IRQHandler_APP
	.global	RTC_IRQHandler_APP
	.global	RTC_S_IRQHandler_APP
	.global	TAMP_IRQHandler_APP
	.global	RAMCFG_IRQHandler_APP
	.global	FLASH_IRQHandler_APP
	.global	FLASH_S_IRQHandler_APP
	.global	GTZC_IRQHandler_APP
	.global	RCC_IRQHandler_APP
	.global	RCC_S_IRQHandler_APP
	.global	EXTI0_IRQHandler_APP
	.global	EXTI1_IRQHandler_APP
	.global	EXTI2_IRQHandler_APP
	.global	EXTI3_IRQHandler_APP
	.global	EXTI4_IRQHandler_APP
	.global	EXTI5_IRQHandler_APP
	.global	EXTI6_IRQHandler_APP
	.global	EXTI7_IRQHandler_APP
	.global	EXTI8_IRQHandler_APP
	.global	EXTI9_IRQHandler_APP
	.global	EXTI10_IRQHandler_APP
	.global	EXTI11_IRQHandler_APP
	.global	EXTI12_IRQHandler_APP
	.global	EXTI13_IRQHandler_APP
	.global	EXTI14_IRQHandler_APP
	.global	EXTI15_IRQHandler_APP
	.global	IWDG_IRQHandler_APP
	.global	GPDMA1_Channel0_IRQHandler_APP
	.global	GPDMA1_Channel1_IRQHandler_APP
	.global	GPDMA1_Channel2_IRQHandler_APP
	.global	GPDMA1_Channel3_IRQHandler_APP
	.global	GPDMA1_Channel4_IRQHandler_APP
	.global	GPDMA1_Channel5_IRQHandler_APP
	.global	GPDMA1_Channel6_IRQHandler_APP
	.global	GPDMA1_Channel7_IRQHandler_APP
	.global	ADC1_IRQHandler_APP
	.global	DAC1_IRQHandler_APP
	.global	FDCAN1_IT0_IRQHandler_APP
	.global	FDCAN1_IT1_IRQHandler_APP
	.global	TIM1_BRK_IRQHandler_APP
	.global	TIM1_UP_IRQHandler_APP
	.global	TIM1_TRG_COM_IRQHandler_APP
	.global	TIM1_CC_IRQHandler_APP
	.global	TIM2_IRQHandler_APP
	.global	TIM3_IRQHandler_APP
	.global	TIM4_IRQHandler_APP
	.global	TIM5_IRQHandler_APP
	.global	TIM6_IRQHandler_APP
	.global	TIM7_IRQHandler_APP
	.global	TIM8_BRK_IRQHandler_APP
	.global	TIM8_UP_IRQHandler_APP
	.global	TIM8_TRG_COM_IRQHandler_APP
	.global	TIM8_CC_IRQHandler_APP
	.global	I2C1_EV_IRQHandler_APP
	.global	I2C1_ER_IRQHandler_APP
	.global	I2C2_EV_IRQHandler_APP
	.global	I2C2_ER_IRQHandler_APP
	.global	SPI1_IRQHandler_APP
	.global	SPI2_IRQHandler_APP
	.global	USART1_IRQHandler_APP
	.global	USART2_IRQHandler_APP
	.global	USART3_IRQHandler_APP
	.global	UART4_IRQHandler_APP
	.global	UART5_IRQHandler_APP
	.global	LPUART1_IRQHandler_APP
	.global	LPTIM1_IRQHandler_APP
	.global	LPTIM2_IRQHandler_APP
	.global	TIM15_IRQHandler_APP
	.global	TIM16_IRQHandler_APP
	.global	TIM17_IRQHandler_APP
	.global	COMP_IRQHandler_APP
	.global	OTG_FS_IRQHandler_APP
	.global	CRS_IRQHandler_APP
	.global	FMC_IRQHandler_APP
	.global	OCTOSPI1_IRQHandler_APP
	.global	PWR_S3WU_IRQHandler_APP
	.global	SDMMC1_IRQHandler_APP
	.global	SDMMC2_IRQHandler_APP
	.global	GPDMA1_Channel8_IRQHandler_APP
	.global	GPDMA1_Channel9_IRQHandler_APP
	.global	GPDMA1_Channel10_IRQHandler_APP
	.global	GPDMA1_Channel11_IRQHandler_APP
	.global	GPDMA1_Channel12_IRQHandler_APP
	.global	GPDMA1_Channel13_IRQHandler_APP
	.global	GPDMA1_Channel14_IRQHandler_APP
	.global	GPDMA1_Channel15_IRQHandler_APP
	.global	I2C3_EV_IRQHandler_APP
	.global	I2C3_ER_IRQHandler_APP
	.global	SAI1_IRQHandler_APP
	.global	SAI2_IRQHandler_APP
	.global	TSC_IRQHandler_APP
	.global	RNG_IRQHandler_APP
	.global	FPU_IRQHandler_APP
	.global	HASH_IRQHandler_APP
	.global	LPTIM3_IRQHandler_APP
	.global	SPI3_IRQHandler_APP
	.global	I2C4_ER_IRQHandler_APP
	.global	I2C4_EV_IRQHandler_APP
	.global	MDF1_FLT0_IRQHandler_APP
	.global	MDF1_FLT1_IRQHandler_APP
	.global	MDF1_FLT2_IRQHandler_APP
	.global	MDF1_FLT3_IRQHandler_APP
	.global	UCPD1_IRQHandler_APP
	.global	ICACHE_IRQHandler_APP
	.global	LPTIM4_IRQHandler_APP
	.global	DCACHE1_IRQHandler_APP
	.global	ADF1_IRQHandler_APP
	.global	ADC4_IRQHandler_APP
	.global	LPDMA1_Channel0_IRQHandler_APP
	.global	LPDMA1_Channel1_IRQHandler_APP
	.global	LPDMA1_Channel2_IRQHandler_APP
	.global	LPDMA1_Channel3_IRQHandler_APP
	.global	DMA2D_IRQHandler_APP
	.global	DCMI_PSSI_IRQHandler_APP
	.global	OCTOSPI2_IRQHandler_APP
	.global	MDF1_FLT4_IRQHandler_APP
	.global	MDF1_FLT5_IRQHandler_APP
	.global	CORDIC_IRQHandler_APP
	.global	FMAC_IRQHandler_APP
	.global	LSECSSD_IRQHandler_APP


g_pfnVectors_APP:
	.word	_estack
	.word	Reset_Handler_APP
	.word	NMI_Handler_APP
	.word	HardFault_Handler_APP
	.word	MemManage_Handler_APP
	.word	BusFault_Handler_APP
	.word	UsageFault_Handler_APP
	.word	SecureFault_Handler_APP
	.word	0
	.word	0
	.word	0
	.word	SVC_Handler_APP
	.word	DebugMon_Handler_APP
	.word	0
	.word	PendSV_Handler_APP
	.word	SysTick_Handler_APP
	.word	WWDG_IRQHandler_APP
	.word	PVD_PVM_IRQHandler_APP
	.word	RTC_IRQHandler_APP
	.word	RTC_S_IRQHandler_APP
	.word	TAMP_IRQHandler_APP
	.word	RAMCFG_IRQHandler_APP
	.word	FLASH_IRQHandler_APP
	.word	FLASH_S_IRQHandler_APP
	.word	GTZC_IRQHandler_APP
	.word	RCC_IRQHandler_APP
	.word	RCC_S_IRQHandler_APP
	.word	EXTI0_IRQHandler_APP
	.word	EXTI1_IRQHandler_APP
	.word	EXTI2_IRQHandler_APP
	.word	EXTI3_IRQHandler_APP
	.word	EXTI4_IRQHandler_APP
	.word	EXTI5_IRQHandler_APP
	.word	EXTI6_IRQHandler_APP
	.word	EXTI7_IRQHandler_APP
	.word	EXTI8_IRQHandler_APP
	.word	EXTI9_IRQHandler_APP
	.word	EXTI10_IRQHandler_APP
	.word	EXTI11_IRQHandler_APP
	.word	EXTI12_IRQHandler_APP
	.word	EXTI13_IRQHandler_APP
	.word	EXTI14_IRQHandler_APP
	.word	EXTI15_IRQHandler_APP
	.word	IWDG_IRQHandler_APP
	.word	0
	.word	GPDMA1_Channel0_IRQHandler_APP
	.word	GPDMA1_Channel1_IRQHandler_APP
	.word	GPDMA1_Channel2_IRQHandler_APP
	.word	GPDMA1_Channel3_IRQHandler_APP
	.word	GPDMA1_Channel4_IRQHandler_APP
	.word	GPDMA1_Channel5_IRQHandler_APP
	.word	GPDMA1_Channel6_IRQHandler_APP
	.word	GPDMA1_Channel7_IRQHandler_APP
	.word	ADC1_IRQHandler_APP
	.word	DAC1_IRQHandler_APP
	.word	FDCAN1_IT0_IRQHandler_APP
	.word	FDCAN1_IT1_IRQHandler_APP
	.word	TIM1_BRK_IRQHandler_APP
	.word	TIM1_UP_IRQHandler_APP
	.word	TIM1_TRG_COM_IRQHandler_APP
	.word	TIM1_CC_IRQHandler_APP
	.word	TIM2_IRQHandler_APP
	.word	TIM3_IRQHandler_APP
	.word	TIM4_IRQHandler_APP
	.word	TIM5_IRQHandler_APP
	.word	TIM6_IRQHandler_APP
	.word	TIM7_IRQHandler_APP
	.word	TIM8_BRK_IRQHandler_APP
	.word	TIM8_UP_IRQHandler_APP
	.word	TIM8_TRG_COM_IRQHandler_APP
	.word	TIM8_CC_IRQHandler_APP
	.word	I2C1_EV_IRQHandler_APP
	.word	I2C1_ER_IRQHandler_APP
	.word	I2C2_EV_IRQHandler_APP
	.word	I2C2_ER_IRQHandler_APP
	.word	SPI1_IRQHandler_APP
	.word	SPI2_IRQHandler_APP
	.word	USART1_IRQHandler_APP
	.word	USART2_IRQHandler_APP
	.word	USART3_IRQHandler_APP
	.word	UART4_IRQHandler_APP
	.word	UART5_IRQHandler_APP
	.word	LPUART1_IRQHandler_APP
	.word	LPTIM1_IRQHandler_APP
	.word	LPTIM2_IRQHandler_APP
	.word	TIM15_IRQHandler_APP
	.word	TIM16_IRQHandler_APP
	.word	TIM17_IRQHandler_APP
	.word	COMP_IRQHandler_APP
	.word	OTG_FS_IRQHandler_APP
	.word	CRS_IRQHandler_APP
	.word	FMC_IRQHandler_APP
	.word	OCTOSPI1_IRQHandler_APP
	.word	PWR_S3WU_IRQHandler_APP
	.word	SDMMC1_IRQHandler_APP
	.word	SDMMC2_IRQHandler_APP
	.word	GPDMA1_Channel8_IRQHandler_APP
	.word	GPDMA1_Channel9_IRQHandler_APP
	.word	GPDMA1_Channel10_IRQHandler_APP
	.word	GPDMA1_Channel11_IRQHandler_APP
	.word	GPDMA1_Channel12_IRQHandler_APP
	.word	GPDMA1_Channel13_IRQHandler_APP
	.word	GPDMA1_Channel14_IRQHandler_APP
	.word	GPDMA1_Channel15_IRQHandler_APP
	.word	I2C3_EV_IRQHandler_APP
	.word	I2C3_ER_IRQHandler_APP
	.word	SAI1_IRQHandler_APP
	.word	SAI2_IRQHandler_APP
	.word	TSC_IRQHandler_APP
	.word	0
	.word	RNG_IRQHandler_APP
	.word	FPU_IRQHandler_APP
	.word	HASH_IRQHandler_APP
	.word	0
	.word	LPTIM3_IRQHandler_APP
	.word	SPI3_IRQHandler_APP
	.word	I2C4_ER_IRQHandler_APP
	.word	I2C4_EV_IRQHandler_APP
	.word	MDF1_FLT0_IRQHandler_APP
	.word	MDF1_FLT1_IRQHandler_APP
	.word	MDF1_FLT2_IRQHandler_APP
	.word	MDF1_FLT3_IRQHandler_APP
	.word	UCPD1_IRQHandler_APP
	.word	ICACHE_IRQHandler_APP
	.word	0
	.word	0
	.word	LPTIM4_IRQHandler_APP
	.word	DCACHE1_IRQHandler_APP
	.word	ADF1_IRQHandler_APP
	.word	ADC4_IRQHandler_APP
	.word	LPDMA1_Channel0_IRQHandler_APP
	.word	LPDMA1_Channel1_IRQHandler_APP
	.word	LPDMA1_Channel2_IRQHandler_APP
	.word	LPDMA1_Channel3_IRQHandler_APP
	.word	DMA2D_IRQHandler_APP
	.word	DCMI_PSSI_IRQHandler_APP
	.word	OCTOSPI2_IRQHandler_APP
	.word	MDF1_FLT4_IRQHandler_APP
	.word	MDF1_FLT5_IRQHandler_APP
	.word	CORDIC_IRQHandler_APP
	.word	FMAC_IRQHandler_APP
	.word	LSECSSD_IRQHandler_APP

	.size	g_pfnVectors_APP, .-g_pfnVectors_APP


/*******************************************************************************
*
* Provide weak aliases for each Exception handler to the Default_Handler_APP.
* As they are weak aliases, any function with the same name will override
* this definition.
*
*******************************************************************************/

	// .weak	NMI_Handler
	// .thumb_set NMI_Handler,Default_Handler_APP_APP

	// .weak	HardFault_Handler
	// .thumb_set HardFault_Handler,Default_Handler_APP

	// .weak	MemManage_Handler
	// .thumb_set MemManage_Handler,Default_Handler_APP

	// .weak	BusFault_Handler
	// .thumb_set BusFault_Handler,Default_Handler_APP

	// .weak	UsageFault_Handler
	// .thumb_set UsageFault_Handler,Default_Handler_APP

	// .weak	SecureFault_Handler
	// .thumb_set SecureFault_Handler,Default_Handler_APP

	 .weak	SVC_Handler_APP
	 .equ   SVC_Handler_APP, SVC_Handler
	// .thumb_set SVC_Handler_APP,Default_Handler_APP

	// .weak	DebugMon_Handler
	// .thumb_set DebugMon_Handler,Default_Handler_APP

	 .weak	PendSV_Handler_APP
	 .equ   PendSV_Handler_APP, PendSV_Handler
	// .thumb_set PendSV_Handler_APP,Default_Handler_APP

	 .weak	SysTick_Handler_APP
	 .equ   SysTick_Handler_APP, SysTick_Handler
	// .thumb_set SysTick_Handler_APP,Default_Handler_APP

	// .weak	WWDG_IRQHandler
	// .thumb_set WWDG_IRQHandler,Default_Handler_APP

	// .weak	PVD_PVM_IRQHandler
	// .thumb_set PVD_PVM_IRQHandler,Default_Handler_APP

	// .weak	RTC_IRQHandler
	// .thumb_set RTC_IRQHandler,Default_Handler_APP

	// .weak	RTC_S_IRQHandler
	// .thumb_set RTC_S_IRQHandler,Default_Handler_APP

	// .weak	TAMP_IRQHandler
	// .thumb_set TAMP_IRQHandler,Default_Handler_APP

	// .weak	RAMCFG_IRQHandler
	// .thumb_set RAMCFG_IRQHandler,Default_Handler_APP

	// .weak	FLASH_IRQHandler
	// .thumb_set FLASH_IRQHandler,Default_Handler_APP

	// .weak	FLASH_S_IRQHandler
	// .thumb_set FLASH_S_IRQHandler,Default_Handler_APP

	// .weak	GTZC_IRQHandler
	// .thumb_set GTZC_IRQHandler,Default_Handler_APP

	// .weak	RCC_IRQHandler
	// .thumb_set RCC_IRQHandler,Default_Handler_APP

	// .weak	RCC_S_IRQHandler
	// .thumb_set RCC_S_IRQHandler,Default_Handler_APP

	// .weak	EXTI0_IRQHandler
	// .thumb_set EXTI0_IRQHandler,Default_Handler_APP

	// .weak	EXTI1_IRQHandler
	// .thumb_set EXTI1_IRQHandler,Default_Handler_APP

	// .weak	EXTI2_IRQHandler
	// .thumb_set EXTI2_IRQHandler,Default_Handler_APP

	// .weak	EXTI3_IRQHandler
	// .thumb_set EXTI3_IRQHandler,Default_Handler_APP

	// .weak	EXTI4_IRQHandler
	// .thumb_set EXTI4_IRQHandler,Default_Handler_APP

	// .weak	EXTI5_IRQHandler
	// .thumb_set EXTI5_IRQHandler,Default_Handler_APP

	// .weak	EXTI6_IRQHandler
	// .thumb_set EXTI6_IRQHandler,Default_Handler_APP

	// .weak	EXTI7_IRQHandler
	// .thumb_set EXTI7_IRQHandler,Default_Handler_APP

	// .weak	EXTI8_IRQHandler
	// .thumb_set EXTI8_IRQHandler,Default_Handler_APP

	// .weak	EXTI9_IRQHandler
	// .thumb_set EXTI9_IRQHandler,Default_Handler_APP

	// .weak	EXTI10_IRQHandler
	// .thumb_set EXTI10_IRQHandler,Default_Handler_APP

	// .weak	EXTI11_IRQHandler
	// .thumb_set EXTI11_IRQHandler,Default_Handler_APP

	// .weak	EXTI12_IRQHandler
	// .thumb_set EXTI12_IRQHandler,Default_Handler_APP

	// .weak	EXTI13_IRQHandler
	// .thumb_set EXTI13_IRQHandler,Default_Handler_APP

	// .weak	EXTI14_IRQHandler
	// .thumb_set EXTI14_IRQHandler,Default_Handler_APP

	// .weak	EXTI15_IRQHandler
	// .thumb_set EXTI15_IRQHandler,Default_Handler_APP

	// .weak	IWDG_IRQHandler
	// .thumb_set IWDG_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel0_IRQHandler
	// .thumb_set GPDMA1_Channel0_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel1_IRQHandler
	// .thumb_set GPDMA1_Channel1_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel2_IRQHandler
	// .thumb_set GPDMA1_Channel2_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel3_IRQHandler
	// .thumb_set GPDMA1_Channel3_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel4_IRQHandler
	// .thumb_set GPDMA1_Channel4_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel5_IRQHandler
	// .thumb_set GPDMA1_Channel5_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel6_IRQHandler
	// .thumb_set GPDMA1_Channel6_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel7_IRQHandler
	// .thumb_set GPDMA1_Channel7_IRQHandler,Default_Handler_APP

	// .weak	ADC1_IRQHandler
	// .thumb_set ADC1_IRQHandler,Default_Handler_APP

	// .weak	DAC1_IRQHandler
	// .thumb_set DAC1_IRQHandler,Default_Handler_APP

	// .weak	FDCAN1_IT0_IRQHandler
	// .thumb_set FDCAN1_IT0_IRQHandler,Default_Handler_APP

	// .weak	FDCAN1_IT1_IRQHandler
	// .thumb_set FDCAN1_IT1_IRQHandler,Default_Handler_APP

	// .weak	TIM1_BRK_IRQHandler
	// .thumb_set TIM1_BRK_IRQHandler,Default_Handler_APP

	// .weak	TIM1_UP_IRQHandler
	// .thumb_set TIM1_UP_IRQHandler,Default_Handler_APP

	// .weak	TIM1_TRG_COM_IRQHandler
	// .thumb_set TIM1_TRG_COM_IRQHandler,Default_Handler_APP

	// .weak	TIM1_CC_IRQHandler
	// .thumb_set TIM1_CC_IRQHandler,Default_Handler_APP

	// .weak	TIM2_IRQHandler
	// .thumb_set TIM2_IRQHandler,Default_Handler_APP

	// .weak	TIM3_IRQHandler
	// .thumb_set TIM3_IRQHandler,Default_Handler_APP

	// .weak	TIM4_IRQHandler
	// .thumb_set TIM4_IRQHandler,Default_Handler_APP

	// .weak	TIM5_IRQHandler
	// .thumb_set TIM5_IRQHandler,Default_Handler_APP

	// .weak	TIM6_IRQHandler
	// .thumb_set TIM6_IRQHandler,Default_Handler_APP

	// .weak	TIM7_IRQHandler
	// .thumb_set TIM7_IRQHandler,Default_Handler_APP

	// .weak	TIM8_BRK_IRQHandler
	// .thumb_set TIM8_BRK_IRQHandler,Default_Handler_APP

	// .weak	TIM8_UP_IRQHandler
	// .thumb_set TIM8_UP_IRQHandler,Default_Handler_APP

	// .weak	TIM8_TRG_COM_IRQHandler
	// .thumb_set TIM8_TRG_COM_IRQHandler,Default_Handler_APP

	// .weak	TIM8_CC_IRQHandler
	// .thumb_set TIM8_CC_IRQHandler,Default_Handler_APP

	// .weak	I2C1_EV_IRQHandler
	// .thumb_set I2C1_EV_IRQHandler,Default_Handler_APP

	// .weak	I2C1_ER_IRQHandler
	// .thumb_set I2C1_ER_IRQHandler,Default_Handler_APP

	// .weak	I2C2_EV_IRQHandler
	// .thumb_set I2C2_EV_IRQHandler,Default_Handler_APP

	// .weak	I2C2_ER_IRQHandler
	// .thumb_set I2C2_ER_IRQHandler,Default_Handler_APP

	// .weak	SPI1_IRQHandler
	// .thumb_set SPI1_IRQHandler,Default_Handler_APP

	// .weak	SPI2_IRQHandler
	// .thumb_set SPI2_IRQHandler,Default_Handler_APP

	// .weak	USART1_IRQHandler
	// .thumb_set USART1_IRQHandler,Default_Handler_APP

	// .weak	USART2_IRQHandler
	// .thumb_set USART2_IRQHandler,Default_Handler_APP

	// .weak	USART3_IRQHandler
	// .thumb_set USART3_IRQHandler,Default_Handler_APP

	// .weak	UART4_IRQHandler
	// .thumb_set UART4_IRQHandler,Default_Handler_APP

	// .weak	UART5_IRQHandler
	// .thumb_set UART5_IRQHandler,Default_Handler_APP

	// .weak	LPUART1_IRQHandler
	// .thumb_set LPUART1_IRQHandler,Default_Handler_APP

	// .weak	LPTIM1_IRQHandler
	// .thumb_set LPTIM1_IRQHandler,Default_Handler_APP

	// .weak	LPTIM2_IRQHandler
	// .thumb_set LPTIM2_IRQHandler,Default_Handler_APP

	// .weak	TIM15_IRQHandler
	// .thumb_set TIM15_IRQHandler,Default_Handler_APP

	// .weak	TIM16_IRQHandler
	// .thumb_set TIM16_IRQHandler,Default_Handler_APP

	// .weak	TIM17_IRQHandler
	// .thumb_set TIM17_IRQHandler,Default_Handler_APP

	// .weak	COMP_IRQHandler
	// .thumb_set COMP_IRQHandler,Default_Handler_APP

	// .weak	OTG_FS_IRQHandler
	// .thumb_set OTG_FS_IRQHandler,Default_Handler_APP

	// .weak	CRS_IRQHandler
	// .thumb_set CRS_IRQHandler,Default_Handler_APP

	// .weak	FMC_IRQHandler
	// .thumb_set FMC_IRQHandler,Default_Handler_APP

	// .weak	OCTOSPI1_IRQHandler
	// .thumb_set OCTOSPI1_IRQHandler,Default_Handler_APP

	// .weak	PWR_S3WU_IRQHandler
	// .thumb_set PWR_S3WU_IRQHandler,Default_Handler_APP

	// .weak	SDMMC1_IRQHandler
	// .thumb_set SDMMC1_IRQHandler,Default_Handler_APP

	// .weak	SDMMC2_IRQHandler
	// .thumb_set SDMMC2_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel8_IRQHandler
	// .thumb_set GPDMA1_Channel8_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel9_IRQHandler
	// .thumb_set GPDMA1_Channel9_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel10_IRQHandler
	// .thumb_set GPDMA1_Channel10_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel11_IRQHandler
	// .thumb_set GPDMA1_Channel11_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel12_IRQHandler
	// .thumb_set GPDMA1_Channel12_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel13_IRQHandler
	// .thumb_set GPDMA1_Channel13_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel14_IRQHandler
	// .thumb_set GPDMA1_Channel14_IRQHandler,Default_Handler_APP

	// .weak	GPDMA1_Channel15_IRQHandler
	// .thumb_set GPDMA1_Channel15_IRQHandler,Default_Handler_APP

	// .weak	I2C3_EV_IRQHandler
	// .thumb_set I2C3_EV_IRQHandler,Default_Handler_APP

	// .weak	I2C3_ER_IRQHandler
	// .thumb_set I2C3_ER_IRQHandler,Default_Handler_APP

	// .weak	SAI1_IRQHandler
	// .thumb_set SAI1_IRQHandler,Default_Handler_APP

	// .weak	SAI2_IRQHandler
	// .thumb_set SAI2_IRQHandler,Default_Handler_APP

	// .weak	TSC_IRQHandler
	// .thumb_set TSC_IRQHandler,Default_Handler_APP

	// .weak	RNG_IRQHandler
	// .thumb_set RNG_IRQHandler,Default_Handler_APP

	// .weak	FPU_IRQHandler
	// .thumb_set FPU_IRQHandler,Default_Handler_APP

	// .weak	HASH_IRQHandler
	// .thumb_set HASH_IRQHandler,Default_Handler_APP

	// .weak	LPTIM3_IRQHandler
	// .thumb_set LPTIM3_IRQHandler,Default_Handler_APP

	// .weak	SPI3_IRQHandler
	// .thumb_set SPI3_IRQHandler,Default_Handler_APP

	// .weak	I2C4_ER_IRQHandler
	// .thumb_set I2C4_ER_IRQHandler,Default_Handler_APP

	// .weak	I2C4_EV_IRQHandler
	// .thumb_set I2C4_EV_IRQHandler,Default_Handler_APP

	// .weak	MDF1_FLT0_IRQHandler
	// .thumb_set MDF1_FLT0_IRQHandler,Default_Handler_APP

	// .weak	MDF1_FLT1_IRQHandler
	// .thumb_set MDF1_FLT1_IRQHandler,Default_Handler_APP

	// .weak	MDF1_FLT2_IRQHandler
	// .thumb_set MDF1_FLT2_IRQHandler,Default_Handler_APP

	// .weak	MDF1_FLT3_IRQHandler
	// .thumb_set MDF1_FLT3_IRQHandler,Default_Handler_APP

	// .weak	UCPD1_IRQHandler
	// .thumb_set UCPD1_IRQHandler,Default_Handler_APP

	// .weak	ICACHE_IRQHandler
	// .thumb_set ICACHE_IRQHandler,Default_Handler_APP

	// .weak	LPTIM4_IRQHandler
	// .thumb_set LPTIM4_IRQHandler,Default_Handler_APP

	// .weak	DCACHE1_IRQHandler
	// .thumb_set DCACHE1_IRQHandler,Default_Handler_APP

	// .weak	ADF1_IRQHandler
	// .thumb_set ADF1_IRQHandler,Default_Handler_APP

	// .weak	ADC4_IRQHandler
	// .thumb_set ADC4_IRQHandler,Default_Handler_APP

	// .weak	LPDMA1_Channel0_IRQHandler
	// .thumb_set LPDMA1_Channel0_IRQHandler,Default_Handler_APP

	// .weak	LPDMA1_Channel1_IRQHandler
	// .thumb_set LPDMA1_Channel1_IRQHandler,Default_Handler_APP

	// .weak	LPDMA1_Channel2_IRQHandler
	// .thumb_set LPDMA1_Channel2_IRQHandler,Default_Handler_APP

	// .weak	LPDMA1_Channel3_IRQHandler
	// .thumb_set LPDMA1_Channel3_IRQHandler,Default_Handler_APP

	// .weak	DMA2D_IRQHandler
	// .thumb_set DMA2D_IRQHandler,Default_Handler_APP

	// .weak	DCMI_PSSI_IRQHandler
	// .thumb_set DCMI_PSSI_IRQHandler,Default_Handler_APP

	// .weak	OCTOSPI2_IRQHandler
	// .thumb_set OCTOSPI2_IRQHandler,Default_Handler_APP

	// .weak	MDF1_FLT4_IRQHandler
	// .thumb_set MDF1_FLT4_IRQHandler,Default_Handler_APP

	// .weak	MDF1_FLT5_IRQHandler
	// .thumb_set MDF1_FLT5_IRQHandler,Default_Handler_APP

	// .weak	CORDIC_IRQHandler
	// .thumb_set CORDIC_IRQHandler,Default_Handler_APP

	// .weak	FMAC_IRQHandler
	// .thumb_set FMAC_IRQHandler,Default_Handler_APP

	// .weak	LSECSSD_IRQHandler
	// .thumb_set LSECSSD_IRQHandler,Default_Handler_APP


