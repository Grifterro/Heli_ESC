
C:/Users/fabia/Desktop/HeliESC/SW/Out/CMake_Files/APP.elf:     file format elf32-littlearm


Disassembly of section .text:

08008188 <Error_Handler>:
 8008188:	b480      	push	{r7}
 800818a:	af00      	add	r7, sp, #0
 800818c:	b672      	cpsid	i
 800818e:	bf00      	nop
 8008190:	e7fe      	b.n	8008190 <Error_Handler+0x8>

08008192 <ECU_HW_Init>:
 8008192:	b480      	push	{r7}
 8008194:	af00      	add	r7, sp, #0
 8008196:	bf00      	nop
 8008198:	46bd      	mov	sp, r7
 800819a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800819e:	4770      	bx	lr

080081a0 <HAL_MspInit>:
 80081a0:	b480      	push	{r7}
 80081a2:	af00      	add	r7, sp, #0
 80081a4:	bf00      	nop
 80081a6:	46bd      	mov	sp, r7
 80081a8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80081ac:	4770      	bx	lr

080081ae <SystemClock_Config>:
 80081ae:	b580      	push	{r7, lr}
 80081b0:	b09e      	sub	sp, #120	; 0x78
 80081b2:	af00      	add	r7, sp, #0
 80081b4:	f107 0350 	add.w	r3, r7, #80	; 0x50
 80081b8:	2228      	movs	r2, #40	; 0x28
 80081ba:	2100      	movs	r1, #0
 80081bc:	4618      	mov	r0, r3
 80081be:	f001 fe9f 	bl	8009f00 <memset>
 80081c2:	f107 033c 	add.w	r3, r7, #60	; 0x3c
 80081c6:	2200      	movs	r2, #0
 80081c8:	601a      	str	r2, [r3, #0]
 80081ca:	605a      	str	r2, [r3, #4]
 80081cc:	609a      	str	r2, [r3, #8]
 80081ce:	60da      	str	r2, [r3, #12]
 80081d0:	611a      	str	r2, [r3, #16]
 80081d2:	463b      	mov	r3, r7
 80081d4:	223c      	movs	r2, #60	; 0x3c
 80081d6:	2100      	movs	r1, #0
 80081d8:	4618      	mov	r0, r3
 80081da:	f001 fe91 	bl	8009f00 <memset>
 80081de:	2301      	movs	r3, #1
 80081e0:	653b      	str	r3, [r7, #80]	; 0x50
 80081e2:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 80081e6:	657b      	str	r3, [r7, #84]	; 0x54
 80081e8:	2300      	movs	r3, #0
 80081ea:	65bb      	str	r3, [r7, #88]	; 0x58
 80081ec:	2301      	movs	r3, #1
 80081ee:	663b      	str	r3, [r7, #96]	; 0x60
 80081f0:	2302      	movs	r3, #2
 80081f2:	66fb      	str	r3, [r7, #108]	; 0x6c
 80081f4:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 80081f8:	673b      	str	r3, [r7, #112]	; 0x70
 80081fa:	f44f 2300 	mov.w	r3, #524288	; 0x80000
 80081fe:	677b      	str	r3, [r7, #116]	; 0x74
 8008200:	f107 0350 	add.w	r3, r7, #80	; 0x50
 8008204:	4618      	mov	r0, r3
 8008206:	f000 fa97 	bl	8008738 <HAL_RCC_OscConfig>
 800820a:	4603      	mov	r3, r0
 800820c:	2b00      	cmp	r3, #0
 800820e:	d001      	beq.n	8008214 <SystemClock_Config+0x66>
 8008210:	f7ff ffba 	bl	8008188 <Error_Handler>
 8008214:	230f      	movs	r3, #15
 8008216:	63fb      	str	r3, [r7, #60]	; 0x3c
 8008218:	2302      	movs	r3, #2
 800821a:	643b      	str	r3, [r7, #64]	; 0x40
 800821c:	2300      	movs	r3, #0
 800821e:	647b      	str	r3, [r7, #68]	; 0x44
 8008220:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8008224:	64bb      	str	r3, [r7, #72]	; 0x48
 8008226:	2300      	movs	r3, #0
 8008228:	64fb      	str	r3, [r7, #76]	; 0x4c
 800822a:	f107 033c 	add.w	r3, r7, #60	; 0x3c
 800822e:	2102      	movs	r1, #2
 8008230:	4618      	mov	r0, r3
 8008232:	f001 fabf 	bl	80097b4 <HAL_RCC_ClockConfig>
 8008236:	4603      	mov	r3, r0
 8008238:	2b00      	cmp	r3, #0
 800823a:	d001      	beq.n	8008240 <SystemClock_Config+0x92>
 800823c:	f7ff ffa4 	bl	8008188 <Error_Handler>
 8008240:	2301      	movs	r3, #1
 8008242:	603b      	str	r3, [r7, #0]
 8008244:	2300      	movs	r3, #0
 8008246:	60bb      	str	r3, [r7, #8]
 8008248:	463b      	mov	r3, r7
 800824a:	4618      	mov	r0, r3
 800824c:	f001 fc84 	bl	8009b58 <HAL_RCCEx_PeriphCLKConfig>
 8008250:	4603      	mov	r3, r0
 8008252:	2b00      	cmp	r3, #0
 8008254:	d001      	beq.n	800825a <SystemClock_Config+0xac>
 8008256:	f7ff ff97 	bl	8008188 <Error_Handler>
 800825a:	bf00      	nop
 800825c:	3778      	adds	r7, #120	; 0x78
 800825e:	46bd      	mov	sp, r7
 8008260:	bd80      	pop	{r7, pc}
	...

08008264 <SystemInit>:
 8008264:	b480      	push	{r7}
 8008266:	af00      	add	r7, sp, #0
 8008268:	4b06      	ldr	r3, [pc, #24]	; (8008284 <SystemInit+0x20>)
 800826a:	f8d3 3088 	ldr.w	r3, [r3, #136]	; 0x88
 800826e:	4a05      	ldr	r2, [pc, #20]	; (8008284 <SystemInit+0x20>)
 8008270:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8008274:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8008278:	bf00      	nop
 800827a:	46bd      	mov	sp, r7
 800827c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008280:	4770      	bx	lr
 8008282:	bf00      	nop
 8008284:	e000ed00 	.word	0xe000ed00

08008288 <main>:
 8008288:	b580      	push	{r7, lr}
 800828a:	af00      	add	r7, sp, #0
 800828c:	f000 f91c 	bl	80084c8 <HAL_Init>
 8008290:	f7ff ff8d 	bl	80081ae <SystemClock_Config>
 8008294:	f7ff ff7d 	bl	8008192 <ECU_HW_Init>
 8008298:	e7fe      	b.n	8008298 <main+0x10>

0800829a <NMI_Handler>:
 800829a:	b480      	push	{r7}
 800829c:	af00      	add	r7, sp, #0
 800829e:	e7fe      	b.n	800829e <NMI_Handler+0x4>

080082a0 <HardFault_Handler>:
 80082a0:	b480      	push	{r7}
 80082a2:	af00      	add	r7, sp, #0
 80082a4:	e7fe      	b.n	80082a4 <HardFault_Handler+0x4>

080082a6 <MemManage_Handler>:
 80082a6:	b480      	push	{r7}
 80082a8:	af00      	add	r7, sp, #0
 80082aa:	e7fe      	b.n	80082aa <MemManage_Handler+0x4>

080082ac <BusFault_Handler>:
 80082ac:	b480      	push	{r7}
 80082ae:	af00      	add	r7, sp, #0
 80082b0:	e7fe      	b.n	80082b0 <BusFault_Handler+0x4>

080082b2 <UsageFault_Handler>:
 80082b2:	b480      	push	{r7}
 80082b4:	af00      	add	r7, sp, #0
 80082b6:	e7fe      	b.n	80082b6 <UsageFault_Handler+0x4>

080082b8 <SVC_Handler>:
 80082b8:	b480      	push	{r7}
 80082ba:	af00      	add	r7, sp, #0
 80082bc:	e7fe      	b.n	80082bc <SVC_Handler+0x4>

080082be <DebugMon_Handler>:
 80082be:	b480      	push	{r7}
 80082c0:	af00      	add	r7, sp, #0
 80082c2:	e7fe      	b.n	80082c2 <DebugMon_Handler+0x4>

080082c4 <PendSV_Handler>:
 80082c4:	b480      	push	{r7}
 80082c6:	af00      	add	r7, sp, #0
 80082c8:	e7fe      	b.n	80082c8 <PendSV_Handler+0x4>

080082ca <SysTick_Handler>:
 80082ca:	b480      	push	{r7}
 80082cc:	af00      	add	r7, sp, #0
 80082ce:	e7fe      	b.n	80082ce <SysTick_Handler+0x4>

080082d0 <WWDG_IRQHandler>:
 80082d0:	b480      	push	{r7}
 80082d2:	af00      	add	r7, sp, #0
 80082d4:	e7fe      	b.n	80082d4 <WWDG_IRQHandler+0x4>

080082d6 <PVD_IRQHandler>:
 80082d6:	b480      	push	{r7}
 80082d8:	af00      	add	r7, sp, #0
 80082da:	e7fe      	b.n	80082da <PVD_IRQHandler+0x4>

080082dc <TAMP_STAMP_IRQHandler>:
 80082dc:	b480      	push	{r7}
 80082de:	af00      	add	r7, sp, #0
 80082e0:	e7fe      	b.n	80082e0 <TAMP_STAMP_IRQHandler+0x4>

080082e2 <RTC_WKUP_IRQHandler>:
 80082e2:	b480      	push	{r7}
 80082e4:	af00      	add	r7, sp, #0
 80082e6:	e7fe      	b.n	80082e6 <RTC_WKUP_IRQHandler+0x4>

080082e8 <FLASH_IRQHandler>:
 80082e8:	b480      	push	{r7}
 80082ea:	af00      	add	r7, sp, #0
 80082ec:	e7fe      	b.n	80082ec <FLASH_IRQHandler+0x4>

080082ee <RCC_IRQHandler>:
 80082ee:	b480      	push	{r7}
 80082f0:	af00      	add	r7, sp, #0
 80082f2:	e7fe      	b.n	80082f2 <RCC_IRQHandler+0x4>

080082f4 <EXTI0_IRQHandler>:
 80082f4:	b480      	push	{r7}
 80082f6:	af00      	add	r7, sp, #0
 80082f8:	e7fe      	b.n	80082f8 <EXTI0_IRQHandler+0x4>

080082fa <EXTI1_IRQHandler>:
 80082fa:	b480      	push	{r7}
 80082fc:	af00      	add	r7, sp, #0
 80082fe:	e7fe      	b.n	80082fe <EXTI1_IRQHandler+0x4>

08008300 <EXTI2_TSC_IRQHandler>:
 8008300:	b480      	push	{r7}
 8008302:	af00      	add	r7, sp, #0
 8008304:	e7fe      	b.n	8008304 <EXTI2_TSC_IRQHandler+0x4>

08008306 <EXTI3_IRQHandler>:
 8008306:	b480      	push	{r7}
 8008308:	af00      	add	r7, sp, #0
 800830a:	e7fe      	b.n	800830a <EXTI3_IRQHandler+0x4>

0800830c <EXTI4_IRQHandler>:
 800830c:	b480      	push	{r7}
 800830e:	af00      	add	r7, sp, #0
 8008310:	e7fe      	b.n	8008310 <EXTI4_IRQHandler+0x4>

08008312 <DMA1_Channel1_IRQHandler>:
 8008312:	b480      	push	{r7}
 8008314:	af00      	add	r7, sp, #0
 8008316:	e7fe      	b.n	8008316 <DMA1_Channel1_IRQHandler+0x4>

08008318 <DMA1_Channel2_IRQHandler>:
 8008318:	b480      	push	{r7}
 800831a:	af00      	add	r7, sp, #0
 800831c:	e7fe      	b.n	800831c <DMA1_Channel2_IRQHandler+0x4>

0800831e <DMA1_Channel3_IRQHandler>:
 800831e:	b480      	push	{r7}
 8008320:	af00      	add	r7, sp, #0
 8008322:	e7fe      	b.n	8008322 <DMA1_Channel3_IRQHandler+0x4>

08008324 <DMA1_Channel4_IRQHandler>:
 8008324:	b480      	push	{r7}
 8008326:	af00      	add	r7, sp, #0
 8008328:	e7fe      	b.n	8008328 <DMA1_Channel4_IRQHandler+0x4>

0800832a <DMA1_Channel5_IRQHandler>:
 800832a:	b480      	push	{r7}
 800832c:	af00      	add	r7, sp, #0
 800832e:	e7fe      	b.n	800832e <DMA1_Channel5_IRQHandler+0x4>

08008330 <DMA1_Channel6_IRQHandler>:
 8008330:	b480      	push	{r7}
 8008332:	af00      	add	r7, sp, #0
 8008334:	e7fe      	b.n	8008334 <DMA1_Channel6_IRQHandler+0x4>

08008336 <DMA1_Channel7_IRQHandler>:
 8008336:	b480      	push	{r7}
 8008338:	af00      	add	r7, sp, #0
 800833a:	e7fe      	b.n	800833a <DMA1_Channel7_IRQHandler+0x4>

0800833c <ADC1_2_IRQHandler>:
 800833c:	b480      	push	{r7}
 800833e:	af00      	add	r7, sp, #0
 8008340:	e7fe      	b.n	8008340 <ADC1_2_IRQHandler+0x4>

08008342 <USB_HP_CAN_TX_IRQHandler>:
 8008342:	b480      	push	{r7}
 8008344:	af00      	add	r7, sp, #0
 8008346:	e7fe      	b.n	8008346 <USB_HP_CAN_TX_IRQHandler+0x4>

08008348 <USB_LP_CAN_RX0_IRQHandler>:
 8008348:	b480      	push	{r7}
 800834a:	af00      	add	r7, sp, #0
 800834c:	e7fe      	b.n	800834c <USB_LP_CAN_RX0_IRQHandler+0x4>

0800834e <CAN_RX1_IRQHandler>:
 800834e:	b480      	push	{r7}
 8008350:	af00      	add	r7, sp, #0
 8008352:	e7fe      	b.n	8008352 <CAN_RX1_IRQHandler+0x4>

08008354 <CAN_SCE_IRQHandler>:
 8008354:	b480      	push	{r7}
 8008356:	af00      	add	r7, sp, #0
 8008358:	e7fe      	b.n	8008358 <CAN_SCE_IRQHandler+0x4>

0800835a <EXTI9_5_IRQHandler>:
 800835a:	b480      	push	{r7}
 800835c:	af00      	add	r7, sp, #0
 800835e:	e7fe      	b.n	800835e <EXTI9_5_IRQHandler+0x4>

08008360 <TIM1_BRK_TIM15_IRQHandler>:
 8008360:	b480      	push	{r7}
 8008362:	af00      	add	r7, sp, #0
 8008364:	e7fe      	b.n	8008364 <TIM1_BRK_TIM15_IRQHandler+0x4>

08008366 <TIM1_UP_TIM16_IRQHandler>:
 8008366:	b480      	push	{r7}
 8008368:	af00      	add	r7, sp, #0
 800836a:	e7fe      	b.n	800836a <TIM1_UP_TIM16_IRQHandler+0x4>

0800836c <TIM1_TRG_COM_TIM17_IRQHandler>:
 800836c:	b480      	push	{r7}
 800836e:	af00      	add	r7, sp, #0
 8008370:	e7fe      	b.n	8008370 <TIM1_TRG_COM_TIM17_IRQHandler+0x4>

08008372 <TIM1_CC_IRQHandler>:
 8008372:	b480      	push	{r7}
 8008374:	af00      	add	r7, sp, #0
 8008376:	e7fe      	b.n	8008376 <TIM1_CC_IRQHandler+0x4>

08008378 <TIM2_IRQHandler>:
 8008378:	b480      	push	{r7}
 800837a:	af00      	add	r7, sp, #0
 800837c:	e7fe      	b.n	800837c <TIM2_IRQHandler+0x4>

0800837e <TIM3_IRQHandler>:
 800837e:	b480      	push	{r7}
 8008380:	af00      	add	r7, sp, #0
 8008382:	e7fe      	b.n	8008382 <TIM3_IRQHandler+0x4>

08008384 <TIM4_IRQHandler>:
 8008384:	b480      	push	{r7}
 8008386:	af00      	add	r7, sp, #0
 8008388:	e7fe      	b.n	8008388 <TIM4_IRQHandler+0x4>

0800838a <I2C1_EV_IRQHandler>:
 800838a:	b480      	push	{r7}
 800838c:	af00      	add	r7, sp, #0
 800838e:	e7fe      	b.n	800838e <I2C1_EV_IRQHandler+0x4>

08008390 <I2C1_ER_IRQHandler>:
 8008390:	b480      	push	{r7}
 8008392:	af00      	add	r7, sp, #0
 8008394:	e7fe      	b.n	8008394 <I2C1_ER_IRQHandler+0x4>

08008396 <I2C2_EV_IRQHandler>:
 8008396:	b480      	push	{r7}
 8008398:	af00      	add	r7, sp, #0
 800839a:	e7fe      	b.n	800839a <I2C2_EV_IRQHandler+0x4>

0800839c <I2C2_ER_IRQHandler>:
 800839c:	b480      	push	{r7}
 800839e:	af00      	add	r7, sp, #0
 80083a0:	e7fe      	b.n	80083a0 <I2C2_ER_IRQHandler+0x4>

080083a2 <SPI1_IRQHandler>:
 80083a2:	b480      	push	{r7}
 80083a4:	af00      	add	r7, sp, #0
 80083a6:	e7fe      	b.n	80083a6 <SPI1_IRQHandler+0x4>

080083a8 <SPI2_IRQHandler>:
 80083a8:	b480      	push	{r7}
 80083aa:	af00      	add	r7, sp, #0
 80083ac:	e7fe      	b.n	80083ac <SPI2_IRQHandler+0x4>

080083ae <USART1_IRQHandler>:
 80083ae:	b480      	push	{r7}
 80083b0:	af00      	add	r7, sp, #0
 80083b2:	e7fe      	b.n	80083b2 <USART1_IRQHandler+0x4>

080083b4 <USART2_IRQHandler>:
 80083b4:	b480      	push	{r7}
 80083b6:	af00      	add	r7, sp, #0
 80083b8:	e7fe      	b.n	80083b8 <USART2_IRQHandler+0x4>

080083ba <USART3_IRQHandler>:
 80083ba:	b480      	push	{r7}
 80083bc:	af00      	add	r7, sp, #0
 80083be:	e7fe      	b.n	80083be <USART3_IRQHandler+0x4>

080083c0 <EXTI15_10_IRQHandler>:
 80083c0:	b480      	push	{r7}
 80083c2:	af00      	add	r7, sp, #0
 80083c4:	e7fe      	b.n	80083c4 <EXTI15_10_IRQHandler+0x4>

080083c6 <RTC_Alarm_IRQHandler>:
 80083c6:	b480      	push	{r7}
 80083c8:	af00      	add	r7, sp, #0
 80083ca:	e7fe      	b.n	80083ca <RTC_Alarm_IRQHandler+0x4>

080083cc <USBWakeUp_IRQHandler>:
 80083cc:	b480      	push	{r7}
 80083ce:	af00      	add	r7, sp, #0
 80083d0:	e7fe      	b.n	80083d0 <USBWakeUp_IRQHandler+0x4>

080083d2 <TIM8_BRK_IRQHandler>:
 80083d2:	b480      	push	{r7}
 80083d4:	af00      	add	r7, sp, #0
 80083d6:	e7fe      	b.n	80083d6 <TIM8_BRK_IRQHandler+0x4>

080083d8 <TIM8_UP_IRQHandler>:
 80083d8:	b480      	push	{r7}
 80083da:	af00      	add	r7, sp, #0
 80083dc:	e7fe      	b.n	80083dc <TIM8_UP_IRQHandler+0x4>

080083de <TIM8_TRG_COM_IRQHandler>:
 80083de:	b480      	push	{r7}
 80083e0:	af00      	add	r7, sp, #0
 80083e2:	e7fe      	b.n	80083e2 <TIM8_TRG_COM_IRQHandler+0x4>

080083e4 <TIM8_CC_IRQHandler>:
 80083e4:	b480      	push	{r7}
 80083e6:	af00      	add	r7, sp, #0
 80083e8:	e7fe      	b.n	80083e8 <TIM8_CC_IRQHandler+0x4>

080083ea <ADC3_IRQHandler>:
 80083ea:	b480      	push	{r7}
 80083ec:	af00      	add	r7, sp, #0
 80083ee:	e7fe      	b.n	80083ee <ADC3_IRQHandler+0x4>

080083f0 <SPI3_IRQHandler>:
 80083f0:	b480      	push	{r7}
 80083f2:	af00      	add	r7, sp, #0
 80083f4:	e7fe      	b.n	80083f4 <SPI3_IRQHandler+0x4>

080083f6 <UART4_IRQHandler>:
 80083f6:	b480      	push	{r7}
 80083f8:	af00      	add	r7, sp, #0
 80083fa:	e7fe      	b.n	80083fa <UART4_IRQHandler+0x4>

080083fc <UART5_IRQHandler>:
 80083fc:	b480      	push	{r7}
 80083fe:	af00      	add	r7, sp, #0
 8008400:	e7fe      	b.n	8008400 <UART5_IRQHandler+0x4>

08008402 <TIM6_DAC_IRQHandler>:
 8008402:	b480      	push	{r7}
 8008404:	af00      	add	r7, sp, #0
 8008406:	e7fe      	b.n	8008406 <TIM6_DAC_IRQHandler+0x4>

08008408 <TIM7_IRQHandler>:
 8008408:	b480      	push	{r7}
 800840a:	af00      	add	r7, sp, #0
 800840c:	e7fe      	b.n	800840c <TIM7_IRQHandler+0x4>

0800840e <DMA2_Channel1_IRQHandler>:
 800840e:	b480      	push	{r7}
 8008410:	af00      	add	r7, sp, #0
 8008412:	e7fe      	b.n	8008412 <DMA2_Channel1_IRQHandler+0x4>

08008414 <DMA2_Channel2_IRQHandler>:
 8008414:	b480      	push	{r7}
 8008416:	af00      	add	r7, sp, #0
 8008418:	e7fe      	b.n	8008418 <DMA2_Channel2_IRQHandler+0x4>

0800841a <DMA2_Channel3_IRQHandler>:
 800841a:	b480      	push	{r7}
 800841c:	af00      	add	r7, sp, #0
 800841e:	e7fe      	b.n	800841e <DMA2_Channel3_IRQHandler+0x4>

08008420 <DMA2_Channel4_IRQHandler>:
 8008420:	b480      	push	{r7}
 8008422:	af00      	add	r7, sp, #0
 8008424:	e7fe      	b.n	8008424 <DMA2_Channel4_IRQHandler+0x4>

08008426 <DMA2_Channel5_IRQHandler>:
 8008426:	b480      	push	{r7}
 8008428:	af00      	add	r7, sp, #0
 800842a:	e7fe      	b.n	800842a <DMA2_Channel5_IRQHandler+0x4>

0800842c <ADC4_IRQHandler>:
 800842c:	b480      	push	{r7}
 800842e:	af00      	add	r7, sp, #0
 8008430:	e7fe      	b.n	8008430 <ADC4_IRQHandler+0x4>

08008432 <COMP1_2_3_IRQHandler>:
 8008432:	b480      	push	{r7}
 8008434:	af00      	add	r7, sp, #0
 8008436:	e7fe      	b.n	8008436 <COMP1_2_3_IRQHandler+0x4>

08008438 <COMP4_5_6_IRQHandler>:
 8008438:	b480      	push	{r7}
 800843a:	af00      	add	r7, sp, #0
 800843c:	e7fe      	b.n	800843c <COMP4_5_6_IRQHandler+0x4>

0800843e <COMP7_IRQHandler>:
 800843e:	b480      	push	{r7}
 8008440:	af00      	add	r7, sp, #0
 8008442:	e7fe      	b.n	8008442 <COMP7_IRQHandler+0x4>

08008444 <USB_HP_IRQHandler>:
 8008444:	b480      	push	{r7}
 8008446:	af00      	add	r7, sp, #0
 8008448:	e7fe      	b.n	8008448 <USB_HP_IRQHandler+0x4>

0800844a <USB_LP_IRQHandler>:
 800844a:	b480      	push	{r7}
 800844c:	af00      	add	r7, sp, #0
 800844e:	e7fe      	b.n	800844e <USB_LP_IRQHandler+0x4>

08008450 <USBWakeUp_RMP_IRQHandler>:
 8008450:	b480      	push	{r7}
 8008452:	af00      	add	r7, sp, #0
 8008454:	e7fe      	b.n	8008454 <USBWakeUp_RMP_IRQHandler+0x4>

08008456 <FPU_IRQHandler>:
 8008456:	b480      	push	{r7}
 8008458:	af00      	add	r7, sp, #0
 800845a:	e7fe      	b.n	800845a <FPU_IRQHandler+0x4>

0800845c <Reset_Handler>:
 800845c:	f8df d034 	ldr.w	sp, [pc, #52]	; 8008494 <LoopForever+0x2>
 8008460:	f7ff ff00 	bl	8008264 <SystemInit>
 8008464:	480c      	ldr	r0, [pc, #48]	; (8008498 <LoopForever+0x6>)
 8008466:	490d      	ldr	r1, [pc, #52]	; (800849c <LoopForever+0xa>)
 8008468:	4a0d      	ldr	r2, [pc, #52]	; (80084a0 <LoopForever+0xe>)
 800846a:	2300      	movs	r3, #0
 800846c:	e002      	b.n	8008474 <LoopCopyDataInit>

0800846e <CopyDataInit>:
 800846e:	58d4      	ldr	r4, [r2, r3]
 8008470:	50c4      	str	r4, [r0, r3]
 8008472:	3304      	adds	r3, #4

08008474 <LoopCopyDataInit>:
 8008474:	18c4      	adds	r4, r0, r3
 8008476:	428c      	cmp	r4, r1
 8008478:	d3f9      	bcc.n	800846e <CopyDataInit>
 800847a:	4a0a      	ldr	r2, [pc, #40]	; (80084a4 <LoopForever+0x12>)
 800847c:	4c0a      	ldr	r4, [pc, #40]	; (80084a8 <LoopForever+0x16>)
 800847e:	2300      	movs	r3, #0
 8008480:	e001      	b.n	8008486 <LoopFillZerobss>

08008482 <FillZerobss>:
 8008482:	6013      	str	r3, [r2, #0]
 8008484:	3204      	adds	r2, #4

08008486 <LoopFillZerobss>:
 8008486:	42a2      	cmp	r2, r4
 8008488:	d3fb      	bcc.n	8008482 <FillZerobss>
 800848a:	f001 fd15 	bl	8009eb8 <__libc_init_array>
 800848e:	f7ff fefb 	bl	8008288 <main>

08008492 <LoopForever>:
 8008492:	e7fe      	b.n	8008492 <LoopForever>
 8008494:	20008000 	.word	0x20008000
 8008498:	20000000 	.word	0x20000000
 800849c:	2000000c 	.word	0x2000000c
 80084a0:	08009fd4 	.word	0x08009fd4
 80084a4:	2000000c 	.word	0x2000000c
 80084a8:	20000010 	.word	0x20000010

080084ac <_init>:
 80084ac:	b480      	push	{r7}
 80084ae:	af00      	add	r7, sp, #0
 80084b0:	bf00      	nop
 80084b2:	46bd      	mov	sp, r7
 80084b4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80084b8:	4770      	bx	lr

080084ba <_fini>:
 80084ba:	b480      	push	{r7}
 80084bc:	af00      	add	r7, sp, #0
 80084be:	bf00      	nop
 80084c0:	46bd      	mov	sp, r7
 80084c2:	f85d 7b04 	ldr.w	r7, [sp], #4
 80084c6:	4770      	bx	lr

080084c8 <HAL_Init>:
 80084c8:	b580      	push	{r7, lr}
 80084ca:	af00      	add	r7, sp, #0
 80084cc:	4b08      	ldr	r3, [pc, #32]	; (80084f0 <HAL_Init+0x28>)
 80084ce:	681b      	ldr	r3, [r3, #0]
 80084d0:	4a07      	ldr	r2, [pc, #28]	; (80084f0 <HAL_Init+0x28>)
 80084d2:	f043 0310 	orr.w	r3, r3, #16
 80084d6:	6013      	str	r3, [r2, #0]
 80084d8:	2003      	movs	r0, #3
 80084da:	f000 f8f9 	bl	80086d0 <HAL_NVIC_SetPriorityGrouping>
 80084de:	200f      	movs	r0, #15
 80084e0:	f000 f808 	bl	80084f4 <HAL_InitTick>
 80084e4:	f7ff fe5c 	bl	80081a0 <HAL_MspInit>
 80084e8:	2300      	movs	r3, #0
 80084ea:	4618      	mov	r0, r3
 80084ec:	bd80      	pop	{r7, pc}
 80084ee:	bf00      	nop
 80084f0:	40022000 	.word	0x40022000

080084f4 <HAL_InitTick>:
 80084f4:	b580      	push	{r7, lr}
 80084f6:	b082      	sub	sp, #8
 80084f8:	af00      	add	r7, sp, #0
 80084fa:	6078      	str	r0, [r7, #4]
 80084fc:	4b12      	ldr	r3, [pc, #72]	; (8008548 <HAL_InitTick+0x54>)
 80084fe:	681a      	ldr	r2, [r3, #0]
 8008500:	4b12      	ldr	r3, [pc, #72]	; (800854c <HAL_InitTick+0x58>)
 8008502:	781b      	ldrb	r3, [r3, #0]
 8008504:	4619      	mov	r1, r3
 8008506:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 800850a:	fbb3 f3f1 	udiv	r3, r3, r1
 800850e:	fbb2 f3f3 	udiv	r3, r2, r3
 8008512:	4618      	mov	r0, r3
 8008514:	f000 f903 	bl	800871e <HAL_SYSTICK_Config>
 8008518:	4603      	mov	r3, r0
 800851a:	2b00      	cmp	r3, #0
 800851c:	d001      	beq.n	8008522 <HAL_InitTick+0x2e>
 800851e:	2301      	movs	r3, #1
 8008520:	e00e      	b.n	8008540 <HAL_InitTick+0x4c>
 8008522:	687b      	ldr	r3, [r7, #4]
 8008524:	2b0f      	cmp	r3, #15
 8008526:	d80a      	bhi.n	800853e <HAL_InitTick+0x4a>
 8008528:	2200      	movs	r2, #0
 800852a:	6879      	ldr	r1, [r7, #4]
 800852c:	f04f 30ff 	mov.w	r0, #4294967295
 8008530:	f000 f8d9 	bl	80086e6 <HAL_NVIC_SetPriority>
 8008534:	4a06      	ldr	r2, [pc, #24]	; (8008550 <HAL_InitTick+0x5c>)
 8008536:	687b      	ldr	r3, [r7, #4]
 8008538:	6013      	str	r3, [r2, #0]
 800853a:	2300      	movs	r3, #0
 800853c:	e000      	b.n	8008540 <HAL_InitTick+0x4c>
 800853e:	2301      	movs	r3, #1
 8008540:	4618      	mov	r0, r3
 8008542:	3708      	adds	r7, #8
 8008544:	46bd      	mov	sp, r7
 8008546:	bd80      	pop	{r7, pc}
 8008548:	20000000 	.word	0x20000000
 800854c:	20000008 	.word	0x20000008
 8008550:	20000004 	.word	0x20000004

08008554 <HAL_GetTick>:
 8008554:	b480      	push	{r7}
 8008556:	af00      	add	r7, sp, #0
 8008558:	4b03      	ldr	r3, [pc, #12]	; (8008568 <HAL_GetTick+0x14>)
 800855a:	681b      	ldr	r3, [r3, #0]
 800855c:	4618      	mov	r0, r3
 800855e:	46bd      	mov	sp, r7
 8008560:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008564:	4770      	bx	lr
 8008566:	bf00      	nop
 8008568:	2000000c 	.word	0x2000000c

0800856c <__NVIC_SetPriorityGrouping>:
 800856c:	b480      	push	{r7}
 800856e:	b085      	sub	sp, #20
 8008570:	af00      	add	r7, sp, #0
 8008572:	6078      	str	r0, [r7, #4]
 8008574:	687b      	ldr	r3, [r7, #4]
 8008576:	f003 0307 	and.w	r3, r3, #7
 800857a:	60fb      	str	r3, [r7, #12]
 800857c:	4b0c      	ldr	r3, [pc, #48]	; (80085b0 <__NVIC_SetPriorityGrouping+0x44>)
 800857e:	68db      	ldr	r3, [r3, #12]
 8008580:	60bb      	str	r3, [r7, #8]
 8008582:	68ba      	ldr	r2, [r7, #8]
 8008584:	f64f 03ff 	movw	r3, #63743	; 0xf8ff
 8008588:	4013      	ands	r3, r2
 800858a:	60bb      	str	r3, [r7, #8]
 800858c:	68fb      	ldr	r3, [r7, #12]
 800858e:	021a      	lsls	r2, r3, #8
 8008590:	68bb      	ldr	r3, [r7, #8]
 8008592:	4313      	orrs	r3, r2
 8008594:	f043 63bf 	orr.w	r3, r3, #100139008	; 0x5f80000
 8008598:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 800859c:	60bb      	str	r3, [r7, #8]
 800859e:	4a04      	ldr	r2, [pc, #16]	; (80085b0 <__NVIC_SetPriorityGrouping+0x44>)
 80085a0:	68bb      	ldr	r3, [r7, #8]
 80085a2:	60d3      	str	r3, [r2, #12]
 80085a4:	bf00      	nop
 80085a6:	3714      	adds	r7, #20
 80085a8:	46bd      	mov	sp, r7
 80085aa:	f85d 7b04 	ldr.w	r7, [sp], #4
 80085ae:	4770      	bx	lr
 80085b0:	e000ed00 	.word	0xe000ed00

080085b4 <__NVIC_GetPriorityGrouping>:
 80085b4:	b480      	push	{r7}
 80085b6:	af00      	add	r7, sp, #0
 80085b8:	4b04      	ldr	r3, [pc, #16]	; (80085cc <__NVIC_GetPriorityGrouping+0x18>)
 80085ba:	68db      	ldr	r3, [r3, #12]
 80085bc:	0a1b      	lsrs	r3, r3, #8
 80085be:	f003 0307 	and.w	r3, r3, #7
 80085c2:	4618      	mov	r0, r3
 80085c4:	46bd      	mov	sp, r7
 80085c6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80085ca:	4770      	bx	lr
 80085cc:	e000ed00 	.word	0xe000ed00

080085d0 <__NVIC_SetPriority>:
 80085d0:	b480      	push	{r7}
 80085d2:	b083      	sub	sp, #12
 80085d4:	af00      	add	r7, sp, #0
 80085d6:	4603      	mov	r3, r0
 80085d8:	6039      	str	r1, [r7, #0]
 80085da:	71fb      	strb	r3, [r7, #7]
 80085dc:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80085e0:	2b00      	cmp	r3, #0
 80085e2:	db0a      	blt.n	80085fa <__NVIC_SetPriority+0x2a>
 80085e4:	683b      	ldr	r3, [r7, #0]
 80085e6:	b2da      	uxtb	r2, r3
 80085e8:	490c      	ldr	r1, [pc, #48]	; (800861c <__NVIC_SetPriority+0x4c>)
 80085ea:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80085ee:	0112      	lsls	r2, r2, #4
 80085f0:	b2d2      	uxtb	r2, r2
 80085f2:	440b      	add	r3, r1
 80085f4:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 80085f8:	e00a      	b.n	8008610 <__NVIC_SetPriority+0x40>
 80085fa:	683b      	ldr	r3, [r7, #0]
 80085fc:	b2da      	uxtb	r2, r3
 80085fe:	4908      	ldr	r1, [pc, #32]	; (8008620 <__NVIC_SetPriority+0x50>)
 8008600:	79fb      	ldrb	r3, [r7, #7]
 8008602:	f003 030f 	and.w	r3, r3, #15
 8008606:	3b04      	subs	r3, #4
 8008608:	0112      	lsls	r2, r2, #4
 800860a:	b2d2      	uxtb	r2, r2
 800860c:	440b      	add	r3, r1
 800860e:	761a      	strb	r2, [r3, #24]
 8008610:	bf00      	nop
 8008612:	370c      	adds	r7, #12
 8008614:	46bd      	mov	sp, r7
 8008616:	f85d 7b04 	ldr.w	r7, [sp], #4
 800861a:	4770      	bx	lr
 800861c:	e000e100 	.word	0xe000e100
 8008620:	e000ed00 	.word	0xe000ed00

08008624 <NVIC_EncodePriority>:
 8008624:	b480      	push	{r7}
 8008626:	b089      	sub	sp, #36	; 0x24
 8008628:	af00      	add	r7, sp, #0
 800862a:	60f8      	str	r0, [r7, #12]
 800862c:	60b9      	str	r1, [r7, #8]
 800862e:	607a      	str	r2, [r7, #4]
 8008630:	68fb      	ldr	r3, [r7, #12]
 8008632:	f003 0307 	and.w	r3, r3, #7
 8008636:	61fb      	str	r3, [r7, #28]
 8008638:	69fb      	ldr	r3, [r7, #28]
 800863a:	f1c3 0307 	rsb	r3, r3, #7
 800863e:	2b04      	cmp	r3, #4
 8008640:	bf28      	it	cs
 8008642:	2304      	movcs	r3, #4
 8008644:	61bb      	str	r3, [r7, #24]
 8008646:	69fb      	ldr	r3, [r7, #28]
 8008648:	3304      	adds	r3, #4
 800864a:	2b06      	cmp	r3, #6
 800864c:	d902      	bls.n	8008654 <NVIC_EncodePriority+0x30>
 800864e:	69fb      	ldr	r3, [r7, #28]
 8008650:	3b03      	subs	r3, #3
 8008652:	e000      	b.n	8008656 <NVIC_EncodePriority+0x32>
 8008654:	2300      	movs	r3, #0
 8008656:	617b      	str	r3, [r7, #20]
 8008658:	f04f 32ff 	mov.w	r2, #4294967295
 800865c:	69bb      	ldr	r3, [r7, #24]
 800865e:	fa02 f303 	lsl.w	r3, r2, r3
 8008662:	43da      	mvns	r2, r3
 8008664:	68bb      	ldr	r3, [r7, #8]
 8008666:	401a      	ands	r2, r3
 8008668:	697b      	ldr	r3, [r7, #20]
 800866a:	409a      	lsls	r2, r3
 800866c:	f04f 31ff 	mov.w	r1, #4294967295
 8008670:	697b      	ldr	r3, [r7, #20]
 8008672:	fa01 f303 	lsl.w	r3, r1, r3
 8008676:	43d9      	mvns	r1, r3
 8008678:	687b      	ldr	r3, [r7, #4]
 800867a:	400b      	ands	r3, r1
 800867c:	4313      	orrs	r3, r2
 800867e:	4618      	mov	r0, r3
 8008680:	3724      	adds	r7, #36	; 0x24
 8008682:	46bd      	mov	sp, r7
 8008684:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008688:	4770      	bx	lr
	...

0800868c <SysTick_Config>:
 800868c:	b580      	push	{r7, lr}
 800868e:	b082      	sub	sp, #8
 8008690:	af00      	add	r7, sp, #0
 8008692:	6078      	str	r0, [r7, #4]
 8008694:	687b      	ldr	r3, [r7, #4]
 8008696:	3b01      	subs	r3, #1
 8008698:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
 800869c:	d301      	bcc.n	80086a2 <SysTick_Config+0x16>
 800869e:	2301      	movs	r3, #1
 80086a0:	e00f      	b.n	80086c2 <SysTick_Config+0x36>
 80086a2:	4a0a      	ldr	r2, [pc, #40]	; (80086cc <SysTick_Config+0x40>)
 80086a4:	687b      	ldr	r3, [r7, #4]
 80086a6:	3b01      	subs	r3, #1
 80086a8:	6053      	str	r3, [r2, #4]
 80086aa:	210f      	movs	r1, #15
 80086ac:	f04f 30ff 	mov.w	r0, #4294967295
 80086b0:	f7ff ff8e 	bl	80085d0 <__NVIC_SetPriority>
 80086b4:	4b05      	ldr	r3, [pc, #20]	; (80086cc <SysTick_Config+0x40>)
 80086b6:	2200      	movs	r2, #0
 80086b8:	609a      	str	r2, [r3, #8]
 80086ba:	4b04      	ldr	r3, [pc, #16]	; (80086cc <SysTick_Config+0x40>)
 80086bc:	2207      	movs	r2, #7
 80086be:	601a      	str	r2, [r3, #0]
 80086c0:	2300      	movs	r3, #0
 80086c2:	4618      	mov	r0, r3
 80086c4:	3708      	adds	r7, #8
 80086c6:	46bd      	mov	sp, r7
 80086c8:	bd80      	pop	{r7, pc}
 80086ca:	bf00      	nop
 80086cc:	e000e010 	.word	0xe000e010

080086d0 <HAL_NVIC_SetPriorityGrouping>:
 80086d0:	b580      	push	{r7, lr}
 80086d2:	b082      	sub	sp, #8
 80086d4:	af00      	add	r7, sp, #0
 80086d6:	6078      	str	r0, [r7, #4]
 80086d8:	6878      	ldr	r0, [r7, #4]
 80086da:	f7ff ff47 	bl	800856c <__NVIC_SetPriorityGrouping>
 80086de:	bf00      	nop
 80086e0:	3708      	adds	r7, #8
 80086e2:	46bd      	mov	sp, r7
 80086e4:	bd80      	pop	{r7, pc}

080086e6 <HAL_NVIC_SetPriority>:
 80086e6:	b580      	push	{r7, lr}
 80086e8:	b086      	sub	sp, #24
 80086ea:	af00      	add	r7, sp, #0
 80086ec:	4603      	mov	r3, r0
 80086ee:	60b9      	str	r1, [r7, #8]
 80086f0:	607a      	str	r2, [r7, #4]
 80086f2:	73fb      	strb	r3, [r7, #15]
 80086f4:	2300      	movs	r3, #0
 80086f6:	617b      	str	r3, [r7, #20]
 80086f8:	f7ff ff5c 	bl	80085b4 <__NVIC_GetPriorityGrouping>
 80086fc:	6178      	str	r0, [r7, #20]
 80086fe:	687a      	ldr	r2, [r7, #4]
 8008700:	68b9      	ldr	r1, [r7, #8]
 8008702:	6978      	ldr	r0, [r7, #20]
 8008704:	f7ff ff8e 	bl	8008624 <NVIC_EncodePriority>
 8008708:	4602      	mov	r2, r0
 800870a:	f997 300f 	ldrsb.w	r3, [r7, #15]
 800870e:	4611      	mov	r1, r2
 8008710:	4618      	mov	r0, r3
 8008712:	f7ff ff5d 	bl	80085d0 <__NVIC_SetPriority>
 8008716:	bf00      	nop
 8008718:	3718      	adds	r7, #24
 800871a:	46bd      	mov	sp, r7
 800871c:	bd80      	pop	{r7, pc}

0800871e <HAL_SYSTICK_Config>:
 800871e:	b580      	push	{r7, lr}
 8008720:	b082      	sub	sp, #8
 8008722:	af00      	add	r7, sp, #0
 8008724:	6078      	str	r0, [r7, #4]
 8008726:	6878      	ldr	r0, [r7, #4]
 8008728:	f7ff ffb0 	bl	800868c <SysTick_Config>
 800872c:	4603      	mov	r3, r0
 800872e:	4618      	mov	r0, r3
 8008730:	3708      	adds	r7, #8
 8008732:	46bd      	mov	sp, r7
 8008734:	bd80      	pop	{r7, pc}
	...

08008738 <HAL_RCC_OscConfig>:
 8008738:	b580      	push	{r7, lr}
 800873a:	f5ad 7d00 	sub.w	sp, sp, #512	; 0x200
 800873e:	af00      	add	r7, sp, #0
 8008740:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008744:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008748:	6018      	str	r0, [r3, #0]
 800874a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800874e:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008752:	681b      	ldr	r3, [r3, #0]
 8008754:	2b00      	cmp	r3, #0
 8008756:	d102      	bne.n	800875e <HAL_RCC_OscConfig+0x26>
 8008758:	2301      	movs	r3, #1
 800875a:	f001 b823 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 800875e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008762:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008766:	681b      	ldr	r3, [r3, #0]
 8008768:	681b      	ldr	r3, [r3, #0]
 800876a:	f003 0301 	and.w	r3, r3, #1
 800876e:	2b00      	cmp	r3, #0
 8008770:	f000 817d 	beq.w	8008a6e <HAL_RCC_OscConfig+0x336>
 8008774:	4bbc      	ldr	r3, [pc, #752]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008776:	685b      	ldr	r3, [r3, #4]
 8008778:	f003 030c 	and.w	r3, r3, #12
 800877c:	2b04      	cmp	r3, #4
 800877e:	d00c      	beq.n	800879a <HAL_RCC_OscConfig+0x62>
 8008780:	4bb9      	ldr	r3, [pc, #740]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008782:	685b      	ldr	r3, [r3, #4]
 8008784:	f003 030c 	and.w	r3, r3, #12
 8008788:	2b08      	cmp	r3, #8
 800878a:	d15c      	bne.n	8008846 <HAL_RCC_OscConfig+0x10e>
 800878c:	4bb6      	ldr	r3, [pc, #728]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 800878e:	685b      	ldr	r3, [r3, #4]
 8008790:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 8008794:	f5b3 3f80 	cmp.w	r3, #65536	; 0x10000
 8008798:	d155      	bne.n	8008846 <HAL_RCC_OscConfig+0x10e>
 800879a:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 800879e:	f8c7 31f0 	str.w	r3, [r7, #496]	; 0x1f0
 80087a2:	f8d7 31f0 	ldr.w	r3, [r7, #496]	; 0x1f0
 80087a6:	fa93 f3a3 	rbit	r3, r3
 80087aa:	f8c7 31ec 	str.w	r3, [r7, #492]	; 0x1ec
 80087ae:	f8d7 31ec 	ldr.w	r3, [r7, #492]	; 0x1ec
 80087b2:	fab3 f383 	clz	r3, r3
 80087b6:	b2db      	uxtb	r3, r3
 80087b8:	095b      	lsrs	r3, r3, #5
 80087ba:	b2db      	uxtb	r3, r3
 80087bc:	f043 0301 	orr.w	r3, r3, #1
 80087c0:	b2db      	uxtb	r3, r3
 80087c2:	2b01      	cmp	r3, #1
 80087c4:	d102      	bne.n	80087cc <HAL_RCC_OscConfig+0x94>
 80087c6:	4ba8      	ldr	r3, [pc, #672]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80087c8:	681b      	ldr	r3, [r3, #0]
 80087ca:	e015      	b.n	80087f8 <HAL_RCC_OscConfig+0xc0>
 80087cc:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 80087d0:	f8c7 31e8 	str.w	r3, [r7, #488]	; 0x1e8
 80087d4:	f8d7 31e8 	ldr.w	r3, [r7, #488]	; 0x1e8
 80087d8:	fa93 f3a3 	rbit	r3, r3
 80087dc:	f8c7 31e4 	str.w	r3, [r7, #484]	; 0x1e4
 80087e0:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 80087e4:	f8c7 31e0 	str.w	r3, [r7, #480]	; 0x1e0
 80087e8:	f8d7 31e0 	ldr.w	r3, [r7, #480]	; 0x1e0
 80087ec:	fa93 f3a3 	rbit	r3, r3
 80087f0:	f8c7 31dc 	str.w	r3, [r7, #476]	; 0x1dc
 80087f4:	4b9c      	ldr	r3, [pc, #624]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80087f6:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80087f8:	f44f 3200 	mov.w	r2, #131072	; 0x20000
 80087fc:	f8c7 21d8 	str.w	r2, [r7, #472]	; 0x1d8
 8008800:	f8d7 21d8 	ldr.w	r2, [r7, #472]	; 0x1d8
 8008804:	fa92 f2a2 	rbit	r2, r2
 8008808:	f8c7 21d4 	str.w	r2, [r7, #468]	; 0x1d4
 800880c:	f8d7 21d4 	ldr.w	r2, [r7, #468]	; 0x1d4
 8008810:	fab2 f282 	clz	r2, r2
 8008814:	b2d2      	uxtb	r2, r2
 8008816:	f042 0220 	orr.w	r2, r2, #32
 800881a:	b2d2      	uxtb	r2, r2
 800881c:	f002 021f 	and.w	r2, r2, #31
 8008820:	2101      	movs	r1, #1
 8008822:	fa01 f202 	lsl.w	r2, r1, r2
 8008826:	4013      	ands	r3, r2
 8008828:	2b00      	cmp	r3, #0
 800882a:	f000 811f 	beq.w	8008a6c <HAL_RCC_OscConfig+0x334>
 800882e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008832:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008836:	681b      	ldr	r3, [r3, #0]
 8008838:	685b      	ldr	r3, [r3, #4]
 800883a:	2b00      	cmp	r3, #0
 800883c:	f040 8116 	bne.w	8008a6c <HAL_RCC_OscConfig+0x334>
 8008840:	2301      	movs	r3, #1
 8008842:	f000 bfaf 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 8008846:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800884a:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 800884e:	681b      	ldr	r3, [r3, #0]
 8008850:	685b      	ldr	r3, [r3, #4]
 8008852:	f5b3 3f80 	cmp.w	r3, #65536	; 0x10000
 8008856:	d106      	bne.n	8008866 <HAL_RCC_OscConfig+0x12e>
 8008858:	4b83      	ldr	r3, [pc, #524]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 800885a:	681b      	ldr	r3, [r3, #0]
 800885c:	4a82      	ldr	r2, [pc, #520]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 800885e:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 8008862:	6013      	str	r3, [r2, #0]
 8008864:	e036      	b.n	80088d4 <HAL_RCC_OscConfig+0x19c>
 8008866:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800886a:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 800886e:	681b      	ldr	r3, [r3, #0]
 8008870:	685b      	ldr	r3, [r3, #4]
 8008872:	2b00      	cmp	r3, #0
 8008874:	d10c      	bne.n	8008890 <HAL_RCC_OscConfig+0x158>
 8008876:	4b7c      	ldr	r3, [pc, #496]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008878:	681b      	ldr	r3, [r3, #0]
 800887a:	4a7b      	ldr	r2, [pc, #492]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 800887c:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 8008880:	6013      	str	r3, [r2, #0]
 8008882:	4b79      	ldr	r3, [pc, #484]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008884:	681b      	ldr	r3, [r3, #0]
 8008886:	4a78      	ldr	r2, [pc, #480]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008888:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 800888c:	6013      	str	r3, [r2, #0]
 800888e:	e021      	b.n	80088d4 <HAL_RCC_OscConfig+0x19c>
 8008890:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008894:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008898:	681b      	ldr	r3, [r3, #0]
 800889a:	685b      	ldr	r3, [r3, #4]
 800889c:	f5b3 2fa0 	cmp.w	r3, #327680	; 0x50000
 80088a0:	d10c      	bne.n	80088bc <HAL_RCC_OscConfig+0x184>
 80088a2:	4b71      	ldr	r3, [pc, #452]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088a4:	681b      	ldr	r3, [r3, #0]
 80088a6:	4a70      	ldr	r2, [pc, #448]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088a8:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
 80088ac:	6013      	str	r3, [r2, #0]
 80088ae:	4b6e      	ldr	r3, [pc, #440]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088b0:	681b      	ldr	r3, [r3, #0]
 80088b2:	4a6d      	ldr	r2, [pc, #436]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088b4:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 80088b8:	6013      	str	r3, [r2, #0]
 80088ba:	e00b      	b.n	80088d4 <HAL_RCC_OscConfig+0x19c>
 80088bc:	4b6a      	ldr	r3, [pc, #424]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088be:	681b      	ldr	r3, [r3, #0]
 80088c0:	4a69      	ldr	r2, [pc, #420]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088c2:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 80088c6:	6013      	str	r3, [r2, #0]
 80088c8:	4b67      	ldr	r3, [pc, #412]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088ca:	681b      	ldr	r3, [r3, #0]
 80088cc:	4a66      	ldr	r2, [pc, #408]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088ce:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 80088d2:	6013      	str	r3, [r2, #0]
 80088d4:	4b64      	ldr	r3, [pc, #400]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088d6:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80088d8:	f023 020f 	bic.w	r2, r3, #15
 80088dc:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80088e0:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 80088e4:	681b      	ldr	r3, [r3, #0]
 80088e6:	689b      	ldr	r3, [r3, #8]
 80088e8:	495f      	ldr	r1, [pc, #380]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 80088ea:	4313      	orrs	r3, r2
 80088ec:	62cb      	str	r3, [r1, #44]	; 0x2c
 80088ee:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80088f2:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 80088f6:	681b      	ldr	r3, [r3, #0]
 80088f8:	685b      	ldr	r3, [r3, #4]
 80088fa:	2b00      	cmp	r3, #0
 80088fc:	d059      	beq.n	80089b2 <HAL_RCC_OscConfig+0x27a>
 80088fe:	f7ff fe29 	bl	8008554 <HAL_GetTick>
 8008902:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8008906:	e00a      	b.n	800891e <HAL_RCC_OscConfig+0x1e6>
 8008908:	f7ff fe24 	bl	8008554 <HAL_GetTick>
 800890c:	4602      	mov	r2, r0
 800890e:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8008912:	1ad3      	subs	r3, r2, r3
 8008914:	2b64      	cmp	r3, #100	; 0x64
 8008916:	d902      	bls.n	800891e <HAL_RCC_OscConfig+0x1e6>
 8008918:	2303      	movs	r3, #3
 800891a:	f000 bf43 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 800891e:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 8008922:	f8c7 31d0 	str.w	r3, [r7, #464]	; 0x1d0
 8008926:	f8d7 31d0 	ldr.w	r3, [r7, #464]	; 0x1d0
 800892a:	fa93 f3a3 	rbit	r3, r3
 800892e:	f8c7 31cc 	str.w	r3, [r7, #460]	; 0x1cc
 8008932:	f8d7 31cc 	ldr.w	r3, [r7, #460]	; 0x1cc
 8008936:	fab3 f383 	clz	r3, r3
 800893a:	b2db      	uxtb	r3, r3
 800893c:	095b      	lsrs	r3, r3, #5
 800893e:	b2db      	uxtb	r3, r3
 8008940:	f043 0301 	orr.w	r3, r3, #1
 8008944:	b2db      	uxtb	r3, r3
 8008946:	2b01      	cmp	r3, #1
 8008948:	d102      	bne.n	8008950 <HAL_RCC_OscConfig+0x218>
 800894a:	4b47      	ldr	r3, [pc, #284]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 800894c:	681b      	ldr	r3, [r3, #0]
 800894e:	e015      	b.n	800897c <HAL_RCC_OscConfig+0x244>
 8008950:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 8008954:	f8c7 31c8 	str.w	r3, [r7, #456]	; 0x1c8
 8008958:	f8d7 31c8 	ldr.w	r3, [r7, #456]	; 0x1c8
 800895c:	fa93 f3a3 	rbit	r3, r3
 8008960:	f8c7 31c4 	str.w	r3, [r7, #452]	; 0x1c4
 8008964:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 8008968:	f8c7 31c0 	str.w	r3, [r7, #448]	; 0x1c0
 800896c:	f8d7 31c0 	ldr.w	r3, [r7, #448]	; 0x1c0
 8008970:	fa93 f3a3 	rbit	r3, r3
 8008974:	f8c7 31bc 	str.w	r3, [r7, #444]	; 0x1bc
 8008978:	4b3b      	ldr	r3, [pc, #236]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 800897a:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 800897c:	f44f 3200 	mov.w	r2, #131072	; 0x20000
 8008980:	f8c7 21b8 	str.w	r2, [r7, #440]	; 0x1b8
 8008984:	f8d7 21b8 	ldr.w	r2, [r7, #440]	; 0x1b8
 8008988:	fa92 f2a2 	rbit	r2, r2
 800898c:	f8c7 21b4 	str.w	r2, [r7, #436]	; 0x1b4
 8008990:	f8d7 21b4 	ldr.w	r2, [r7, #436]	; 0x1b4
 8008994:	fab2 f282 	clz	r2, r2
 8008998:	b2d2      	uxtb	r2, r2
 800899a:	f042 0220 	orr.w	r2, r2, #32
 800899e:	b2d2      	uxtb	r2, r2
 80089a0:	f002 021f 	and.w	r2, r2, #31
 80089a4:	2101      	movs	r1, #1
 80089a6:	fa01 f202 	lsl.w	r2, r1, r2
 80089aa:	4013      	ands	r3, r2
 80089ac:	2b00      	cmp	r3, #0
 80089ae:	d0ab      	beq.n	8008908 <HAL_RCC_OscConfig+0x1d0>
 80089b0:	e05d      	b.n	8008a6e <HAL_RCC_OscConfig+0x336>
 80089b2:	f7ff fdcf 	bl	8008554 <HAL_GetTick>
 80089b6:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 80089ba:	e00a      	b.n	80089d2 <HAL_RCC_OscConfig+0x29a>
 80089bc:	f7ff fdca 	bl	8008554 <HAL_GetTick>
 80089c0:	4602      	mov	r2, r0
 80089c2:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 80089c6:	1ad3      	subs	r3, r2, r3
 80089c8:	2b64      	cmp	r3, #100	; 0x64
 80089ca:	d902      	bls.n	80089d2 <HAL_RCC_OscConfig+0x29a>
 80089cc:	2303      	movs	r3, #3
 80089ce:	f000 bee9 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 80089d2:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 80089d6:	f8c7 31b0 	str.w	r3, [r7, #432]	; 0x1b0
 80089da:	f8d7 31b0 	ldr.w	r3, [r7, #432]	; 0x1b0
 80089de:	fa93 f3a3 	rbit	r3, r3
 80089e2:	f8c7 31ac 	str.w	r3, [r7, #428]	; 0x1ac
 80089e6:	f8d7 31ac 	ldr.w	r3, [r7, #428]	; 0x1ac
 80089ea:	fab3 f383 	clz	r3, r3
 80089ee:	b2db      	uxtb	r3, r3
 80089f0:	095b      	lsrs	r3, r3, #5
 80089f2:	b2db      	uxtb	r3, r3
 80089f4:	f043 0301 	orr.w	r3, r3, #1
 80089f8:	b2db      	uxtb	r3, r3
 80089fa:	2b01      	cmp	r3, #1
 80089fc:	d102      	bne.n	8008a04 <HAL_RCC_OscConfig+0x2cc>
 80089fe:	4b1a      	ldr	r3, [pc, #104]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008a00:	681b      	ldr	r3, [r3, #0]
 8008a02:	e015      	b.n	8008a30 <HAL_RCC_OscConfig+0x2f8>
 8008a04:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 8008a08:	f8c7 31a8 	str.w	r3, [r7, #424]	; 0x1a8
 8008a0c:	f8d7 31a8 	ldr.w	r3, [r7, #424]	; 0x1a8
 8008a10:	fa93 f3a3 	rbit	r3, r3
 8008a14:	f8c7 31a4 	str.w	r3, [r7, #420]	; 0x1a4
 8008a18:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 8008a1c:	f8c7 31a0 	str.w	r3, [r7, #416]	; 0x1a0
 8008a20:	f8d7 31a0 	ldr.w	r3, [r7, #416]	; 0x1a0
 8008a24:	fa93 f3a3 	rbit	r3, r3
 8008a28:	f8c7 319c 	str.w	r3, [r7, #412]	; 0x19c
 8008a2c:	4b0e      	ldr	r3, [pc, #56]	; (8008a68 <HAL_RCC_OscConfig+0x330>)
 8008a2e:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8008a30:	f44f 3200 	mov.w	r2, #131072	; 0x20000
 8008a34:	f8c7 2198 	str.w	r2, [r7, #408]	; 0x198
 8008a38:	f8d7 2198 	ldr.w	r2, [r7, #408]	; 0x198
 8008a3c:	fa92 f2a2 	rbit	r2, r2
 8008a40:	f8c7 2194 	str.w	r2, [r7, #404]	; 0x194
 8008a44:	f8d7 2194 	ldr.w	r2, [r7, #404]	; 0x194
 8008a48:	fab2 f282 	clz	r2, r2
 8008a4c:	b2d2      	uxtb	r2, r2
 8008a4e:	f042 0220 	orr.w	r2, r2, #32
 8008a52:	b2d2      	uxtb	r2, r2
 8008a54:	f002 021f 	and.w	r2, r2, #31
 8008a58:	2101      	movs	r1, #1
 8008a5a:	fa01 f202 	lsl.w	r2, r1, r2
 8008a5e:	4013      	ands	r3, r2
 8008a60:	2b00      	cmp	r3, #0
 8008a62:	d1ab      	bne.n	80089bc <HAL_RCC_OscConfig+0x284>
 8008a64:	e003      	b.n	8008a6e <HAL_RCC_OscConfig+0x336>
 8008a66:	bf00      	nop
 8008a68:	40021000 	.word	0x40021000
 8008a6c:	bf00      	nop
 8008a6e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008a72:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008a76:	681b      	ldr	r3, [r3, #0]
 8008a78:	681b      	ldr	r3, [r3, #0]
 8008a7a:	f003 0302 	and.w	r3, r3, #2
 8008a7e:	2b00      	cmp	r3, #0
 8008a80:	f000 817d 	beq.w	8008d7e <HAL_RCC_OscConfig+0x646>
 8008a84:	4ba6      	ldr	r3, [pc, #664]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008a86:	685b      	ldr	r3, [r3, #4]
 8008a88:	f003 030c 	and.w	r3, r3, #12
 8008a8c:	2b00      	cmp	r3, #0
 8008a8e:	d00b      	beq.n	8008aa8 <HAL_RCC_OscConfig+0x370>
 8008a90:	4ba3      	ldr	r3, [pc, #652]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008a92:	685b      	ldr	r3, [r3, #4]
 8008a94:	f003 030c 	and.w	r3, r3, #12
 8008a98:	2b08      	cmp	r3, #8
 8008a9a:	d172      	bne.n	8008b82 <HAL_RCC_OscConfig+0x44a>
 8008a9c:	4ba0      	ldr	r3, [pc, #640]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008a9e:	685b      	ldr	r3, [r3, #4]
 8008aa0:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 8008aa4:	2b00      	cmp	r3, #0
 8008aa6:	d16c      	bne.n	8008b82 <HAL_RCC_OscConfig+0x44a>
 8008aa8:	2302      	movs	r3, #2
 8008aaa:	f8c7 3190 	str.w	r3, [r7, #400]	; 0x190
 8008aae:	f8d7 3190 	ldr.w	r3, [r7, #400]	; 0x190
 8008ab2:	fa93 f3a3 	rbit	r3, r3
 8008ab6:	f8c7 318c 	str.w	r3, [r7, #396]	; 0x18c
 8008aba:	f8d7 318c 	ldr.w	r3, [r7, #396]	; 0x18c
 8008abe:	fab3 f383 	clz	r3, r3
 8008ac2:	b2db      	uxtb	r3, r3
 8008ac4:	095b      	lsrs	r3, r3, #5
 8008ac6:	b2db      	uxtb	r3, r3
 8008ac8:	f043 0301 	orr.w	r3, r3, #1
 8008acc:	b2db      	uxtb	r3, r3
 8008ace:	2b01      	cmp	r3, #1
 8008ad0:	d102      	bne.n	8008ad8 <HAL_RCC_OscConfig+0x3a0>
 8008ad2:	4b93      	ldr	r3, [pc, #588]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008ad4:	681b      	ldr	r3, [r3, #0]
 8008ad6:	e013      	b.n	8008b00 <HAL_RCC_OscConfig+0x3c8>
 8008ad8:	2302      	movs	r3, #2
 8008ada:	f8c7 3188 	str.w	r3, [r7, #392]	; 0x188
 8008ade:	f8d7 3188 	ldr.w	r3, [r7, #392]	; 0x188
 8008ae2:	fa93 f3a3 	rbit	r3, r3
 8008ae6:	f8c7 3184 	str.w	r3, [r7, #388]	; 0x184
 8008aea:	2302      	movs	r3, #2
 8008aec:	f8c7 3180 	str.w	r3, [r7, #384]	; 0x180
 8008af0:	f8d7 3180 	ldr.w	r3, [r7, #384]	; 0x180
 8008af4:	fa93 f3a3 	rbit	r3, r3
 8008af8:	f8c7 317c 	str.w	r3, [r7, #380]	; 0x17c
 8008afc:	4b88      	ldr	r3, [pc, #544]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008afe:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8008b00:	2202      	movs	r2, #2
 8008b02:	f8c7 2178 	str.w	r2, [r7, #376]	; 0x178
 8008b06:	f8d7 2178 	ldr.w	r2, [r7, #376]	; 0x178
 8008b0a:	fa92 f2a2 	rbit	r2, r2
 8008b0e:	f8c7 2174 	str.w	r2, [r7, #372]	; 0x174
 8008b12:	f8d7 2174 	ldr.w	r2, [r7, #372]	; 0x174
 8008b16:	fab2 f282 	clz	r2, r2
 8008b1a:	b2d2      	uxtb	r2, r2
 8008b1c:	f042 0220 	orr.w	r2, r2, #32
 8008b20:	b2d2      	uxtb	r2, r2
 8008b22:	f002 021f 	and.w	r2, r2, #31
 8008b26:	2101      	movs	r1, #1
 8008b28:	fa01 f202 	lsl.w	r2, r1, r2
 8008b2c:	4013      	ands	r3, r2
 8008b2e:	2b00      	cmp	r3, #0
 8008b30:	d00a      	beq.n	8008b48 <HAL_RCC_OscConfig+0x410>
 8008b32:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008b36:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008b3a:	681b      	ldr	r3, [r3, #0]
 8008b3c:	691b      	ldr	r3, [r3, #16]
 8008b3e:	2b01      	cmp	r3, #1
 8008b40:	d002      	beq.n	8008b48 <HAL_RCC_OscConfig+0x410>
 8008b42:	2301      	movs	r3, #1
 8008b44:	f000 be2e 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 8008b48:	4b75      	ldr	r3, [pc, #468]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008b4a:	681b      	ldr	r3, [r3, #0]
 8008b4c:	f023 02f8 	bic.w	r2, r3, #248	; 0xf8
 8008b50:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008b54:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008b58:	681b      	ldr	r3, [r3, #0]
 8008b5a:	695b      	ldr	r3, [r3, #20]
 8008b5c:	21f8      	movs	r1, #248	; 0xf8
 8008b5e:	f8c7 1170 	str.w	r1, [r7, #368]	; 0x170
 8008b62:	f8d7 1170 	ldr.w	r1, [r7, #368]	; 0x170
 8008b66:	fa91 f1a1 	rbit	r1, r1
 8008b6a:	f8c7 116c 	str.w	r1, [r7, #364]	; 0x16c
 8008b6e:	f8d7 116c 	ldr.w	r1, [r7, #364]	; 0x16c
 8008b72:	fab1 f181 	clz	r1, r1
 8008b76:	b2c9      	uxtb	r1, r1
 8008b78:	408b      	lsls	r3, r1
 8008b7a:	4969      	ldr	r1, [pc, #420]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008b7c:	4313      	orrs	r3, r2
 8008b7e:	600b      	str	r3, [r1, #0]
 8008b80:	e0fd      	b.n	8008d7e <HAL_RCC_OscConfig+0x646>
 8008b82:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008b86:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008b8a:	681b      	ldr	r3, [r3, #0]
 8008b8c:	691b      	ldr	r3, [r3, #16]
 8008b8e:	2b00      	cmp	r3, #0
 8008b90:	f000 8088 	beq.w	8008ca4 <HAL_RCC_OscConfig+0x56c>
 8008b94:	2301      	movs	r3, #1
 8008b96:	f8c7 3168 	str.w	r3, [r7, #360]	; 0x168
 8008b9a:	f8d7 3168 	ldr.w	r3, [r7, #360]	; 0x168
 8008b9e:	fa93 f3a3 	rbit	r3, r3
 8008ba2:	f8c7 3164 	str.w	r3, [r7, #356]	; 0x164
 8008ba6:	f8d7 3164 	ldr.w	r3, [r7, #356]	; 0x164
 8008baa:	fab3 f383 	clz	r3, r3
 8008bae:	b2db      	uxtb	r3, r3
 8008bb0:	f103 5384 	add.w	r3, r3, #276824064	; 0x10800000
 8008bb4:	f503 1384 	add.w	r3, r3, #1081344	; 0x108000
 8008bb8:	009b      	lsls	r3, r3, #2
 8008bba:	461a      	mov	r2, r3
 8008bbc:	2301      	movs	r3, #1
 8008bbe:	6013      	str	r3, [r2, #0]
 8008bc0:	f7ff fcc8 	bl	8008554 <HAL_GetTick>
 8008bc4:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8008bc8:	e00a      	b.n	8008be0 <HAL_RCC_OscConfig+0x4a8>
 8008bca:	f7ff fcc3 	bl	8008554 <HAL_GetTick>
 8008bce:	4602      	mov	r2, r0
 8008bd0:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8008bd4:	1ad3      	subs	r3, r2, r3
 8008bd6:	2b02      	cmp	r3, #2
 8008bd8:	d902      	bls.n	8008be0 <HAL_RCC_OscConfig+0x4a8>
 8008bda:	2303      	movs	r3, #3
 8008bdc:	f000 bde2 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 8008be0:	2302      	movs	r3, #2
 8008be2:	f8c7 3160 	str.w	r3, [r7, #352]	; 0x160
 8008be6:	f8d7 3160 	ldr.w	r3, [r7, #352]	; 0x160
 8008bea:	fa93 f3a3 	rbit	r3, r3
 8008bee:	f8c7 315c 	str.w	r3, [r7, #348]	; 0x15c
 8008bf2:	f8d7 315c 	ldr.w	r3, [r7, #348]	; 0x15c
 8008bf6:	fab3 f383 	clz	r3, r3
 8008bfa:	b2db      	uxtb	r3, r3
 8008bfc:	095b      	lsrs	r3, r3, #5
 8008bfe:	b2db      	uxtb	r3, r3
 8008c00:	f043 0301 	orr.w	r3, r3, #1
 8008c04:	b2db      	uxtb	r3, r3
 8008c06:	2b01      	cmp	r3, #1
 8008c08:	d102      	bne.n	8008c10 <HAL_RCC_OscConfig+0x4d8>
 8008c0a:	4b45      	ldr	r3, [pc, #276]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008c0c:	681b      	ldr	r3, [r3, #0]
 8008c0e:	e013      	b.n	8008c38 <HAL_RCC_OscConfig+0x500>
 8008c10:	2302      	movs	r3, #2
 8008c12:	f8c7 3158 	str.w	r3, [r7, #344]	; 0x158
 8008c16:	f8d7 3158 	ldr.w	r3, [r7, #344]	; 0x158
 8008c1a:	fa93 f3a3 	rbit	r3, r3
 8008c1e:	f8c7 3154 	str.w	r3, [r7, #340]	; 0x154
 8008c22:	2302      	movs	r3, #2
 8008c24:	f8c7 3150 	str.w	r3, [r7, #336]	; 0x150
 8008c28:	f8d7 3150 	ldr.w	r3, [r7, #336]	; 0x150
 8008c2c:	fa93 f3a3 	rbit	r3, r3
 8008c30:	f8c7 314c 	str.w	r3, [r7, #332]	; 0x14c
 8008c34:	4b3a      	ldr	r3, [pc, #232]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008c36:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8008c38:	2202      	movs	r2, #2
 8008c3a:	f8c7 2148 	str.w	r2, [r7, #328]	; 0x148
 8008c3e:	f8d7 2148 	ldr.w	r2, [r7, #328]	; 0x148
 8008c42:	fa92 f2a2 	rbit	r2, r2
 8008c46:	f8c7 2144 	str.w	r2, [r7, #324]	; 0x144
 8008c4a:	f8d7 2144 	ldr.w	r2, [r7, #324]	; 0x144
 8008c4e:	fab2 f282 	clz	r2, r2
 8008c52:	b2d2      	uxtb	r2, r2
 8008c54:	f042 0220 	orr.w	r2, r2, #32
 8008c58:	b2d2      	uxtb	r2, r2
 8008c5a:	f002 021f 	and.w	r2, r2, #31
 8008c5e:	2101      	movs	r1, #1
 8008c60:	fa01 f202 	lsl.w	r2, r1, r2
 8008c64:	4013      	ands	r3, r2
 8008c66:	2b00      	cmp	r3, #0
 8008c68:	d0af      	beq.n	8008bca <HAL_RCC_OscConfig+0x492>
 8008c6a:	4b2d      	ldr	r3, [pc, #180]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008c6c:	681b      	ldr	r3, [r3, #0]
 8008c6e:	f023 02f8 	bic.w	r2, r3, #248	; 0xf8
 8008c72:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008c76:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008c7a:	681b      	ldr	r3, [r3, #0]
 8008c7c:	695b      	ldr	r3, [r3, #20]
 8008c7e:	21f8      	movs	r1, #248	; 0xf8
 8008c80:	f8c7 1140 	str.w	r1, [r7, #320]	; 0x140
 8008c84:	f8d7 1140 	ldr.w	r1, [r7, #320]	; 0x140
 8008c88:	fa91 f1a1 	rbit	r1, r1
 8008c8c:	f8c7 113c 	str.w	r1, [r7, #316]	; 0x13c
 8008c90:	f8d7 113c 	ldr.w	r1, [r7, #316]	; 0x13c
 8008c94:	fab1 f181 	clz	r1, r1
 8008c98:	b2c9      	uxtb	r1, r1
 8008c9a:	408b      	lsls	r3, r1
 8008c9c:	4920      	ldr	r1, [pc, #128]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008c9e:	4313      	orrs	r3, r2
 8008ca0:	600b      	str	r3, [r1, #0]
 8008ca2:	e06c      	b.n	8008d7e <HAL_RCC_OscConfig+0x646>
 8008ca4:	2301      	movs	r3, #1
 8008ca6:	f8c7 3138 	str.w	r3, [r7, #312]	; 0x138
 8008caa:	f8d7 3138 	ldr.w	r3, [r7, #312]	; 0x138
 8008cae:	fa93 f3a3 	rbit	r3, r3
 8008cb2:	f8c7 3134 	str.w	r3, [r7, #308]	; 0x134
 8008cb6:	f8d7 3134 	ldr.w	r3, [r7, #308]	; 0x134
 8008cba:	fab3 f383 	clz	r3, r3
 8008cbe:	b2db      	uxtb	r3, r3
 8008cc0:	f103 5384 	add.w	r3, r3, #276824064	; 0x10800000
 8008cc4:	f503 1384 	add.w	r3, r3, #1081344	; 0x108000
 8008cc8:	009b      	lsls	r3, r3, #2
 8008cca:	461a      	mov	r2, r3
 8008ccc:	2300      	movs	r3, #0
 8008cce:	6013      	str	r3, [r2, #0]
 8008cd0:	f7ff fc40 	bl	8008554 <HAL_GetTick>
 8008cd4:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8008cd8:	e00a      	b.n	8008cf0 <HAL_RCC_OscConfig+0x5b8>
 8008cda:	f7ff fc3b 	bl	8008554 <HAL_GetTick>
 8008cde:	4602      	mov	r2, r0
 8008ce0:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8008ce4:	1ad3      	subs	r3, r2, r3
 8008ce6:	2b02      	cmp	r3, #2
 8008ce8:	d902      	bls.n	8008cf0 <HAL_RCC_OscConfig+0x5b8>
 8008cea:	2303      	movs	r3, #3
 8008cec:	f000 bd5a 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 8008cf0:	2302      	movs	r3, #2
 8008cf2:	f8c7 3130 	str.w	r3, [r7, #304]	; 0x130
 8008cf6:	f8d7 3130 	ldr.w	r3, [r7, #304]	; 0x130
 8008cfa:	fa93 f3a3 	rbit	r3, r3
 8008cfe:	f8c7 312c 	str.w	r3, [r7, #300]	; 0x12c
 8008d02:	f8d7 312c 	ldr.w	r3, [r7, #300]	; 0x12c
 8008d06:	fab3 f383 	clz	r3, r3
 8008d0a:	b2db      	uxtb	r3, r3
 8008d0c:	095b      	lsrs	r3, r3, #5
 8008d0e:	b2db      	uxtb	r3, r3
 8008d10:	f043 0301 	orr.w	r3, r3, #1
 8008d14:	b2db      	uxtb	r3, r3
 8008d16:	2b01      	cmp	r3, #1
 8008d18:	d104      	bne.n	8008d24 <HAL_RCC_OscConfig+0x5ec>
 8008d1a:	4b01      	ldr	r3, [pc, #4]	; (8008d20 <HAL_RCC_OscConfig+0x5e8>)
 8008d1c:	681b      	ldr	r3, [r3, #0]
 8008d1e:	e015      	b.n	8008d4c <HAL_RCC_OscConfig+0x614>
 8008d20:	40021000 	.word	0x40021000
 8008d24:	2302      	movs	r3, #2
 8008d26:	f8c7 3128 	str.w	r3, [r7, #296]	; 0x128
 8008d2a:	f8d7 3128 	ldr.w	r3, [r7, #296]	; 0x128
 8008d2e:	fa93 f3a3 	rbit	r3, r3
 8008d32:	f8c7 3124 	str.w	r3, [r7, #292]	; 0x124
 8008d36:	2302      	movs	r3, #2
 8008d38:	f8c7 3120 	str.w	r3, [r7, #288]	; 0x120
 8008d3c:	f8d7 3120 	ldr.w	r3, [r7, #288]	; 0x120
 8008d40:	fa93 f3a3 	rbit	r3, r3
 8008d44:	f8c7 311c 	str.w	r3, [r7, #284]	; 0x11c
 8008d48:	4bc8      	ldr	r3, [pc, #800]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008d4a:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8008d4c:	2202      	movs	r2, #2
 8008d4e:	f8c7 2118 	str.w	r2, [r7, #280]	; 0x118
 8008d52:	f8d7 2118 	ldr.w	r2, [r7, #280]	; 0x118
 8008d56:	fa92 f2a2 	rbit	r2, r2
 8008d5a:	f8c7 2114 	str.w	r2, [r7, #276]	; 0x114
 8008d5e:	f8d7 2114 	ldr.w	r2, [r7, #276]	; 0x114
 8008d62:	fab2 f282 	clz	r2, r2
 8008d66:	b2d2      	uxtb	r2, r2
 8008d68:	f042 0220 	orr.w	r2, r2, #32
 8008d6c:	b2d2      	uxtb	r2, r2
 8008d6e:	f002 021f 	and.w	r2, r2, #31
 8008d72:	2101      	movs	r1, #1
 8008d74:	fa01 f202 	lsl.w	r2, r1, r2
 8008d78:	4013      	ands	r3, r2
 8008d7a:	2b00      	cmp	r3, #0
 8008d7c:	d1ad      	bne.n	8008cda <HAL_RCC_OscConfig+0x5a2>
 8008d7e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008d82:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008d86:	681b      	ldr	r3, [r3, #0]
 8008d88:	681b      	ldr	r3, [r3, #0]
 8008d8a:	f003 0308 	and.w	r3, r3, #8
 8008d8e:	2b00      	cmp	r3, #0
 8008d90:	f000 8110 	beq.w	8008fb4 <HAL_RCC_OscConfig+0x87c>
 8008d94:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008d98:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008d9c:	681b      	ldr	r3, [r3, #0]
 8008d9e:	699b      	ldr	r3, [r3, #24]
 8008da0:	2b00      	cmp	r3, #0
 8008da2:	d079      	beq.n	8008e98 <HAL_RCC_OscConfig+0x760>
 8008da4:	2301      	movs	r3, #1
 8008da6:	f8c7 3110 	str.w	r3, [r7, #272]	; 0x110
 8008daa:	f8d7 3110 	ldr.w	r3, [r7, #272]	; 0x110
 8008dae:	fa93 f3a3 	rbit	r3, r3
 8008db2:	f8c7 310c 	str.w	r3, [r7, #268]	; 0x10c
 8008db6:	f8d7 310c 	ldr.w	r3, [r7, #268]	; 0x10c
 8008dba:	fab3 f383 	clz	r3, r3
 8008dbe:	b2db      	uxtb	r3, r3
 8008dc0:	461a      	mov	r2, r3
 8008dc2:	4bab      	ldr	r3, [pc, #684]	; (8009070 <HAL_RCC_OscConfig+0x938>)
 8008dc4:	4413      	add	r3, r2
 8008dc6:	009b      	lsls	r3, r3, #2
 8008dc8:	461a      	mov	r2, r3
 8008dca:	2301      	movs	r3, #1
 8008dcc:	6013      	str	r3, [r2, #0]
 8008dce:	f7ff fbc1 	bl	8008554 <HAL_GetTick>
 8008dd2:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8008dd6:	e00a      	b.n	8008dee <HAL_RCC_OscConfig+0x6b6>
 8008dd8:	f7ff fbbc 	bl	8008554 <HAL_GetTick>
 8008ddc:	4602      	mov	r2, r0
 8008dde:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8008de2:	1ad3      	subs	r3, r2, r3
 8008de4:	2b02      	cmp	r3, #2
 8008de6:	d902      	bls.n	8008dee <HAL_RCC_OscConfig+0x6b6>
 8008de8:	2303      	movs	r3, #3
 8008dea:	f000 bcdb 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 8008dee:	2302      	movs	r3, #2
 8008df0:	f8c7 3108 	str.w	r3, [r7, #264]	; 0x108
 8008df4:	f8d7 3108 	ldr.w	r3, [r7, #264]	; 0x108
 8008df8:	fa93 f3a3 	rbit	r3, r3
 8008dfc:	f8c7 3104 	str.w	r3, [r7, #260]	; 0x104
 8008e00:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e04:	f5a3 7380 	sub.w	r3, r3, #256	; 0x100
 8008e08:	2202      	movs	r2, #2
 8008e0a:	601a      	str	r2, [r3, #0]
 8008e0c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e10:	f5a3 7380 	sub.w	r3, r3, #256	; 0x100
 8008e14:	681b      	ldr	r3, [r3, #0]
 8008e16:	fa93 f2a3 	rbit	r2, r3
 8008e1a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e1e:	f5a3 7382 	sub.w	r3, r3, #260	; 0x104
 8008e22:	601a      	str	r2, [r3, #0]
 8008e24:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e28:	f5a3 7384 	sub.w	r3, r3, #264	; 0x108
 8008e2c:	2202      	movs	r2, #2
 8008e2e:	601a      	str	r2, [r3, #0]
 8008e30:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e34:	f5a3 7384 	sub.w	r3, r3, #264	; 0x108
 8008e38:	681b      	ldr	r3, [r3, #0]
 8008e3a:	fa93 f2a3 	rbit	r2, r3
 8008e3e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e42:	f5a3 7386 	sub.w	r3, r3, #268	; 0x10c
 8008e46:	601a      	str	r2, [r3, #0]
 8008e48:	4b88      	ldr	r3, [pc, #544]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008e4a:	6a5a      	ldr	r2, [r3, #36]	; 0x24
 8008e4c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e50:	f5a3 7388 	sub.w	r3, r3, #272	; 0x110
 8008e54:	2102      	movs	r1, #2
 8008e56:	6019      	str	r1, [r3, #0]
 8008e58:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e5c:	f5a3 7388 	sub.w	r3, r3, #272	; 0x110
 8008e60:	681b      	ldr	r3, [r3, #0]
 8008e62:	fa93 f1a3 	rbit	r1, r3
 8008e66:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e6a:	f5a3 738a 	sub.w	r3, r3, #276	; 0x114
 8008e6e:	6019      	str	r1, [r3, #0]
 8008e70:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e74:	f5a3 738a 	sub.w	r3, r3, #276	; 0x114
 8008e78:	681b      	ldr	r3, [r3, #0]
 8008e7a:	fab3 f383 	clz	r3, r3
 8008e7e:	b2db      	uxtb	r3, r3
 8008e80:	f043 0360 	orr.w	r3, r3, #96	; 0x60
 8008e84:	b2db      	uxtb	r3, r3
 8008e86:	f003 031f 	and.w	r3, r3, #31
 8008e8a:	2101      	movs	r1, #1
 8008e8c:	fa01 f303 	lsl.w	r3, r1, r3
 8008e90:	4013      	ands	r3, r2
 8008e92:	2b00      	cmp	r3, #0
 8008e94:	d0a0      	beq.n	8008dd8 <HAL_RCC_OscConfig+0x6a0>
 8008e96:	e08d      	b.n	8008fb4 <HAL_RCC_OscConfig+0x87c>
 8008e98:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008e9c:	f5a3 738c 	sub.w	r3, r3, #280	; 0x118
 8008ea0:	2201      	movs	r2, #1
 8008ea2:	601a      	str	r2, [r3, #0]
 8008ea4:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008ea8:	f5a3 738c 	sub.w	r3, r3, #280	; 0x118
 8008eac:	681b      	ldr	r3, [r3, #0]
 8008eae:	fa93 f2a3 	rbit	r2, r3
 8008eb2:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008eb6:	f5a3 738e 	sub.w	r3, r3, #284	; 0x11c
 8008eba:	601a      	str	r2, [r3, #0]
 8008ebc:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008ec0:	f5a3 738e 	sub.w	r3, r3, #284	; 0x11c
 8008ec4:	681b      	ldr	r3, [r3, #0]
 8008ec6:	fab3 f383 	clz	r3, r3
 8008eca:	b2db      	uxtb	r3, r3
 8008ecc:	461a      	mov	r2, r3
 8008ece:	4b68      	ldr	r3, [pc, #416]	; (8009070 <HAL_RCC_OscConfig+0x938>)
 8008ed0:	4413      	add	r3, r2
 8008ed2:	009b      	lsls	r3, r3, #2
 8008ed4:	461a      	mov	r2, r3
 8008ed6:	2300      	movs	r3, #0
 8008ed8:	6013      	str	r3, [r2, #0]
 8008eda:	f7ff fb3b 	bl	8008554 <HAL_GetTick>
 8008ede:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8008ee2:	e00a      	b.n	8008efa <HAL_RCC_OscConfig+0x7c2>
 8008ee4:	f7ff fb36 	bl	8008554 <HAL_GetTick>
 8008ee8:	4602      	mov	r2, r0
 8008eea:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8008eee:	1ad3      	subs	r3, r2, r3
 8008ef0:	2b02      	cmp	r3, #2
 8008ef2:	d902      	bls.n	8008efa <HAL_RCC_OscConfig+0x7c2>
 8008ef4:	2303      	movs	r3, #3
 8008ef6:	f000 bc55 	b.w	80097a4 <HAL_RCC_OscConfig+0x106c>
 8008efa:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008efe:	f5a3 7390 	sub.w	r3, r3, #288	; 0x120
 8008f02:	2202      	movs	r2, #2
 8008f04:	601a      	str	r2, [r3, #0]
 8008f06:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f0a:	f5a3 7390 	sub.w	r3, r3, #288	; 0x120
 8008f0e:	681b      	ldr	r3, [r3, #0]
 8008f10:	fa93 f2a3 	rbit	r2, r3
 8008f14:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f18:	f5a3 7392 	sub.w	r3, r3, #292	; 0x124
 8008f1c:	601a      	str	r2, [r3, #0]
 8008f1e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f22:	f5a3 7394 	sub.w	r3, r3, #296	; 0x128
 8008f26:	2202      	movs	r2, #2
 8008f28:	601a      	str	r2, [r3, #0]
 8008f2a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f2e:	f5a3 7394 	sub.w	r3, r3, #296	; 0x128
 8008f32:	681b      	ldr	r3, [r3, #0]
 8008f34:	fa93 f2a3 	rbit	r2, r3
 8008f38:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f3c:	f5a3 7396 	sub.w	r3, r3, #300	; 0x12c
 8008f40:	601a      	str	r2, [r3, #0]
 8008f42:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f46:	f5a3 7398 	sub.w	r3, r3, #304	; 0x130
 8008f4a:	2202      	movs	r2, #2
 8008f4c:	601a      	str	r2, [r3, #0]
 8008f4e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f52:	f5a3 7398 	sub.w	r3, r3, #304	; 0x130
 8008f56:	681b      	ldr	r3, [r3, #0]
 8008f58:	fa93 f2a3 	rbit	r2, r3
 8008f5c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f60:	f5a3 739a 	sub.w	r3, r3, #308	; 0x134
 8008f64:	601a      	str	r2, [r3, #0]
 8008f66:	4b41      	ldr	r3, [pc, #260]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008f68:	6a5a      	ldr	r2, [r3, #36]	; 0x24
 8008f6a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f6e:	f5a3 739c 	sub.w	r3, r3, #312	; 0x138
 8008f72:	2102      	movs	r1, #2
 8008f74:	6019      	str	r1, [r3, #0]
 8008f76:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f7a:	f5a3 739c 	sub.w	r3, r3, #312	; 0x138
 8008f7e:	681b      	ldr	r3, [r3, #0]
 8008f80:	fa93 f1a3 	rbit	r1, r3
 8008f84:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f88:	f5a3 739e 	sub.w	r3, r3, #316	; 0x13c
 8008f8c:	6019      	str	r1, [r3, #0]
 8008f8e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008f92:	f5a3 739e 	sub.w	r3, r3, #316	; 0x13c
 8008f96:	681b      	ldr	r3, [r3, #0]
 8008f98:	fab3 f383 	clz	r3, r3
 8008f9c:	b2db      	uxtb	r3, r3
 8008f9e:	f043 0360 	orr.w	r3, r3, #96	; 0x60
 8008fa2:	b2db      	uxtb	r3, r3
 8008fa4:	f003 031f 	and.w	r3, r3, #31
 8008fa8:	2101      	movs	r1, #1
 8008faa:	fa01 f303 	lsl.w	r3, r1, r3
 8008fae:	4013      	ands	r3, r2
 8008fb0:	2b00      	cmp	r3, #0
 8008fb2:	d197      	bne.n	8008ee4 <HAL_RCC_OscConfig+0x7ac>
 8008fb4:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008fb8:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8008fbc:	681b      	ldr	r3, [r3, #0]
 8008fbe:	681b      	ldr	r3, [r3, #0]
 8008fc0:	f003 0304 	and.w	r3, r3, #4
 8008fc4:	2b00      	cmp	r3, #0
 8008fc6:	f000 81a1 	beq.w	800930c <HAL_RCC_OscConfig+0xbd4>
 8008fca:	2300      	movs	r3, #0
 8008fcc:	f887 31ff 	strb.w	r3, [r7, #511]	; 0x1ff
 8008fd0:	4b26      	ldr	r3, [pc, #152]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008fd2:	69db      	ldr	r3, [r3, #28]
 8008fd4:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8008fd8:	2b00      	cmp	r3, #0
 8008fda:	d116      	bne.n	800900a <HAL_RCC_OscConfig+0x8d2>
 8008fdc:	4b23      	ldr	r3, [pc, #140]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008fde:	69db      	ldr	r3, [r3, #28]
 8008fe0:	4a22      	ldr	r2, [pc, #136]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008fe2:	f043 5380 	orr.w	r3, r3, #268435456	; 0x10000000
 8008fe6:	61d3      	str	r3, [r2, #28]
 8008fe8:	4b20      	ldr	r3, [pc, #128]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8008fea:	69db      	ldr	r3, [r3, #28]
 8008fec:	f003 5280 	and.w	r2, r3, #268435456	; 0x10000000
 8008ff0:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008ff4:	f5a3 73fc 	sub.w	r3, r3, #504	; 0x1f8
 8008ff8:	601a      	str	r2, [r3, #0]
 8008ffa:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8008ffe:	f5a3 73fc 	sub.w	r3, r3, #504	; 0x1f8
 8009002:	681b      	ldr	r3, [r3, #0]
 8009004:	2301      	movs	r3, #1
 8009006:	f887 31ff 	strb.w	r3, [r7, #511]	; 0x1ff
 800900a:	4b1a      	ldr	r3, [pc, #104]	; (8009074 <HAL_RCC_OscConfig+0x93c>)
 800900c:	681b      	ldr	r3, [r3, #0]
 800900e:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8009012:	2b00      	cmp	r3, #0
 8009014:	d11a      	bne.n	800904c <HAL_RCC_OscConfig+0x914>
 8009016:	4b17      	ldr	r3, [pc, #92]	; (8009074 <HAL_RCC_OscConfig+0x93c>)
 8009018:	681b      	ldr	r3, [r3, #0]
 800901a:	4a16      	ldr	r2, [pc, #88]	; (8009074 <HAL_RCC_OscConfig+0x93c>)
 800901c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 8009020:	6013      	str	r3, [r2, #0]
 8009022:	f7ff fa97 	bl	8008554 <HAL_GetTick>
 8009026:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 800902a:	e009      	b.n	8009040 <HAL_RCC_OscConfig+0x908>
 800902c:	f7ff fa92 	bl	8008554 <HAL_GetTick>
 8009030:	4602      	mov	r2, r0
 8009032:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8009036:	1ad3      	subs	r3, r2, r3
 8009038:	2b64      	cmp	r3, #100	; 0x64
 800903a:	d901      	bls.n	8009040 <HAL_RCC_OscConfig+0x908>
 800903c:	2303      	movs	r3, #3
 800903e:	e3b1      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 8009040:	4b0c      	ldr	r3, [pc, #48]	; (8009074 <HAL_RCC_OscConfig+0x93c>)
 8009042:	681b      	ldr	r3, [r3, #0]
 8009044:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8009048:	2b00      	cmp	r3, #0
 800904a:	d0ef      	beq.n	800902c <HAL_RCC_OscConfig+0x8f4>
 800904c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009050:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8009054:	681b      	ldr	r3, [r3, #0]
 8009056:	68db      	ldr	r3, [r3, #12]
 8009058:	2b01      	cmp	r3, #1
 800905a:	d10d      	bne.n	8009078 <HAL_RCC_OscConfig+0x940>
 800905c:	4b03      	ldr	r3, [pc, #12]	; (800906c <HAL_RCC_OscConfig+0x934>)
 800905e:	6a1b      	ldr	r3, [r3, #32]
 8009060:	4a02      	ldr	r2, [pc, #8]	; (800906c <HAL_RCC_OscConfig+0x934>)
 8009062:	f043 0301 	orr.w	r3, r3, #1
 8009066:	6213      	str	r3, [r2, #32]
 8009068:	e03c      	b.n	80090e4 <HAL_RCC_OscConfig+0x9ac>
 800906a:	bf00      	nop
 800906c:	40021000 	.word	0x40021000
 8009070:	10908120 	.word	0x10908120
 8009074:	40007000 	.word	0x40007000
 8009078:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800907c:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8009080:	681b      	ldr	r3, [r3, #0]
 8009082:	68db      	ldr	r3, [r3, #12]
 8009084:	2b00      	cmp	r3, #0
 8009086:	d10c      	bne.n	80090a2 <HAL_RCC_OscConfig+0x96a>
 8009088:	4bc1      	ldr	r3, [pc, #772]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 800908a:	6a1b      	ldr	r3, [r3, #32]
 800908c:	4ac0      	ldr	r2, [pc, #768]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 800908e:	f023 0301 	bic.w	r3, r3, #1
 8009092:	6213      	str	r3, [r2, #32]
 8009094:	4bbe      	ldr	r3, [pc, #760]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 8009096:	6a1b      	ldr	r3, [r3, #32]
 8009098:	4abd      	ldr	r2, [pc, #756]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 800909a:	f023 0304 	bic.w	r3, r3, #4
 800909e:	6213      	str	r3, [r2, #32]
 80090a0:	e020      	b.n	80090e4 <HAL_RCC_OscConfig+0x9ac>
 80090a2:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80090a6:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 80090aa:	681b      	ldr	r3, [r3, #0]
 80090ac:	68db      	ldr	r3, [r3, #12]
 80090ae:	2b05      	cmp	r3, #5
 80090b0:	d10c      	bne.n	80090cc <HAL_RCC_OscConfig+0x994>
 80090b2:	4bb7      	ldr	r3, [pc, #732]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090b4:	6a1b      	ldr	r3, [r3, #32]
 80090b6:	4ab6      	ldr	r2, [pc, #728]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090b8:	f043 0304 	orr.w	r3, r3, #4
 80090bc:	6213      	str	r3, [r2, #32]
 80090be:	4bb4      	ldr	r3, [pc, #720]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090c0:	6a1b      	ldr	r3, [r3, #32]
 80090c2:	4ab3      	ldr	r2, [pc, #716]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090c4:	f043 0301 	orr.w	r3, r3, #1
 80090c8:	6213      	str	r3, [r2, #32]
 80090ca:	e00b      	b.n	80090e4 <HAL_RCC_OscConfig+0x9ac>
 80090cc:	4bb0      	ldr	r3, [pc, #704]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090ce:	6a1b      	ldr	r3, [r3, #32]
 80090d0:	4aaf      	ldr	r2, [pc, #700]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090d2:	f023 0301 	bic.w	r3, r3, #1
 80090d6:	6213      	str	r3, [r2, #32]
 80090d8:	4bad      	ldr	r3, [pc, #692]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090da:	6a1b      	ldr	r3, [r3, #32]
 80090dc:	4aac      	ldr	r2, [pc, #688]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80090de:	f023 0304 	bic.w	r3, r3, #4
 80090e2:	6213      	str	r3, [r2, #32]
 80090e4:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80090e8:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 80090ec:	681b      	ldr	r3, [r3, #0]
 80090ee:	68db      	ldr	r3, [r3, #12]
 80090f0:	2b00      	cmp	r3, #0
 80090f2:	f000 8081 	beq.w	80091f8 <HAL_RCC_OscConfig+0xac0>
 80090f6:	f7ff fa2d 	bl	8008554 <HAL_GetTick>
 80090fa:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 80090fe:	e00b      	b.n	8009118 <HAL_RCC_OscConfig+0x9e0>
 8009100:	f7ff fa28 	bl	8008554 <HAL_GetTick>
 8009104:	4602      	mov	r2, r0
 8009106:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 800910a:	1ad3      	subs	r3, r2, r3
 800910c:	f241 3288 	movw	r2, #5000	; 0x1388
 8009110:	4293      	cmp	r3, r2
 8009112:	d901      	bls.n	8009118 <HAL_RCC_OscConfig+0x9e0>
 8009114:	2303      	movs	r3, #3
 8009116:	e345      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 8009118:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800911c:	f5a3 73a0 	sub.w	r3, r3, #320	; 0x140
 8009120:	2202      	movs	r2, #2
 8009122:	601a      	str	r2, [r3, #0]
 8009124:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009128:	f5a3 73a0 	sub.w	r3, r3, #320	; 0x140
 800912c:	681b      	ldr	r3, [r3, #0]
 800912e:	fa93 f2a3 	rbit	r2, r3
 8009132:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009136:	f5a3 73a2 	sub.w	r3, r3, #324	; 0x144
 800913a:	601a      	str	r2, [r3, #0]
 800913c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009140:	f5a3 73a4 	sub.w	r3, r3, #328	; 0x148
 8009144:	2202      	movs	r2, #2
 8009146:	601a      	str	r2, [r3, #0]
 8009148:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800914c:	f5a3 73a4 	sub.w	r3, r3, #328	; 0x148
 8009150:	681b      	ldr	r3, [r3, #0]
 8009152:	fa93 f2a3 	rbit	r2, r3
 8009156:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800915a:	f5a3 73a6 	sub.w	r3, r3, #332	; 0x14c
 800915e:	601a      	str	r2, [r3, #0]
 8009160:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009164:	f5a3 73a6 	sub.w	r3, r3, #332	; 0x14c
 8009168:	681b      	ldr	r3, [r3, #0]
 800916a:	fab3 f383 	clz	r3, r3
 800916e:	b2db      	uxtb	r3, r3
 8009170:	095b      	lsrs	r3, r3, #5
 8009172:	b2db      	uxtb	r3, r3
 8009174:	f043 0302 	orr.w	r3, r3, #2
 8009178:	b2db      	uxtb	r3, r3
 800917a:	2b02      	cmp	r3, #2
 800917c:	d102      	bne.n	8009184 <HAL_RCC_OscConfig+0xa4c>
 800917e:	4b84      	ldr	r3, [pc, #528]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 8009180:	6a1b      	ldr	r3, [r3, #32]
 8009182:	e013      	b.n	80091ac <HAL_RCC_OscConfig+0xa74>
 8009184:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009188:	f5a3 73a8 	sub.w	r3, r3, #336	; 0x150
 800918c:	2202      	movs	r2, #2
 800918e:	601a      	str	r2, [r3, #0]
 8009190:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009194:	f5a3 73a8 	sub.w	r3, r3, #336	; 0x150
 8009198:	681b      	ldr	r3, [r3, #0]
 800919a:	fa93 f2a3 	rbit	r2, r3
 800919e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80091a2:	f5a3 73aa 	sub.w	r3, r3, #340	; 0x154
 80091a6:	601a      	str	r2, [r3, #0]
 80091a8:	4b79      	ldr	r3, [pc, #484]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80091aa:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80091ac:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80091b0:	f5a2 72ac 	sub.w	r2, r2, #344	; 0x158
 80091b4:	2102      	movs	r1, #2
 80091b6:	6011      	str	r1, [r2, #0]
 80091b8:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80091bc:	f5a2 72ac 	sub.w	r2, r2, #344	; 0x158
 80091c0:	6812      	ldr	r2, [r2, #0]
 80091c2:	fa92 f1a2 	rbit	r1, r2
 80091c6:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80091ca:	f5a2 72ae 	sub.w	r2, r2, #348	; 0x15c
 80091ce:	6011      	str	r1, [r2, #0]
 80091d0:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80091d4:	f5a2 72ae 	sub.w	r2, r2, #348	; 0x15c
 80091d8:	6812      	ldr	r2, [r2, #0]
 80091da:	fab2 f282 	clz	r2, r2
 80091de:	b2d2      	uxtb	r2, r2
 80091e0:	f042 0240 	orr.w	r2, r2, #64	; 0x40
 80091e4:	b2d2      	uxtb	r2, r2
 80091e6:	f002 021f 	and.w	r2, r2, #31
 80091ea:	2101      	movs	r1, #1
 80091ec:	fa01 f202 	lsl.w	r2, r1, r2
 80091f0:	4013      	ands	r3, r2
 80091f2:	2b00      	cmp	r3, #0
 80091f4:	d084      	beq.n	8009100 <HAL_RCC_OscConfig+0x9c8>
 80091f6:	e07f      	b.n	80092f8 <HAL_RCC_OscConfig+0xbc0>
 80091f8:	f7ff f9ac 	bl	8008554 <HAL_GetTick>
 80091fc:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8009200:	e00b      	b.n	800921a <HAL_RCC_OscConfig+0xae2>
 8009202:	f7ff f9a7 	bl	8008554 <HAL_GetTick>
 8009206:	4602      	mov	r2, r0
 8009208:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 800920c:	1ad3      	subs	r3, r2, r3
 800920e:	f241 3288 	movw	r2, #5000	; 0x1388
 8009212:	4293      	cmp	r3, r2
 8009214:	d901      	bls.n	800921a <HAL_RCC_OscConfig+0xae2>
 8009216:	2303      	movs	r3, #3
 8009218:	e2c4      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 800921a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800921e:	f5a3 73b0 	sub.w	r3, r3, #352	; 0x160
 8009222:	2202      	movs	r2, #2
 8009224:	601a      	str	r2, [r3, #0]
 8009226:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800922a:	f5a3 73b0 	sub.w	r3, r3, #352	; 0x160
 800922e:	681b      	ldr	r3, [r3, #0]
 8009230:	fa93 f2a3 	rbit	r2, r3
 8009234:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009238:	f5a3 73b2 	sub.w	r3, r3, #356	; 0x164
 800923c:	601a      	str	r2, [r3, #0]
 800923e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009242:	f5a3 73b4 	sub.w	r3, r3, #360	; 0x168
 8009246:	2202      	movs	r2, #2
 8009248:	601a      	str	r2, [r3, #0]
 800924a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800924e:	f5a3 73b4 	sub.w	r3, r3, #360	; 0x168
 8009252:	681b      	ldr	r3, [r3, #0]
 8009254:	fa93 f2a3 	rbit	r2, r3
 8009258:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800925c:	f5a3 73b6 	sub.w	r3, r3, #364	; 0x16c
 8009260:	601a      	str	r2, [r3, #0]
 8009262:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009266:	f5a3 73b6 	sub.w	r3, r3, #364	; 0x16c
 800926a:	681b      	ldr	r3, [r3, #0]
 800926c:	fab3 f383 	clz	r3, r3
 8009270:	b2db      	uxtb	r3, r3
 8009272:	095b      	lsrs	r3, r3, #5
 8009274:	b2db      	uxtb	r3, r3
 8009276:	f043 0302 	orr.w	r3, r3, #2
 800927a:	b2db      	uxtb	r3, r3
 800927c:	2b02      	cmp	r3, #2
 800927e:	d102      	bne.n	8009286 <HAL_RCC_OscConfig+0xb4e>
 8009280:	4b43      	ldr	r3, [pc, #268]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 8009282:	6a1b      	ldr	r3, [r3, #32]
 8009284:	e013      	b.n	80092ae <HAL_RCC_OscConfig+0xb76>
 8009286:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800928a:	f5a3 73b8 	sub.w	r3, r3, #368	; 0x170
 800928e:	2202      	movs	r2, #2
 8009290:	601a      	str	r2, [r3, #0]
 8009292:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009296:	f5a3 73b8 	sub.w	r3, r3, #368	; 0x170
 800929a:	681b      	ldr	r3, [r3, #0]
 800929c:	fa93 f2a3 	rbit	r2, r3
 80092a0:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80092a4:	f5a3 73ba 	sub.w	r3, r3, #372	; 0x174
 80092a8:	601a      	str	r2, [r3, #0]
 80092aa:	4b39      	ldr	r3, [pc, #228]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 80092ac:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80092ae:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80092b2:	f5a2 72bc 	sub.w	r2, r2, #376	; 0x178
 80092b6:	2102      	movs	r1, #2
 80092b8:	6011      	str	r1, [r2, #0]
 80092ba:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80092be:	f5a2 72bc 	sub.w	r2, r2, #376	; 0x178
 80092c2:	6812      	ldr	r2, [r2, #0]
 80092c4:	fa92 f1a2 	rbit	r1, r2
 80092c8:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80092cc:	f5a2 72be 	sub.w	r2, r2, #380	; 0x17c
 80092d0:	6011      	str	r1, [r2, #0]
 80092d2:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80092d6:	f5a2 72be 	sub.w	r2, r2, #380	; 0x17c
 80092da:	6812      	ldr	r2, [r2, #0]
 80092dc:	fab2 f282 	clz	r2, r2
 80092e0:	b2d2      	uxtb	r2, r2
 80092e2:	f042 0240 	orr.w	r2, r2, #64	; 0x40
 80092e6:	b2d2      	uxtb	r2, r2
 80092e8:	f002 021f 	and.w	r2, r2, #31
 80092ec:	2101      	movs	r1, #1
 80092ee:	fa01 f202 	lsl.w	r2, r1, r2
 80092f2:	4013      	ands	r3, r2
 80092f4:	2b00      	cmp	r3, #0
 80092f6:	d184      	bne.n	8009202 <HAL_RCC_OscConfig+0xaca>
 80092f8:	f897 31ff 	ldrb.w	r3, [r7, #511]	; 0x1ff
 80092fc:	2b01      	cmp	r3, #1
 80092fe:	d105      	bne.n	800930c <HAL_RCC_OscConfig+0xbd4>
 8009300:	4b23      	ldr	r3, [pc, #140]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 8009302:	69db      	ldr	r3, [r3, #28]
 8009304:	4a22      	ldr	r2, [pc, #136]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 8009306:	f023 5380 	bic.w	r3, r3, #268435456	; 0x10000000
 800930a:	61d3      	str	r3, [r2, #28]
 800930c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009310:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8009314:	681b      	ldr	r3, [r3, #0]
 8009316:	69db      	ldr	r3, [r3, #28]
 8009318:	2b00      	cmp	r3, #0
 800931a:	f000 8242 	beq.w	80097a2 <HAL_RCC_OscConfig+0x106a>
 800931e:	4b1c      	ldr	r3, [pc, #112]	; (8009390 <HAL_RCC_OscConfig+0xc58>)
 8009320:	685b      	ldr	r3, [r3, #4]
 8009322:	f003 030c 	and.w	r3, r3, #12
 8009326:	2b08      	cmp	r3, #8
 8009328:	f000 8213 	beq.w	8009752 <HAL_RCC_OscConfig+0x101a>
 800932c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009330:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8009334:	681b      	ldr	r3, [r3, #0]
 8009336:	69db      	ldr	r3, [r3, #28]
 8009338:	2b02      	cmp	r3, #2
 800933a:	f040 8162 	bne.w	8009602 <HAL_RCC_OscConfig+0xeca>
 800933e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009342:	f5a3 73c0 	sub.w	r3, r3, #384	; 0x180
 8009346:	f04f 7280 	mov.w	r2, #16777216	; 0x1000000
 800934a:	601a      	str	r2, [r3, #0]
 800934c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009350:	f5a3 73c0 	sub.w	r3, r3, #384	; 0x180
 8009354:	681b      	ldr	r3, [r3, #0]
 8009356:	fa93 f2a3 	rbit	r2, r3
 800935a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800935e:	f5a3 73c2 	sub.w	r3, r3, #388	; 0x184
 8009362:	601a      	str	r2, [r3, #0]
 8009364:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009368:	f5a3 73c2 	sub.w	r3, r3, #388	; 0x184
 800936c:	681b      	ldr	r3, [r3, #0]
 800936e:	fab3 f383 	clz	r3, r3
 8009372:	b2db      	uxtb	r3, r3
 8009374:	f103 5384 	add.w	r3, r3, #276824064	; 0x10800000
 8009378:	f503 1384 	add.w	r3, r3, #1081344	; 0x108000
 800937c:	009b      	lsls	r3, r3, #2
 800937e:	461a      	mov	r2, r3
 8009380:	2300      	movs	r3, #0
 8009382:	6013      	str	r3, [r2, #0]
 8009384:	f7ff f8e6 	bl	8008554 <HAL_GetTick>
 8009388:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 800938c:	e00c      	b.n	80093a8 <HAL_RCC_OscConfig+0xc70>
 800938e:	bf00      	nop
 8009390:	40021000 	.word	0x40021000
 8009394:	f7ff f8de 	bl	8008554 <HAL_GetTick>
 8009398:	4602      	mov	r2, r0
 800939a:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 800939e:	1ad3      	subs	r3, r2, r3
 80093a0:	2b02      	cmp	r3, #2
 80093a2:	d901      	bls.n	80093a8 <HAL_RCC_OscConfig+0xc70>
 80093a4:	2303      	movs	r3, #3
 80093a6:	e1fd      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 80093a8:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80093ac:	f5a3 73c4 	sub.w	r3, r3, #392	; 0x188
 80093b0:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 80093b4:	601a      	str	r2, [r3, #0]
 80093b6:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80093ba:	f5a3 73c4 	sub.w	r3, r3, #392	; 0x188
 80093be:	681b      	ldr	r3, [r3, #0]
 80093c0:	fa93 f2a3 	rbit	r2, r3
 80093c4:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80093c8:	f5a3 73c6 	sub.w	r3, r3, #396	; 0x18c
 80093cc:	601a      	str	r2, [r3, #0]
 80093ce:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80093d2:	f5a3 73c6 	sub.w	r3, r3, #396	; 0x18c
 80093d6:	681b      	ldr	r3, [r3, #0]
 80093d8:	fab3 f383 	clz	r3, r3
 80093dc:	b2db      	uxtb	r3, r3
 80093de:	095b      	lsrs	r3, r3, #5
 80093e0:	b2db      	uxtb	r3, r3
 80093e2:	f043 0301 	orr.w	r3, r3, #1
 80093e6:	b2db      	uxtb	r3, r3
 80093e8:	2b01      	cmp	r3, #1
 80093ea:	d102      	bne.n	80093f2 <HAL_RCC_OscConfig+0xcba>
 80093ec:	4bb0      	ldr	r3, [pc, #704]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 80093ee:	681b      	ldr	r3, [r3, #0]
 80093f0:	e027      	b.n	8009442 <HAL_RCC_OscConfig+0xd0a>
 80093f2:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80093f6:	f5a3 73c8 	sub.w	r3, r3, #400	; 0x190
 80093fa:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 80093fe:	601a      	str	r2, [r3, #0]
 8009400:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009404:	f5a3 73c8 	sub.w	r3, r3, #400	; 0x190
 8009408:	681b      	ldr	r3, [r3, #0]
 800940a:	fa93 f2a3 	rbit	r2, r3
 800940e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009412:	f5a3 73ca 	sub.w	r3, r3, #404	; 0x194
 8009416:	601a      	str	r2, [r3, #0]
 8009418:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800941c:	f5a3 73cc 	sub.w	r3, r3, #408	; 0x198
 8009420:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 8009424:	601a      	str	r2, [r3, #0]
 8009426:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800942a:	f5a3 73cc 	sub.w	r3, r3, #408	; 0x198
 800942e:	681b      	ldr	r3, [r3, #0]
 8009430:	fa93 f2a3 	rbit	r2, r3
 8009434:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009438:	f5a3 73ce 	sub.w	r3, r3, #412	; 0x19c
 800943c:	601a      	str	r2, [r3, #0]
 800943e:	4b9c      	ldr	r3, [pc, #624]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 8009440:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8009442:	f507 7200 	add.w	r2, r7, #512	; 0x200
 8009446:	f5a2 72d0 	sub.w	r2, r2, #416	; 0x1a0
 800944a:	f04f 7100 	mov.w	r1, #33554432	; 0x2000000
 800944e:	6011      	str	r1, [r2, #0]
 8009450:	f507 7200 	add.w	r2, r7, #512	; 0x200
 8009454:	f5a2 72d0 	sub.w	r2, r2, #416	; 0x1a0
 8009458:	6812      	ldr	r2, [r2, #0]
 800945a:	fa92 f1a2 	rbit	r1, r2
 800945e:	f507 7200 	add.w	r2, r7, #512	; 0x200
 8009462:	f5a2 72d2 	sub.w	r2, r2, #420	; 0x1a4
 8009466:	6011      	str	r1, [r2, #0]
 8009468:	f507 7200 	add.w	r2, r7, #512	; 0x200
 800946c:	f5a2 72d2 	sub.w	r2, r2, #420	; 0x1a4
 8009470:	6812      	ldr	r2, [r2, #0]
 8009472:	fab2 f282 	clz	r2, r2
 8009476:	b2d2      	uxtb	r2, r2
 8009478:	f042 0220 	orr.w	r2, r2, #32
 800947c:	b2d2      	uxtb	r2, r2
 800947e:	f002 021f 	and.w	r2, r2, #31
 8009482:	2101      	movs	r1, #1
 8009484:	fa01 f202 	lsl.w	r2, r1, r2
 8009488:	4013      	ands	r3, r2
 800948a:	2b00      	cmp	r3, #0
 800948c:	d182      	bne.n	8009394 <HAL_RCC_OscConfig+0xc5c>
 800948e:	4b88      	ldr	r3, [pc, #544]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 8009490:	685b      	ldr	r3, [r3, #4]
 8009492:	f423 1274 	bic.w	r2, r3, #3997696	; 0x3d0000
 8009496:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800949a:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 800949e:	681b      	ldr	r3, [r3, #0]
 80094a0:	6a59      	ldr	r1, [r3, #36]	; 0x24
 80094a2:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80094a6:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 80094aa:	681b      	ldr	r3, [r3, #0]
 80094ac:	6a1b      	ldr	r3, [r3, #32]
 80094ae:	430b      	orrs	r3, r1
 80094b0:	497f      	ldr	r1, [pc, #508]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 80094b2:	4313      	orrs	r3, r2
 80094b4:	604b      	str	r3, [r1, #4]
 80094b6:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80094ba:	f5a3 73d4 	sub.w	r3, r3, #424	; 0x1a8
 80094be:	f04f 7280 	mov.w	r2, #16777216	; 0x1000000
 80094c2:	601a      	str	r2, [r3, #0]
 80094c4:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80094c8:	f5a3 73d4 	sub.w	r3, r3, #424	; 0x1a8
 80094cc:	681b      	ldr	r3, [r3, #0]
 80094ce:	fa93 f2a3 	rbit	r2, r3
 80094d2:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80094d6:	f5a3 73d6 	sub.w	r3, r3, #428	; 0x1ac
 80094da:	601a      	str	r2, [r3, #0]
 80094dc:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80094e0:	f5a3 73d6 	sub.w	r3, r3, #428	; 0x1ac
 80094e4:	681b      	ldr	r3, [r3, #0]
 80094e6:	fab3 f383 	clz	r3, r3
 80094ea:	b2db      	uxtb	r3, r3
 80094ec:	f103 5384 	add.w	r3, r3, #276824064	; 0x10800000
 80094f0:	f503 1384 	add.w	r3, r3, #1081344	; 0x108000
 80094f4:	009b      	lsls	r3, r3, #2
 80094f6:	461a      	mov	r2, r3
 80094f8:	2301      	movs	r3, #1
 80094fa:	6013      	str	r3, [r2, #0]
 80094fc:	f7ff f82a 	bl	8008554 <HAL_GetTick>
 8009500:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8009504:	e009      	b.n	800951a <HAL_RCC_OscConfig+0xde2>
 8009506:	f7ff f825 	bl	8008554 <HAL_GetTick>
 800950a:	4602      	mov	r2, r0
 800950c:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 8009510:	1ad3      	subs	r3, r2, r3
 8009512:	2b02      	cmp	r3, #2
 8009514:	d901      	bls.n	800951a <HAL_RCC_OscConfig+0xde2>
 8009516:	2303      	movs	r3, #3
 8009518:	e144      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 800951a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800951e:	f5a3 73d8 	sub.w	r3, r3, #432	; 0x1b0
 8009522:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 8009526:	601a      	str	r2, [r3, #0]
 8009528:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800952c:	f5a3 73d8 	sub.w	r3, r3, #432	; 0x1b0
 8009530:	681b      	ldr	r3, [r3, #0]
 8009532:	fa93 f2a3 	rbit	r2, r3
 8009536:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800953a:	f5a3 73da 	sub.w	r3, r3, #436	; 0x1b4
 800953e:	601a      	str	r2, [r3, #0]
 8009540:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009544:	f5a3 73da 	sub.w	r3, r3, #436	; 0x1b4
 8009548:	681b      	ldr	r3, [r3, #0]
 800954a:	fab3 f383 	clz	r3, r3
 800954e:	b2db      	uxtb	r3, r3
 8009550:	095b      	lsrs	r3, r3, #5
 8009552:	b2db      	uxtb	r3, r3
 8009554:	f043 0301 	orr.w	r3, r3, #1
 8009558:	b2db      	uxtb	r3, r3
 800955a:	2b01      	cmp	r3, #1
 800955c:	d102      	bne.n	8009564 <HAL_RCC_OscConfig+0xe2c>
 800955e:	4b54      	ldr	r3, [pc, #336]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 8009560:	681b      	ldr	r3, [r3, #0]
 8009562:	e027      	b.n	80095b4 <HAL_RCC_OscConfig+0xe7c>
 8009564:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009568:	f5a3 73dc 	sub.w	r3, r3, #440	; 0x1b8
 800956c:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 8009570:	601a      	str	r2, [r3, #0]
 8009572:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009576:	f5a3 73dc 	sub.w	r3, r3, #440	; 0x1b8
 800957a:	681b      	ldr	r3, [r3, #0]
 800957c:	fa93 f2a3 	rbit	r2, r3
 8009580:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009584:	f5a3 73de 	sub.w	r3, r3, #444	; 0x1bc
 8009588:	601a      	str	r2, [r3, #0]
 800958a:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800958e:	f5a3 73e0 	sub.w	r3, r3, #448	; 0x1c0
 8009592:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 8009596:	601a      	str	r2, [r3, #0]
 8009598:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800959c:	f5a3 73e0 	sub.w	r3, r3, #448	; 0x1c0
 80095a0:	681b      	ldr	r3, [r3, #0]
 80095a2:	fa93 f2a3 	rbit	r2, r3
 80095a6:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80095aa:	f5a3 73e2 	sub.w	r3, r3, #452	; 0x1c4
 80095ae:	601a      	str	r2, [r3, #0]
 80095b0:	4b3f      	ldr	r3, [pc, #252]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 80095b2:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80095b4:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80095b8:	f5a2 72e4 	sub.w	r2, r2, #456	; 0x1c8
 80095bc:	f04f 7100 	mov.w	r1, #33554432	; 0x2000000
 80095c0:	6011      	str	r1, [r2, #0]
 80095c2:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80095c6:	f5a2 72e4 	sub.w	r2, r2, #456	; 0x1c8
 80095ca:	6812      	ldr	r2, [r2, #0]
 80095cc:	fa92 f1a2 	rbit	r1, r2
 80095d0:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80095d4:	f5a2 72e6 	sub.w	r2, r2, #460	; 0x1cc
 80095d8:	6011      	str	r1, [r2, #0]
 80095da:	f507 7200 	add.w	r2, r7, #512	; 0x200
 80095de:	f5a2 72e6 	sub.w	r2, r2, #460	; 0x1cc
 80095e2:	6812      	ldr	r2, [r2, #0]
 80095e4:	fab2 f282 	clz	r2, r2
 80095e8:	b2d2      	uxtb	r2, r2
 80095ea:	f042 0220 	orr.w	r2, r2, #32
 80095ee:	b2d2      	uxtb	r2, r2
 80095f0:	f002 021f 	and.w	r2, r2, #31
 80095f4:	2101      	movs	r1, #1
 80095f6:	fa01 f202 	lsl.w	r2, r1, r2
 80095fa:	4013      	ands	r3, r2
 80095fc:	2b00      	cmp	r3, #0
 80095fe:	d082      	beq.n	8009506 <HAL_RCC_OscConfig+0xdce>
 8009600:	e0cf      	b.n	80097a2 <HAL_RCC_OscConfig+0x106a>
 8009602:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009606:	f5a3 73e8 	sub.w	r3, r3, #464	; 0x1d0
 800960a:	f04f 7280 	mov.w	r2, #16777216	; 0x1000000
 800960e:	601a      	str	r2, [r3, #0]
 8009610:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009614:	f5a3 73e8 	sub.w	r3, r3, #464	; 0x1d0
 8009618:	681b      	ldr	r3, [r3, #0]
 800961a:	fa93 f2a3 	rbit	r2, r3
 800961e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009622:	f5a3 73ea 	sub.w	r3, r3, #468	; 0x1d4
 8009626:	601a      	str	r2, [r3, #0]
 8009628:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800962c:	f5a3 73ea 	sub.w	r3, r3, #468	; 0x1d4
 8009630:	681b      	ldr	r3, [r3, #0]
 8009632:	fab3 f383 	clz	r3, r3
 8009636:	b2db      	uxtb	r3, r3
 8009638:	f103 5384 	add.w	r3, r3, #276824064	; 0x10800000
 800963c:	f503 1384 	add.w	r3, r3, #1081344	; 0x108000
 8009640:	009b      	lsls	r3, r3, #2
 8009642:	461a      	mov	r2, r3
 8009644:	2300      	movs	r3, #0
 8009646:	6013      	str	r3, [r2, #0]
 8009648:	f7fe ff84 	bl	8008554 <HAL_GetTick>
 800964c:	f8c7 01f8 	str.w	r0, [r7, #504]	; 0x1f8
 8009650:	e009      	b.n	8009666 <HAL_RCC_OscConfig+0xf2e>
 8009652:	f7fe ff7f 	bl	8008554 <HAL_GetTick>
 8009656:	4602      	mov	r2, r0
 8009658:	f8d7 31f8 	ldr.w	r3, [r7, #504]	; 0x1f8
 800965c:	1ad3      	subs	r3, r2, r3
 800965e:	2b02      	cmp	r3, #2
 8009660:	d901      	bls.n	8009666 <HAL_RCC_OscConfig+0xf2e>
 8009662:	2303      	movs	r3, #3
 8009664:	e09e      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 8009666:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800966a:	f5a3 73ec 	sub.w	r3, r3, #472	; 0x1d8
 800966e:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 8009672:	601a      	str	r2, [r3, #0]
 8009674:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009678:	f5a3 73ec 	sub.w	r3, r3, #472	; 0x1d8
 800967c:	681b      	ldr	r3, [r3, #0]
 800967e:	fa93 f2a3 	rbit	r2, r3
 8009682:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009686:	f5a3 73ee 	sub.w	r3, r3, #476	; 0x1dc
 800968a:	601a      	str	r2, [r3, #0]
 800968c:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009690:	f5a3 73ee 	sub.w	r3, r3, #476	; 0x1dc
 8009694:	681b      	ldr	r3, [r3, #0]
 8009696:	fab3 f383 	clz	r3, r3
 800969a:	b2db      	uxtb	r3, r3
 800969c:	095b      	lsrs	r3, r3, #5
 800969e:	b2db      	uxtb	r3, r3
 80096a0:	f043 0301 	orr.w	r3, r3, #1
 80096a4:	b2db      	uxtb	r3, r3
 80096a6:	2b01      	cmp	r3, #1
 80096a8:	d104      	bne.n	80096b4 <HAL_RCC_OscConfig+0xf7c>
 80096aa:	4b01      	ldr	r3, [pc, #4]	; (80096b0 <HAL_RCC_OscConfig+0xf78>)
 80096ac:	681b      	ldr	r3, [r3, #0]
 80096ae:	e029      	b.n	8009704 <HAL_RCC_OscConfig+0xfcc>
 80096b0:	40021000 	.word	0x40021000
 80096b4:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80096b8:	f5a3 73f0 	sub.w	r3, r3, #480	; 0x1e0
 80096bc:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 80096c0:	601a      	str	r2, [r3, #0]
 80096c2:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80096c6:	f5a3 73f0 	sub.w	r3, r3, #480	; 0x1e0
 80096ca:	681b      	ldr	r3, [r3, #0]
 80096cc:	fa93 f2a3 	rbit	r2, r3
 80096d0:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80096d4:	f5a3 73f2 	sub.w	r3, r3, #484	; 0x1e4
 80096d8:	601a      	str	r2, [r3, #0]
 80096da:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80096de:	f5a3 73f4 	sub.w	r3, r3, #488	; 0x1e8
 80096e2:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 80096e6:	601a      	str	r2, [r3, #0]
 80096e8:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80096ec:	f5a3 73f4 	sub.w	r3, r3, #488	; 0x1e8
 80096f0:	681b      	ldr	r3, [r3, #0]
 80096f2:	fa93 f2a3 	rbit	r2, r3
 80096f6:	f507 7300 	add.w	r3, r7, #512	; 0x200
 80096fa:	f5a3 73f6 	sub.w	r3, r3, #492	; 0x1ec
 80096fe:	601a      	str	r2, [r3, #0]
 8009700:	4b2b      	ldr	r3, [pc, #172]	; (80097b0 <HAL_RCC_OscConfig+0x1078>)
 8009702:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8009704:	f507 7200 	add.w	r2, r7, #512	; 0x200
 8009708:	f5a2 72f8 	sub.w	r2, r2, #496	; 0x1f0
 800970c:	f04f 7100 	mov.w	r1, #33554432	; 0x2000000
 8009710:	6011      	str	r1, [r2, #0]
 8009712:	f507 7200 	add.w	r2, r7, #512	; 0x200
 8009716:	f5a2 72f8 	sub.w	r2, r2, #496	; 0x1f0
 800971a:	6812      	ldr	r2, [r2, #0]
 800971c:	fa92 f1a2 	rbit	r1, r2
 8009720:	f507 7200 	add.w	r2, r7, #512	; 0x200
 8009724:	f5a2 72fa 	sub.w	r2, r2, #500	; 0x1f4
 8009728:	6011      	str	r1, [r2, #0]
 800972a:	f507 7200 	add.w	r2, r7, #512	; 0x200
 800972e:	f5a2 72fa 	sub.w	r2, r2, #500	; 0x1f4
 8009732:	6812      	ldr	r2, [r2, #0]
 8009734:	fab2 f282 	clz	r2, r2
 8009738:	b2d2      	uxtb	r2, r2
 800973a:	f042 0220 	orr.w	r2, r2, #32
 800973e:	b2d2      	uxtb	r2, r2
 8009740:	f002 021f 	and.w	r2, r2, #31
 8009744:	2101      	movs	r1, #1
 8009746:	fa01 f202 	lsl.w	r2, r1, r2
 800974a:	4013      	ands	r3, r2
 800974c:	2b00      	cmp	r3, #0
 800974e:	d180      	bne.n	8009652 <HAL_RCC_OscConfig+0xf1a>
 8009750:	e027      	b.n	80097a2 <HAL_RCC_OscConfig+0x106a>
 8009752:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009756:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 800975a:	681b      	ldr	r3, [r3, #0]
 800975c:	69db      	ldr	r3, [r3, #28]
 800975e:	2b01      	cmp	r3, #1
 8009760:	d101      	bne.n	8009766 <HAL_RCC_OscConfig+0x102e>
 8009762:	2301      	movs	r3, #1
 8009764:	e01e      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 8009766:	4b12      	ldr	r3, [pc, #72]	; (80097b0 <HAL_RCC_OscConfig+0x1078>)
 8009768:	685b      	ldr	r3, [r3, #4]
 800976a:	f8c7 31f4 	str.w	r3, [r7, #500]	; 0x1f4
 800976e:	f8d7 31f4 	ldr.w	r3, [r7, #500]	; 0x1f4
 8009772:	f403 3280 	and.w	r2, r3, #65536	; 0x10000
 8009776:	f507 7300 	add.w	r3, r7, #512	; 0x200
 800977a:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 800977e:	681b      	ldr	r3, [r3, #0]
 8009780:	6a1b      	ldr	r3, [r3, #32]
 8009782:	429a      	cmp	r2, r3
 8009784:	d10b      	bne.n	800979e <HAL_RCC_OscConfig+0x1066>
 8009786:	f8d7 31f4 	ldr.w	r3, [r7, #500]	; 0x1f4
 800978a:	f403 1270 	and.w	r2, r3, #3932160	; 0x3c0000
 800978e:	f507 7300 	add.w	r3, r7, #512	; 0x200
 8009792:	f5a3 73fe 	sub.w	r3, r3, #508	; 0x1fc
 8009796:	681b      	ldr	r3, [r3, #0]
 8009798:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 800979a:	429a      	cmp	r2, r3
 800979c:	d001      	beq.n	80097a2 <HAL_RCC_OscConfig+0x106a>
 800979e:	2301      	movs	r3, #1
 80097a0:	e000      	b.n	80097a4 <HAL_RCC_OscConfig+0x106c>
 80097a2:	2300      	movs	r3, #0
 80097a4:	4618      	mov	r0, r3
 80097a6:	f507 7700 	add.w	r7, r7, #512	; 0x200
 80097aa:	46bd      	mov	sp, r7
 80097ac:	bd80      	pop	{r7, pc}
 80097ae:	bf00      	nop
 80097b0:	40021000 	.word	0x40021000

080097b4 <HAL_RCC_ClockConfig>:
 80097b4:	b580      	push	{r7, lr}
 80097b6:	b09e      	sub	sp, #120	; 0x78
 80097b8:	af00      	add	r7, sp, #0
 80097ba:	6078      	str	r0, [r7, #4]
 80097bc:	6039      	str	r1, [r7, #0]
 80097be:	2300      	movs	r3, #0
 80097c0:	677b      	str	r3, [r7, #116]	; 0x74
 80097c2:	687b      	ldr	r3, [r7, #4]
 80097c4:	2b00      	cmp	r3, #0
 80097c6:	d101      	bne.n	80097cc <HAL_RCC_ClockConfig+0x18>
 80097c8:	2301      	movs	r3, #1
 80097ca:	e162      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 80097cc:	4b90      	ldr	r3, [pc, #576]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80097ce:	681b      	ldr	r3, [r3, #0]
 80097d0:	f003 0307 	and.w	r3, r3, #7
 80097d4:	683a      	ldr	r2, [r7, #0]
 80097d6:	429a      	cmp	r2, r3
 80097d8:	d910      	bls.n	80097fc <HAL_RCC_ClockConfig+0x48>
 80097da:	4b8d      	ldr	r3, [pc, #564]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80097dc:	681b      	ldr	r3, [r3, #0]
 80097de:	f023 0207 	bic.w	r2, r3, #7
 80097e2:	498b      	ldr	r1, [pc, #556]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80097e4:	683b      	ldr	r3, [r7, #0]
 80097e6:	4313      	orrs	r3, r2
 80097e8:	600b      	str	r3, [r1, #0]
 80097ea:	4b89      	ldr	r3, [pc, #548]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80097ec:	681b      	ldr	r3, [r3, #0]
 80097ee:	f003 0307 	and.w	r3, r3, #7
 80097f2:	683a      	ldr	r2, [r7, #0]
 80097f4:	429a      	cmp	r2, r3
 80097f6:	d001      	beq.n	80097fc <HAL_RCC_ClockConfig+0x48>
 80097f8:	2301      	movs	r3, #1
 80097fa:	e14a      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 80097fc:	687b      	ldr	r3, [r7, #4]
 80097fe:	681b      	ldr	r3, [r3, #0]
 8009800:	f003 0302 	and.w	r3, r3, #2
 8009804:	2b00      	cmp	r3, #0
 8009806:	d008      	beq.n	800981a <HAL_RCC_ClockConfig+0x66>
 8009808:	4b82      	ldr	r3, [pc, #520]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 800980a:	685b      	ldr	r3, [r3, #4]
 800980c:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
 8009810:	687b      	ldr	r3, [r7, #4]
 8009812:	689b      	ldr	r3, [r3, #8]
 8009814:	497f      	ldr	r1, [pc, #508]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 8009816:	4313      	orrs	r3, r2
 8009818:	604b      	str	r3, [r1, #4]
 800981a:	687b      	ldr	r3, [r7, #4]
 800981c:	681b      	ldr	r3, [r3, #0]
 800981e:	f003 0301 	and.w	r3, r3, #1
 8009822:	2b00      	cmp	r3, #0
 8009824:	f000 80dc 	beq.w	80099e0 <HAL_RCC_ClockConfig+0x22c>
 8009828:	687b      	ldr	r3, [r7, #4]
 800982a:	685b      	ldr	r3, [r3, #4]
 800982c:	2b01      	cmp	r3, #1
 800982e:	d13c      	bne.n	80098aa <HAL_RCC_ClockConfig+0xf6>
 8009830:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 8009834:	673b      	str	r3, [r7, #112]	; 0x70
 8009836:	6f3b      	ldr	r3, [r7, #112]	; 0x70
 8009838:	fa93 f3a3 	rbit	r3, r3
 800983c:	66fb      	str	r3, [r7, #108]	; 0x6c
 800983e:	6efb      	ldr	r3, [r7, #108]	; 0x6c
 8009840:	fab3 f383 	clz	r3, r3
 8009844:	b2db      	uxtb	r3, r3
 8009846:	095b      	lsrs	r3, r3, #5
 8009848:	b2db      	uxtb	r3, r3
 800984a:	f043 0301 	orr.w	r3, r3, #1
 800984e:	b2db      	uxtb	r3, r3
 8009850:	2b01      	cmp	r3, #1
 8009852:	d102      	bne.n	800985a <HAL_RCC_ClockConfig+0xa6>
 8009854:	4b6f      	ldr	r3, [pc, #444]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 8009856:	681b      	ldr	r3, [r3, #0]
 8009858:	e00f      	b.n	800987a <HAL_RCC_ClockConfig+0xc6>
 800985a:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 800985e:	66bb      	str	r3, [r7, #104]	; 0x68
 8009860:	6ebb      	ldr	r3, [r7, #104]	; 0x68
 8009862:	fa93 f3a3 	rbit	r3, r3
 8009866:	667b      	str	r3, [r7, #100]	; 0x64
 8009868:	f44f 3300 	mov.w	r3, #131072	; 0x20000
 800986c:	663b      	str	r3, [r7, #96]	; 0x60
 800986e:	6e3b      	ldr	r3, [r7, #96]	; 0x60
 8009870:	fa93 f3a3 	rbit	r3, r3
 8009874:	65fb      	str	r3, [r7, #92]	; 0x5c
 8009876:	4b67      	ldr	r3, [pc, #412]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 8009878:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 800987a:	f44f 3200 	mov.w	r2, #131072	; 0x20000
 800987e:	65ba      	str	r2, [r7, #88]	; 0x58
 8009880:	6dba      	ldr	r2, [r7, #88]	; 0x58
 8009882:	fa92 f2a2 	rbit	r2, r2
 8009886:	657a      	str	r2, [r7, #84]	; 0x54
 8009888:	6d7a      	ldr	r2, [r7, #84]	; 0x54
 800988a:	fab2 f282 	clz	r2, r2
 800988e:	b2d2      	uxtb	r2, r2
 8009890:	f042 0220 	orr.w	r2, r2, #32
 8009894:	b2d2      	uxtb	r2, r2
 8009896:	f002 021f 	and.w	r2, r2, #31
 800989a:	2101      	movs	r1, #1
 800989c:	fa01 f202 	lsl.w	r2, r1, r2
 80098a0:	4013      	ands	r3, r2
 80098a2:	2b00      	cmp	r3, #0
 80098a4:	d17b      	bne.n	800999e <HAL_RCC_ClockConfig+0x1ea>
 80098a6:	2301      	movs	r3, #1
 80098a8:	e0f3      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 80098aa:	687b      	ldr	r3, [r7, #4]
 80098ac:	685b      	ldr	r3, [r3, #4]
 80098ae:	2b02      	cmp	r3, #2
 80098b0:	d13c      	bne.n	800992c <HAL_RCC_ClockConfig+0x178>
 80098b2:	f04f 7300 	mov.w	r3, #33554432	; 0x2000000
 80098b6:	653b      	str	r3, [r7, #80]	; 0x50
 80098b8:	6d3b      	ldr	r3, [r7, #80]	; 0x50
 80098ba:	fa93 f3a3 	rbit	r3, r3
 80098be:	64fb      	str	r3, [r7, #76]	; 0x4c
 80098c0:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 80098c2:	fab3 f383 	clz	r3, r3
 80098c6:	b2db      	uxtb	r3, r3
 80098c8:	095b      	lsrs	r3, r3, #5
 80098ca:	b2db      	uxtb	r3, r3
 80098cc:	f043 0301 	orr.w	r3, r3, #1
 80098d0:	b2db      	uxtb	r3, r3
 80098d2:	2b01      	cmp	r3, #1
 80098d4:	d102      	bne.n	80098dc <HAL_RCC_ClockConfig+0x128>
 80098d6:	4b4f      	ldr	r3, [pc, #316]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 80098d8:	681b      	ldr	r3, [r3, #0]
 80098da:	e00f      	b.n	80098fc <HAL_RCC_ClockConfig+0x148>
 80098dc:	f04f 7300 	mov.w	r3, #33554432	; 0x2000000
 80098e0:	64bb      	str	r3, [r7, #72]	; 0x48
 80098e2:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 80098e4:	fa93 f3a3 	rbit	r3, r3
 80098e8:	647b      	str	r3, [r7, #68]	; 0x44
 80098ea:	f04f 7300 	mov.w	r3, #33554432	; 0x2000000
 80098ee:	643b      	str	r3, [r7, #64]	; 0x40
 80098f0:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 80098f2:	fa93 f3a3 	rbit	r3, r3
 80098f6:	63fb      	str	r3, [r7, #60]	; 0x3c
 80098f8:	4b46      	ldr	r3, [pc, #280]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 80098fa:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80098fc:	f04f 7200 	mov.w	r2, #33554432	; 0x2000000
 8009900:	63ba      	str	r2, [r7, #56]	; 0x38
 8009902:	6bba      	ldr	r2, [r7, #56]	; 0x38
 8009904:	fa92 f2a2 	rbit	r2, r2
 8009908:	637a      	str	r2, [r7, #52]	; 0x34
 800990a:	6b7a      	ldr	r2, [r7, #52]	; 0x34
 800990c:	fab2 f282 	clz	r2, r2
 8009910:	b2d2      	uxtb	r2, r2
 8009912:	f042 0220 	orr.w	r2, r2, #32
 8009916:	b2d2      	uxtb	r2, r2
 8009918:	f002 021f 	and.w	r2, r2, #31
 800991c:	2101      	movs	r1, #1
 800991e:	fa01 f202 	lsl.w	r2, r1, r2
 8009922:	4013      	ands	r3, r2
 8009924:	2b00      	cmp	r3, #0
 8009926:	d13a      	bne.n	800999e <HAL_RCC_ClockConfig+0x1ea>
 8009928:	2301      	movs	r3, #1
 800992a:	e0b2      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 800992c:	2302      	movs	r3, #2
 800992e:	633b      	str	r3, [r7, #48]	; 0x30
 8009930:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8009932:	fa93 f3a3 	rbit	r3, r3
 8009936:	62fb      	str	r3, [r7, #44]	; 0x2c
 8009938:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800993a:	fab3 f383 	clz	r3, r3
 800993e:	b2db      	uxtb	r3, r3
 8009940:	095b      	lsrs	r3, r3, #5
 8009942:	b2db      	uxtb	r3, r3
 8009944:	f043 0301 	orr.w	r3, r3, #1
 8009948:	b2db      	uxtb	r3, r3
 800994a:	2b01      	cmp	r3, #1
 800994c:	d102      	bne.n	8009954 <HAL_RCC_ClockConfig+0x1a0>
 800994e:	4b31      	ldr	r3, [pc, #196]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 8009950:	681b      	ldr	r3, [r3, #0]
 8009952:	e00d      	b.n	8009970 <HAL_RCC_ClockConfig+0x1bc>
 8009954:	2302      	movs	r3, #2
 8009956:	62bb      	str	r3, [r7, #40]	; 0x28
 8009958:	6abb      	ldr	r3, [r7, #40]	; 0x28
 800995a:	fa93 f3a3 	rbit	r3, r3
 800995e:	627b      	str	r3, [r7, #36]	; 0x24
 8009960:	2302      	movs	r3, #2
 8009962:	623b      	str	r3, [r7, #32]
 8009964:	6a3b      	ldr	r3, [r7, #32]
 8009966:	fa93 f3a3 	rbit	r3, r3
 800996a:	61fb      	str	r3, [r7, #28]
 800996c:	4b29      	ldr	r3, [pc, #164]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 800996e:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8009970:	2202      	movs	r2, #2
 8009972:	61ba      	str	r2, [r7, #24]
 8009974:	69ba      	ldr	r2, [r7, #24]
 8009976:	fa92 f2a2 	rbit	r2, r2
 800997a:	617a      	str	r2, [r7, #20]
 800997c:	697a      	ldr	r2, [r7, #20]
 800997e:	fab2 f282 	clz	r2, r2
 8009982:	b2d2      	uxtb	r2, r2
 8009984:	f042 0220 	orr.w	r2, r2, #32
 8009988:	b2d2      	uxtb	r2, r2
 800998a:	f002 021f 	and.w	r2, r2, #31
 800998e:	2101      	movs	r1, #1
 8009990:	fa01 f202 	lsl.w	r2, r1, r2
 8009994:	4013      	ands	r3, r2
 8009996:	2b00      	cmp	r3, #0
 8009998:	d101      	bne.n	800999e <HAL_RCC_ClockConfig+0x1ea>
 800999a:	2301      	movs	r3, #1
 800999c:	e079      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 800999e:	4b1d      	ldr	r3, [pc, #116]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 80099a0:	685b      	ldr	r3, [r3, #4]
 80099a2:	f023 0203 	bic.w	r2, r3, #3
 80099a6:	687b      	ldr	r3, [r7, #4]
 80099a8:	685b      	ldr	r3, [r3, #4]
 80099aa:	491a      	ldr	r1, [pc, #104]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 80099ac:	4313      	orrs	r3, r2
 80099ae:	604b      	str	r3, [r1, #4]
 80099b0:	f7fe fdd0 	bl	8008554 <HAL_GetTick>
 80099b4:	6778      	str	r0, [r7, #116]	; 0x74
 80099b6:	e00a      	b.n	80099ce <HAL_RCC_ClockConfig+0x21a>
 80099b8:	f7fe fdcc 	bl	8008554 <HAL_GetTick>
 80099bc:	4602      	mov	r2, r0
 80099be:	6f7b      	ldr	r3, [r7, #116]	; 0x74
 80099c0:	1ad3      	subs	r3, r2, r3
 80099c2:	f241 3288 	movw	r2, #5000	; 0x1388
 80099c6:	4293      	cmp	r3, r2
 80099c8:	d901      	bls.n	80099ce <HAL_RCC_ClockConfig+0x21a>
 80099ca:	2303      	movs	r3, #3
 80099cc:	e061      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 80099ce:	4b11      	ldr	r3, [pc, #68]	; (8009a14 <HAL_RCC_ClockConfig+0x260>)
 80099d0:	685b      	ldr	r3, [r3, #4]
 80099d2:	f003 020c 	and.w	r2, r3, #12
 80099d6:	687b      	ldr	r3, [r7, #4]
 80099d8:	685b      	ldr	r3, [r3, #4]
 80099da:	009b      	lsls	r3, r3, #2
 80099dc:	429a      	cmp	r2, r3
 80099de:	d1eb      	bne.n	80099b8 <HAL_RCC_ClockConfig+0x204>
 80099e0:	4b0b      	ldr	r3, [pc, #44]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80099e2:	681b      	ldr	r3, [r3, #0]
 80099e4:	f003 0307 	and.w	r3, r3, #7
 80099e8:	683a      	ldr	r2, [r7, #0]
 80099ea:	429a      	cmp	r2, r3
 80099ec:	d214      	bcs.n	8009a18 <HAL_RCC_ClockConfig+0x264>
 80099ee:	4b08      	ldr	r3, [pc, #32]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80099f0:	681b      	ldr	r3, [r3, #0]
 80099f2:	f023 0207 	bic.w	r2, r3, #7
 80099f6:	4906      	ldr	r1, [pc, #24]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 80099f8:	683b      	ldr	r3, [r7, #0]
 80099fa:	4313      	orrs	r3, r2
 80099fc:	600b      	str	r3, [r1, #0]
 80099fe:	4b04      	ldr	r3, [pc, #16]	; (8009a10 <HAL_RCC_ClockConfig+0x25c>)
 8009a00:	681b      	ldr	r3, [r3, #0]
 8009a02:	f003 0307 	and.w	r3, r3, #7
 8009a06:	683a      	ldr	r2, [r7, #0]
 8009a08:	429a      	cmp	r2, r3
 8009a0a:	d005      	beq.n	8009a18 <HAL_RCC_ClockConfig+0x264>
 8009a0c:	2301      	movs	r3, #1
 8009a0e:	e040      	b.n	8009a92 <HAL_RCC_ClockConfig+0x2de>
 8009a10:	40022000 	.word	0x40022000
 8009a14:	40021000 	.word	0x40021000
 8009a18:	687b      	ldr	r3, [r7, #4]
 8009a1a:	681b      	ldr	r3, [r3, #0]
 8009a1c:	f003 0304 	and.w	r3, r3, #4
 8009a20:	2b00      	cmp	r3, #0
 8009a22:	d008      	beq.n	8009a36 <HAL_RCC_ClockConfig+0x282>
 8009a24:	4b1d      	ldr	r3, [pc, #116]	; (8009a9c <HAL_RCC_ClockConfig+0x2e8>)
 8009a26:	685b      	ldr	r3, [r3, #4]
 8009a28:	f423 62e0 	bic.w	r2, r3, #1792	; 0x700
 8009a2c:	687b      	ldr	r3, [r7, #4]
 8009a2e:	68db      	ldr	r3, [r3, #12]
 8009a30:	491a      	ldr	r1, [pc, #104]	; (8009a9c <HAL_RCC_ClockConfig+0x2e8>)
 8009a32:	4313      	orrs	r3, r2
 8009a34:	604b      	str	r3, [r1, #4]
 8009a36:	687b      	ldr	r3, [r7, #4]
 8009a38:	681b      	ldr	r3, [r3, #0]
 8009a3a:	f003 0308 	and.w	r3, r3, #8
 8009a3e:	2b00      	cmp	r3, #0
 8009a40:	d009      	beq.n	8009a56 <HAL_RCC_ClockConfig+0x2a2>
 8009a42:	4b16      	ldr	r3, [pc, #88]	; (8009a9c <HAL_RCC_ClockConfig+0x2e8>)
 8009a44:	685b      	ldr	r3, [r3, #4]
 8009a46:	f423 5260 	bic.w	r2, r3, #14336	; 0x3800
 8009a4a:	687b      	ldr	r3, [r7, #4]
 8009a4c:	691b      	ldr	r3, [r3, #16]
 8009a4e:	00db      	lsls	r3, r3, #3
 8009a50:	4912      	ldr	r1, [pc, #72]	; (8009a9c <HAL_RCC_ClockConfig+0x2e8>)
 8009a52:	4313      	orrs	r3, r2
 8009a54:	604b      	str	r3, [r1, #4]
 8009a56:	f000 f829 	bl	8009aac <HAL_RCC_GetSysClockFreq>
 8009a5a:	4601      	mov	r1, r0
 8009a5c:	4b0f      	ldr	r3, [pc, #60]	; (8009a9c <HAL_RCC_ClockConfig+0x2e8>)
 8009a5e:	685b      	ldr	r3, [r3, #4]
 8009a60:	f003 03f0 	and.w	r3, r3, #240	; 0xf0
 8009a64:	22f0      	movs	r2, #240	; 0xf0
 8009a66:	613a      	str	r2, [r7, #16]
 8009a68:	693a      	ldr	r2, [r7, #16]
 8009a6a:	fa92 f2a2 	rbit	r2, r2
 8009a6e:	60fa      	str	r2, [r7, #12]
 8009a70:	68fa      	ldr	r2, [r7, #12]
 8009a72:	fab2 f282 	clz	r2, r2
 8009a76:	b2d2      	uxtb	r2, r2
 8009a78:	40d3      	lsrs	r3, r2
 8009a7a:	4a09      	ldr	r2, [pc, #36]	; (8009aa0 <HAL_RCC_ClockConfig+0x2ec>)
 8009a7c:	5cd3      	ldrb	r3, [r2, r3]
 8009a7e:	fa21 f303 	lsr.w	r3, r1, r3
 8009a82:	4a08      	ldr	r2, [pc, #32]	; (8009aa4 <HAL_RCC_ClockConfig+0x2f0>)
 8009a84:	6013      	str	r3, [r2, #0]
 8009a86:	4b08      	ldr	r3, [pc, #32]	; (8009aa8 <HAL_RCC_ClockConfig+0x2f4>)
 8009a88:	681b      	ldr	r3, [r3, #0]
 8009a8a:	4618      	mov	r0, r3
 8009a8c:	f7fe fd32 	bl	80084f4 <HAL_InitTick>
 8009a90:	2300      	movs	r3, #0
 8009a92:	4618      	mov	r0, r3
 8009a94:	3778      	adds	r7, #120	; 0x78
 8009a96:	46bd      	mov	sp, r7
 8009a98:	bd80      	pop	{r7, pc}
 8009a9a:	bf00      	nop
 8009a9c:	40021000 	.word	0x40021000
 8009aa0:	08009fa4 	.word	0x08009fa4
 8009aa4:	20000000 	.word	0x20000000
 8009aa8:	20000004 	.word	0x20000004

08009aac <HAL_RCC_GetSysClockFreq>:
 8009aac:	b480      	push	{r7}
 8009aae:	b087      	sub	sp, #28
 8009ab0:	af00      	add	r7, sp, #0
 8009ab2:	2300      	movs	r3, #0
 8009ab4:	60fb      	str	r3, [r7, #12]
 8009ab6:	2300      	movs	r3, #0
 8009ab8:	60bb      	str	r3, [r7, #8]
 8009aba:	2300      	movs	r3, #0
 8009abc:	617b      	str	r3, [r7, #20]
 8009abe:	2300      	movs	r3, #0
 8009ac0:	607b      	str	r3, [r7, #4]
 8009ac2:	2300      	movs	r3, #0
 8009ac4:	613b      	str	r3, [r7, #16]
 8009ac6:	4b1e      	ldr	r3, [pc, #120]	; (8009b40 <HAL_RCC_GetSysClockFreq+0x94>)
 8009ac8:	685b      	ldr	r3, [r3, #4]
 8009aca:	60fb      	str	r3, [r7, #12]
 8009acc:	68fb      	ldr	r3, [r7, #12]
 8009ace:	f003 030c 	and.w	r3, r3, #12
 8009ad2:	2b04      	cmp	r3, #4
 8009ad4:	d002      	beq.n	8009adc <HAL_RCC_GetSysClockFreq+0x30>
 8009ad6:	2b08      	cmp	r3, #8
 8009ad8:	d003      	beq.n	8009ae2 <HAL_RCC_GetSysClockFreq+0x36>
 8009ada:	e026      	b.n	8009b2a <HAL_RCC_GetSysClockFreq+0x7e>
 8009adc:	4b19      	ldr	r3, [pc, #100]	; (8009b44 <HAL_RCC_GetSysClockFreq+0x98>)
 8009ade:	613b      	str	r3, [r7, #16]
 8009ae0:	e026      	b.n	8009b30 <HAL_RCC_GetSysClockFreq+0x84>
 8009ae2:	68fb      	ldr	r3, [r7, #12]
 8009ae4:	0c9b      	lsrs	r3, r3, #18
 8009ae6:	f003 030f 	and.w	r3, r3, #15
 8009aea:	4a17      	ldr	r2, [pc, #92]	; (8009b48 <HAL_RCC_GetSysClockFreq+0x9c>)
 8009aec:	5cd3      	ldrb	r3, [r2, r3]
 8009aee:	607b      	str	r3, [r7, #4]
 8009af0:	4b13      	ldr	r3, [pc, #76]	; (8009b40 <HAL_RCC_GetSysClockFreq+0x94>)
 8009af2:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8009af4:	f003 030f 	and.w	r3, r3, #15
 8009af8:	4a14      	ldr	r2, [pc, #80]	; (8009b4c <HAL_RCC_GetSysClockFreq+0xa0>)
 8009afa:	5cd3      	ldrb	r3, [r2, r3]
 8009afc:	60bb      	str	r3, [r7, #8]
 8009afe:	68fb      	ldr	r3, [r7, #12]
 8009b00:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 8009b04:	2b00      	cmp	r3, #0
 8009b06:	d008      	beq.n	8009b1a <HAL_RCC_GetSysClockFreq+0x6e>
 8009b08:	4a0e      	ldr	r2, [pc, #56]	; (8009b44 <HAL_RCC_GetSysClockFreq+0x98>)
 8009b0a:	68bb      	ldr	r3, [r7, #8]
 8009b0c:	fbb2 f2f3 	udiv	r2, r2, r3
 8009b10:	687b      	ldr	r3, [r7, #4]
 8009b12:	fb02 f303 	mul.w	r3, r2, r3
 8009b16:	617b      	str	r3, [r7, #20]
 8009b18:	e004      	b.n	8009b24 <HAL_RCC_GetSysClockFreq+0x78>
 8009b1a:	687b      	ldr	r3, [r7, #4]
 8009b1c:	4a0c      	ldr	r2, [pc, #48]	; (8009b50 <HAL_RCC_GetSysClockFreq+0xa4>)
 8009b1e:	fb02 f303 	mul.w	r3, r2, r3
 8009b22:	617b      	str	r3, [r7, #20]
 8009b24:	697b      	ldr	r3, [r7, #20]
 8009b26:	613b      	str	r3, [r7, #16]
 8009b28:	e002      	b.n	8009b30 <HAL_RCC_GetSysClockFreq+0x84>
 8009b2a:	4b0a      	ldr	r3, [pc, #40]	; (8009b54 <HAL_RCC_GetSysClockFreq+0xa8>)
 8009b2c:	613b      	str	r3, [r7, #16]
 8009b2e:	bf00      	nop
 8009b30:	693b      	ldr	r3, [r7, #16]
 8009b32:	4618      	mov	r0, r3
 8009b34:	371c      	adds	r7, #28
 8009b36:	46bd      	mov	sp, r7
 8009b38:	f85d 7b04 	ldr.w	r7, [sp], #4
 8009b3c:	4770      	bx	lr
 8009b3e:	bf00      	nop
 8009b40:	40021000 	.word	0x40021000
 8009b44:	0112a880 	.word	0x0112a880
 8009b48:	08009fb4 	.word	0x08009fb4
 8009b4c:	08009fc4 	.word	0x08009fc4
 8009b50:	003d0900 	.word	0x003d0900
 8009b54:	007a1200 	.word	0x007a1200

08009b58 <HAL_RCCEx_PeriphCLKConfig>:
 8009b58:	b580      	push	{r7, lr}
 8009b5a:	b092      	sub	sp, #72	; 0x48
 8009b5c:	af00      	add	r7, sp, #0
 8009b5e:	6078      	str	r0, [r7, #4]
 8009b60:	2300      	movs	r3, #0
 8009b62:	643b      	str	r3, [r7, #64]	; 0x40
 8009b64:	2300      	movs	r3, #0
 8009b66:	63fb      	str	r3, [r7, #60]	; 0x3c
 8009b68:	2300      	movs	r3, #0
 8009b6a:	f887 3047 	strb.w	r3, [r7, #71]	; 0x47
 8009b6e:	687b      	ldr	r3, [r7, #4]
 8009b70:	681b      	ldr	r3, [r3, #0]
 8009b72:	f403 3380 	and.w	r3, r3, #65536	; 0x10000
 8009b76:	2b00      	cmp	r3, #0
 8009b78:	f000 80d4 	beq.w	8009d24 <HAL_RCCEx_PeriphCLKConfig+0x1cc>
 8009b7c:	4b4e      	ldr	r3, [pc, #312]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009b7e:	69db      	ldr	r3, [r3, #28]
 8009b80:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8009b84:	2b00      	cmp	r3, #0
 8009b86:	d10e      	bne.n	8009ba6 <HAL_RCCEx_PeriphCLKConfig+0x4e>
 8009b88:	4b4b      	ldr	r3, [pc, #300]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009b8a:	69db      	ldr	r3, [r3, #28]
 8009b8c:	4a4a      	ldr	r2, [pc, #296]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009b8e:	f043 5380 	orr.w	r3, r3, #268435456	; 0x10000000
 8009b92:	61d3      	str	r3, [r2, #28]
 8009b94:	4b48      	ldr	r3, [pc, #288]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009b96:	69db      	ldr	r3, [r3, #28]
 8009b98:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8009b9c:	60bb      	str	r3, [r7, #8]
 8009b9e:	68bb      	ldr	r3, [r7, #8]
 8009ba0:	2301      	movs	r3, #1
 8009ba2:	f887 3047 	strb.w	r3, [r7, #71]	; 0x47
 8009ba6:	4b45      	ldr	r3, [pc, #276]	; (8009cbc <HAL_RCCEx_PeriphCLKConfig+0x164>)
 8009ba8:	681b      	ldr	r3, [r3, #0]
 8009baa:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8009bae:	2b00      	cmp	r3, #0
 8009bb0:	d118      	bne.n	8009be4 <HAL_RCCEx_PeriphCLKConfig+0x8c>
 8009bb2:	4b42      	ldr	r3, [pc, #264]	; (8009cbc <HAL_RCCEx_PeriphCLKConfig+0x164>)
 8009bb4:	681b      	ldr	r3, [r3, #0]
 8009bb6:	4a41      	ldr	r2, [pc, #260]	; (8009cbc <HAL_RCCEx_PeriphCLKConfig+0x164>)
 8009bb8:	f443 7380 	orr.w	r3, r3, #256	; 0x100
 8009bbc:	6013      	str	r3, [r2, #0]
 8009bbe:	f7fe fcc9 	bl	8008554 <HAL_GetTick>
 8009bc2:	6438      	str	r0, [r7, #64]	; 0x40
 8009bc4:	e008      	b.n	8009bd8 <HAL_RCCEx_PeriphCLKConfig+0x80>
 8009bc6:	f7fe fcc5 	bl	8008554 <HAL_GetTick>
 8009bca:	4602      	mov	r2, r0
 8009bcc:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 8009bce:	1ad3      	subs	r3, r2, r3
 8009bd0:	2b64      	cmp	r3, #100	; 0x64
 8009bd2:	d901      	bls.n	8009bd8 <HAL_RCCEx_PeriphCLKConfig+0x80>
 8009bd4:	2303      	movs	r3, #3
 8009bd6:	e169      	b.n	8009eac <HAL_RCCEx_PeriphCLKConfig+0x354>
 8009bd8:	4b38      	ldr	r3, [pc, #224]	; (8009cbc <HAL_RCCEx_PeriphCLKConfig+0x164>)
 8009bda:	681b      	ldr	r3, [r3, #0]
 8009bdc:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8009be0:	2b00      	cmp	r3, #0
 8009be2:	d0f0      	beq.n	8009bc6 <HAL_RCCEx_PeriphCLKConfig+0x6e>
 8009be4:	4b34      	ldr	r3, [pc, #208]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009be6:	6a1b      	ldr	r3, [r3, #32]
 8009be8:	f403 7340 	and.w	r3, r3, #768	; 0x300
 8009bec:	63fb      	str	r3, [r7, #60]	; 0x3c
 8009bee:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8009bf0:	2b00      	cmp	r3, #0
 8009bf2:	f000 8084 	beq.w	8009cfe <HAL_RCCEx_PeriphCLKConfig+0x1a6>
 8009bf6:	687b      	ldr	r3, [r7, #4]
 8009bf8:	685b      	ldr	r3, [r3, #4]
 8009bfa:	f403 7340 	and.w	r3, r3, #768	; 0x300
 8009bfe:	6bfa      	ldr	r2, [r7, #60]	; 0x3c
 8009c00:	429a      	cmp	r2, r3
 8009c02:	d07c      	beq.n	8009cfe <HAL_RCCEx_PeriphCLKConfig+0x1a6>
 8009c04:	4b2c      	ldr	r3, [pc, #176]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009c06:	6a1b      	ldr	r3, [r3, #32]
 8009c08:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8009c0c:	63fb      	str	r3, [r7, #60]	; 0x3c
 8009c0e:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 8009c12:	633b      	str	r3, [r7, #48]	; 0x30
 8009c14:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8009c16:	fa93 f3a3 	rbit	r3, r3
 8009c1a:	62fb      	str	r3, [r7, #44]	; 0x2c
 8009c1c:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8009c1e:	fab3 f383 	clz	r3, r3
 8009c22:	b2db      	uxtb	r3, r3
 8009c24:	461a      	mov	r2, r3
 8009c26:	4b26      	ldr	r3, [pc, #152]	; (8009cc0 <HAL_RCCEx_PeriphCLKConfig+0x168>)
 8009c28:	4413      	add	r3, r2
 8009c2a:	009b      	lsls	r3, r3, #2
 8009c2c:	461a      	mov	r2, r3
 8009c2e:	2301      	movs	r3, #1
 8009c30:	6013      	str	r3, [r2, #0]
 8009c32:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 8009c36:	63bb      	str	r3, [r7, #56]	; 0x38
 8009c38:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8009c3a:	fa93 f3a3 	rbit	r3, r3
 8009c3e:	637b      	str	r3, [r7, #52]	; 0x34
 8009c40:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8009c42:	fab3 f383 	clz	r3, r3
 8009c46:	b2db      	uxtb	r3, r3
 8009c48:	461a      	mov	r2, r3
 8009c4a:	4b1d      	ldr	r3, [pc, #116]	; (8009cc0 <HAL_RCCEx_PeriphCLKConfig+0x168>)
 8009c4c:	4413      	add	r3, r2
 8009c4e:	009b      	lsls	r3, r3, #2
 8009c50:	461a      	mov	r2, r3
 8009c52:	2300      	movs	r3, #0
 8009c54:	6013      	str	r3, [r2, #0]
 8009c56:	4a18      	ldr	r2, [pc, #96]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009c58:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8009c5a:	6213      	str	r3, [r2, #32]
 8009c5c:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8009c5e:	f003 0301 	and.w	r3, r3, #1
 8009c62:	2b00      	cmp	r3, #0
 8009c64:	d04b      	beq.n	8009cfe <HAL_RCCEx_PeriphCLKConfig+0x1a6>
 8009c66:	f7fe fc75 	bl	8008554 <HAL_GetTick>
 8009c6a:	6438      	str	r0, [r7, #64]	; 0x40
 8009c6c:	e00a      	b.n	8009c84 <HAL_RCCEx_PeriphCLKConfig+0x12c>
 8009c6e:	f7fe fc71 	bl	8008554 <HAL_GetTick>
 8009c72:	4602      	mov	r2, r0
 8009c74:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 8009c76:	1ad3      	subs	r3, r2, r3
 8009c78:	f241 3288 	movw	r2, #5000	; 0x1388
 8009c7c:	4293      	cmp	r3, r2
 8009c7e:	d901      	bls.n	8009c84 <HAL_RCCEx_PeriphCLKConfig+0x12c>
 8009c80:	2303      	movs	r3, #3
 8009c82:	e113      	b.n	8009eac <HAL_RCCEx_PeriphCLKConfig+0x354>
 8009c84:	2302      	movs	r3, #2
 8009c86:	62bb      	str	r3, [r7, #40]	; 0x28
 8009c88:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8009c8a:	fa93 f3a3 	rbit	r3, r3
 8009c8e:	627b      	str	r3, [r7, #36]	; 0x24
 8009c90:	2302      	movs	r3, #2
 8009c92:	623b      	str	r3, [r7, #32]
 8009c94:	6a3b      	ldr	r3, [r7, #32]
 8009c96:	fa93 f3a3 	rbit	r3, r3
 8009c9a:	61fb      	str	r3, [r7, #28]
 8009c9c:	69fb      	ldr	r3, [r7, #28]
 8009c9e:	fab3 f383 	clz	r3, r3
 8009ca2:	b2db      	uxtb	r3, r3
 8009ca4:	095b      	lsrs	r3, r3, #5
 8009ca6:	b2db      	uxtb	r3, r3
 8009ca8:	f043 0302 	orr.w	r3, r3, #2
 8009cac:	b2db      	uxtb	r3, r3
 8009cae:	2b02      	cmp	r3, #2
 8009cb0:	d108      	bne.n	8009cc4 <HAL_RCCEx_PeriphCLKConfig+0x16c>
 8009cb2:	4b01      	ldr	r3, [pc, #4]	; (8009cb8 <HAL_RCCEx_PeriphCLKConfig+0x160>)
 8009cb4:	6a1b      	ldr	r3, [r3, #32]
 8009cb6:	e00d      	b.n	8009cd4 <HAL_RCCEx_PeriphCLKConfig+0x17c>
 8009cb8:	40021000 	.word	0x40021000
 8009cbc:	40007000 	.word	0x40007000
 8009cc0:	10908100 	.word	0x10908100
 8009cc4:	2302      	movs	r3, #2
 8009cc6:	61bb      	str	r3, [r7, #24]
 8009cc8:	69bb      	ldr	r3, [r7, #24]
 8009cca:	fa93 f3a3 	rbit	r3, r3
 8009cce:	617b      	str	r3, [r7, #20]
 8009cd0:	4b78      	ldr	r3, [pc, #480]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009cd2:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8009cd4:	2202      	movs	r2, #2
 8009cd6:	613a      	str	r2, [r7, #16]
 8009cd8:	693a      	ldr	r2, [r7, #16]
 8009cda:	fa92 f2a2 	rbit	r2, r2
 8009cde:	60fa      	str	r2, [r7, #12]
 8009ce0:	68fa      	ldr	r2, [r7, #12]
 8009ce2:	fab2 f282 	clz	r2, r2
 8009ce6:	b2d2      	uxtb	r2, r2
 8009ce8:	f042 0240 	orr.w	r2, r2, #64	; 0x40
 8009cec:	b2d2      	uxtb	r2, r2
 8009cee:	f002 021f 	and.w	r2, r2, #31
 8009cf2:	2101      	movs	r1, #1
 8009cf4:	fa01 f202 	lsl.w	r2, r1, r2
 8009cf8:	4013      	ands	r3, r2
 8009cfa:	2b00      	cmp	r3, #0
 8009cfc:	d0b7      	beq.n	8009c6e <HAL_RCCEx_PeriphCLKConfig+0x116>
 8009cfe:	4b6d      	ldr	r3, [pc, #436]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d00:	6a1b      	ldr	r3, [r3, #32]
 8009d02:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 8009d06:	687b      	ldr	r3, [r7, #4]
 8009d08:	685b      	ldr	r3, [r3, #4]
 8009d0a:	496a      	ldr	r1, [pc, #424]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d0c:	4313      	orrs	r3, r2
 8009d0e:	620b      	str	r3, [r1, #32]
 8009d10:	f897 3047 	ldrb.w	r3, [r7, #71]	; 0x47
 8009d14:	2b01      	cmp	r3, #1
 8009d16:	d105      	bne.n	8009d24 <HAL_RCCEx_PeriphCLKConfig+0x1cc>
 8009d18:	4b66      	ldr	r3, [pc, #408]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d1a:	69db      	ldr	r3, [r3, #28]
 8009d1c:	4a65      	ldr	r2, [pc, #404]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d1e:	f023 5380 	bic.w	r3, r3, #268435456	; 0x10000000
 8009d22:	61d3      	str	r3, [r2, #28]
 8009d24:	687b      	ldr	r3, [r7, #4]
 8009d26:	681b      	ldr	r3, [r3, #0]
 8009d28:	f003 0301 	and.w	r3, r3, #1
 8009d2c:	2b00      	cmp	r3, #0
 8009d2e:	d008      	beq.n	8009d42 <HAL_RCCEx_PeriphCLKConfig+0x1ea>
 8009d30:	4b60      	ldr	r3, [pc, #384]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d32:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009d34:	f023 0203 	bic.w	r2, r3, #3
 8009d38:	687b      	ldr	r3, [r7, #4]
 8009d3a:	689b      	ldr	r3, [r3, #8]
 8009d3c:	495d      	ldr	r1, [pc, #372]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d3e:	4313      	orrs	r3, r2
 8009d40:	630b      	str	r3, [r1, #48]	; 0x30
 8009d42:	687b      	ldr	r3, [r7, #4]
 8009d44:	681b      	ldr	r3, [r3, #0]
 8009d46:	f003 0302 	and.w	r3, r3, #2
 8009d4a:	2b00      	cmp	r3, #0
 8009d4c:	d008      	beq.n	8009d60 <HAL_RCCEx_PeriphCLKConfig+0x208>
 8009d4e:	4b59      	ldr	r3, [pc, #356]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d50:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009d52:	f423 3240 	bic.w	r2, r3, #196608	; 0x30000
 8009d56:	687b      	ldr	r3, [r7, #4]
 8009d58:	68db      	ldr	r3, [r3, #12]
 8009d5a:	4956      	ldr	r1, [pc, #344]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d5c:	4313      	orrs	r3, r2
 8009d5e:	630b      	str	r3, [r1, #48]	; 0x30
 8009d60:	687b      	ldr	r3, [r7, #4]
 8009d62:	681b      	ldr	r3, [r3, #0]
 8009d64:	f003 0304 	and.w	r3, r3, #4
 8009d68:	2b00      	cmp	r3, #0
 8009d6a:	d008      	beq.n	8009d7e <HAL_RCCEx_PeriphCLKConfig+0x226>
 8009d6c:	4b51      	ldr	r3, [pc, #324]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d6e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009d70:	f423 2240 	bic.w	r2, r3, #786432	; 0xc0000
 8009d74:	687b      	ldr	r3, [r7, #4]
 8009d76:	691b      	ldr	r3, [r3, #16]
 8009d78:	494e      	ldr	r1, [pc, #312]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d7a:	4313      	orrs	r3, r2
 8009d7c:	630b      	str	r3, [r1, #48]	; 0x30
 8009d7e:	687b      	ldr	r3, [r7, #4]
 8009d80:	681b      	ldr	r3, [r3, #0]
 8009d82:	f003 0320 	and.w	r3, r3, #32
 8009d86:	2b00      	cmp	r3, #0
 8009d88:	d008      	beq.n	8009d9c <HAL_RCCEx_PeriphCLKConfig+0x244>
 8009d8a:	4b4a      	ldr	r3, [pc, #296]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d8c:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009d8e:	f023 0210 	bic.w	r2, r3, #16
 8009d92:	687b      	ldr	r3, [r7, #4]
 8009d94:	69db      	ldr	r3, [r3, #28]
 8009d96:	4947      	ldr	r1, [pc, #284]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009d98:	4313      	orrs	r3, r2
 8009d9a:	630b      	str	r3, [r1, #48]	; 0x30
 8009d9c:	687b      	ldr	r3, [r7, #4]
 8009d9e:	681b      	ldr	r3, [r3, #0]
 8009da0:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8009da4:	2b00      	cmp	r3, #0
 8009da6:	d008      	beq.n	8009dba <HAL_RCCEx_PeriphCLKConfig+0x262>
 8009da8:	4b42      	ldr	r3, [pc, #264]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009daa:	685b      	ldr	r3, [r3, #4]
 8009dac:	f423 0280 	bic.w	r2, r3, #4194304	; 0x400000
 8009db0:	687b      	ldr	r3, [r7, #4]
 8009db2:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8009db4:	493f      	ldr	r1, [pc, #252]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009db6:	4313      	orrs	r3, r2
 8009db8:	604b      	str	r3, [r1, #4]
 8009dba:	687b      	ldr	r3, [r7, #4]
 8009dbc:	681b      	ldr	r3, [r3, #0]
 8009dbe:	f003 0340 	and.w	r3, r3, #64	; 0x40
 8009dc2:	2b00      	cmp	r3, #0
 8009dc4:	d008      	beq.n	8009dd8 <HAL_RCCEx_PeriphCLKConfig+0x280>
 8009dc6:	4b3b      	ldr	r3, [pc, #236]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009dc8:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009dca:	f023 0220 	bic.w	r2, r3, #32
 8009dce:	687b      	ldr	r3, [r7, #4]
 8009dd0:	6a1b      	ldr	r3, [r3, #32]
 8009dd2:	4938      	ldr	r1, [pc, #224]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009dd4:	4313      	orrs	r3, r2
 8009dd6:	630b      	str	r3, [r1, #48]	; 0x30
 8009dd8:	687b      	ldr	r3, [r7, #4]
 8009dda:	681b      	ldr	r3, [r3, #0]
 8009ddc:	f003 0308 	and.w	r3, r3, #8
 8009de0:	2b00      	cmp	r3, #0
 8009de2:	d008      	beq.n	8009df6 <HAL_RCCEx_PeriphCLKConfig+0x29e>
 8009de4:	4b33      	ldr	r3, [pc, #204]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009de6:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009de8:	f423 1240 	bic.w	r2, r3, #3145728	; 0x300000
 8009dec:	687b      	ldr	r3, [r7, #4]
 8009dee:	695b      	ldr	r3, [r3, #20]
 8009df0:	4930      	ldr	r1, [pc, #192]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009df2:	4313      	orrs	r3, r2
 8009df4:	630b      	str	r3, [r1, #48]	; 0x30
 8009df6:	687b      	ldr	r3, [r7, #4]
 8009df8:	681b      	ldr	r3, [r3, #0]
 8009dfa:	f003 0310 	and.w	r3, r3, #16
 8009dfe:	2b00      	cmp	r3, #0
 8009e00:	d008      	beq.n	8009e14 <HAL_RCCEx_PeriphCLKConfig+0x2bc>
 8009e02:	4b2c      	ldr	r3, [pc, #176]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e04:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009e06:	f423 0240 	bic.w	r2, r3, #12582912	; 0xc00000
 8009e0a:	687b      	ldr	r3, [r7, #4]
 8009e0c:	699b      	ldr	r3, [r3, #24]
 8009e0e:	4929      	ldr	r1, [pc, #164]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e10:	4313      	orrs	r3, r2
 8009e12:	630b      	str	r3, [r1, #48]	; 0x30
 8009e14:	687b      	ldr	r3, [r7, #4]
 8009e16:	681b      	ldr	r3, [r3, #0]
 8009e18:	f403 7300 	and.w	r3, r3, #512	; 0x200
 8009e1c:	2b00      	cmp	r3, #0
 8009e1e:	d008      	beq.n	8009e32 <HAL_RCCEx_PeriphCLKConfig+0x2da>
 8009e20:	4b24      	ldr	r3, [pc, #144]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e22:	685b      	ldr	r3, [r3, #4]
 8009e24:	f423 0200 	bic.w	r2, r3, #8388608	; 0x800000
 8009e28:	687b      	ldr	r3, [r7, #4]
 8009e2a:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8009e2c:	4921      	ldr	r1, [pc, #132]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e2e:	4313      	orrs	r3, r2
 8009e30:	604b      	str	r3, [r1, #4]
 8009e32:	687b      	ldr	r3, [r7, #4]
 8009e34:	681b      	ldr	r3, [r3, #0]
 8009e36:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8009e3a:	2b00      	cmp	r3, #0
 8009e3c:	d008      	beq.n	8009e50 <HAL_RCCEx_PeriphCLKConfig+0x2f8>
 8009e3e:	4b1d      	ldr	r3, [pc, #116]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e40:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8009e42:	f423 72f8 	bic.w	r2, r3, #496	; 0x1f0
 8009e46:	687b      	ldr	r3, [r7, #4]
 8009e48:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8009e4a:	491a      	ldr	r1, [pc, #104]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e4c:	4313      	orrs	r3, r2
 8009e4e:	62cb      	str	r3, [r1, #44]	; 0x2c
 8009e50:	687b      	ldr	r3, [r7, #4]
 8009e52:	681b      	ldr	r3, [r3, #0]
 8009e54:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8009e58:	2b00      	cmp	r3, #0
 8009e5a:	d008      	beq.n	8009e6e <HAL_RCCEx_PeriphCLKConfig+0x316>
 8009e5c:	4b15      	ldr	r3, [pc, #84]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e5e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8009e60:	f423 5278 	bic.w	r2, r3, #15872	; 0x3e00
 8009e64:	687b      	ldr	r3, [r7, #4]
 8009e66:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 8009e68:	4912      	ldr	r1, [pc, #72]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e6a:	4313      	orrs	r3, r2
 8009e6c:	62cb      	str	r3, [r1, #44]	; 0x2c
 8009e6e:	687b      	ldr	r3, [r7, #4]
 8009e70:	681b      	ldr	r3, [r3, #0]
 8009e72:	f403 5380 	and.w	r3, r3, #4096	; 0x1000
 8009e76:	2b00      	cmp	r3, #0
 8009e78:	d008      	beq.n	8009e8c <HAL_RCCEx_PeriphCLKConfig+0x334>
 8009e7a:	4b0e      	ldr	r3, [pc, #56]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e7c:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009e7e:	f423 7280 	bic.w	r2, r3, #256	; 0x100
 8009e82:	687b      	ldr	r3, [r7, #4]
 8009e84:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009e86:	490b      	ldr	r1, [pc, #44]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e88:	4313      	orrs	r3, r2
 8009e8a:	630b      	str	r3, [r1, #48]	; 0x30
 8009e8c:	687b      	ldr	r3, [r7, #4]
 8009e8e:	681b      	ldr	r3, [r3, #0]
 8009e90:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
 8009e94:	2b00      	cmp	r3, #0
 8009e96:	d008      	beq.n	8009eaa <HAL_RCCEx_PeriphCLKConfig+0x352>
 8009e98:	4b06      	ldr	r3, [pc, #24]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009e9a:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8009e9c:	f423 7200 	bic.w	r2, r3, #512	; 0x200
 8009ea0:	687b      	ldr	r3, [r7, #4]
 8009ea2:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8009ea4:	4903      	ldr	r1, [pc, #12]	; (8009eb4 <HAL_RCCEx_PeriphCLKConfig+0x35c>)
 8009ea6:	4313      	orrs	r3, r2
 8009ea8:	630b      	str	r3, [r1, #48]	; 0x30
 8009eaa:	2300      	movs	r3, #0
 8009eac:	4618      	mov	r0, r3
 8009eae:	3748      	adds	r7, #72	; 0x48
 8009eb0:	46bd      	mov	sp, r7
 8009eb2:	bd80      	pop	{r7, pc}
 8009eb4:	40021000 	.word	0x40021000

08009eb8 <__libc_init_array>:
 8009eb8:	b570      	push	{r4, r5, r6, lr}
 8009eba:	4e0d      	ldr	r6, [pc, #52]	; (8009ef0 <__libc_init_array+0x38>)
 8009ebc:	4d0d      	ldr	r5, [pc, #52]	; (8009ef4 <__libc_init_array+0x3c>)
 8009ebe:	1b76      	subs	r6, r6, r5
 8009ec0:	10b6      	asrs	r6, r6, #2
 8009ec2:	d006      	beq.n	8009ed2 <__libc_init_array+0x1a>
 8009ec4:	2400      	movs	r4, #0
 8009ec6:	f855 3b04 	ldr.w	r3, [r5], #4
 8009eca:	3401      	adds	r4, #1
 8009ecc:	4798      	blx	r3
 8009ece:	42a6      	cmp	r6, r4
 8009ed0:	d1f9      	bne.n	8009ec6 <__libc_init_array+0xe>
 8009ed2:	4e09      	ldr	r6, [pc, #36]	; (8009ef8 <__libc_init_array+0x40>)
 8009ed4:	4d09      	ldr	r5, [pc, #36]	; (8009efc <__libc_init_array+0x44>)
 8009ed6:	1b76      	subs	r6, r6, r5
 8009ed8:	f7fe fae8 	bl	80084ac <_init>
 8009edc:	10b6      	asrs	r6, r6, #2
 8009ede:	d006      	beq.n	8009eee <__libc_init_array+0x36>
 8009ee0:	2400      	movs	r4, #0
 8009ee2:	f855 3b04 	ldr.w	r3, [r5], #4
 8009ee6:	3401      	adds	r4, #1
 8009ee8:	4798      	blx	r3
 8009eea:	42a6      	cmp	r6, r4
 8009eec:	d1f9      	bne.n	8009ee2 <__libc_init_array+0x2a>
 8009eee:	bd70      	pop	{r4, r5, r6, pc}
 8009ef0:	08009fd4 	.word	0x08009fd4
 8009ef4:	08009fd4 	.word	0x08009fd4
 8009ef8:	08009fd4 	.word	0x08009fd4
 8009efc:	08009fd4 	.word	0x08009fd4

08009f00 <memset>:
 8009f00:	0783      	lsls	r3, r0, #30
 8009f02:	b530      	push	{r4, r5, lr}
 8009f04:	d048      	beq.n	8009f98 <memset+0x98>
 8009f06:	1e54      	subs	r4, r2, #1
 8009f08:	2a00      	cmp	r2, #0
 8009f0a:	d03f      	beq.n	8009f8c <memset+0x8c>
 8009f0c:	b2ca      	uxtb	r2, r1
 8009f0e:	4603      	mov	r3, r0
 8009f10:	e001      	b.n	8009f16 <memset+0x16>
 8009f12:	3c01      	subs	r4, #1
 8009f14:	d33a      	bcc.n	8009f8c <memset+0x8c>
 8009f16:	f803 2b01 	strb.w	r2, [r3], #1
 8009f1a:	079d      	lsls	r5, r3, #30
 8009f1c:	d1f9      	bne.n	8009f12 <memset+0x12>
 8009f1e:	2c03      	cmp	r4, #3
 8009f20:	d92d      	bls.n	8009f7e <memset+0x7e>
 8009f22:	b2cd      	uxtb	r5, r1
 8009f24:	ea45 2505 	orr.w	r5, r5, r5, lsl #8
 8009f28:	2c0f      	cmp	r4, #15
 8009f2a:	ea45 4505 	orr.w	r5, r5, r5, lsl #16
 8009f2e:	d936      	bls.n	8009f9e <memset+0x9e>
 8009f30:	f1a4 0210 	sub.w	r2, r4, #16
 8009f34:	f022 0c0f 	bic.w	ip, r2, #15
 8009f38:	f103 0e20 	add.w	lr, r3, #32
 8009f3c:	44e6      	add	lr, ip
 8009f3e:	ea4f 1c12 	mov.w	ip, r2, lsr #4
 8009f42:	f103 0210 	add.w	r2, r3, #16
 8009f46:	e942 5504 	strd	r5, r5, [r2, #-16]
 8009f4a:	e942 5502 	strd	r5, r5, [r2, #-8]
 8009f4e:	3210      	adds	r2, #16
 8009f50:	4572      	cmp	r2, lr
 8009f52:	d1f8      	bne.n	8009f46 <memset+0x46>
 8009f54:	f10c 0201 	add.w	r2, ip, #1
 8009f58:	f014 0f0c 	tst.w	r4, #12
 8009f5c:	eb03 1202 	add.w	r2, r3, r2, lsl #4
 8009f60:	f004 0c0f 	and.w	ip, r4, #15
 8009f64:	d013      	beq.n	8009f8e <memset+0x8e>
 8009f66:	f1ac 0304 	sub.w	r3, ip, #4
 8009f6a:	f023 0303 	bic.w	r3, r3, #3
 8009f6e:	3304      	adds	r3, #4
 8009f70:	4413      	add	r3, r2
 8009f72:	f842 5b04 	str.w	r5, [r2], #4
 8009f76:	4293      	cmp	r3, r2
 8009f78:	d1fb      	bne.n	8009f72 <memset+0x72>
 8009f7a:	f00c 0403 	and.w	r4, ip, #3
 8009f7e:	b12c      	cbz	r4, 8009f8c <memset+0x8c>
 8009f80:	b2ca      	uxtb	r2, r1
 8009f82:	441c      	add	r4, r3
 8009f84:	f803 2b01 	strb.w	r2, [r3], #1
 8009f88:	429c      	cmp	r4, r3
 8009f8a:	d1fb      	bne.n	8009f84 <memset+0x84>
 8009f8c:	bd30      	pop	{r4, r5, pc}
 8009f8e:	4664      	mov	r4, ip
 8009f90:	4613      	mov	r3, r2
 8009f92:	2c00      	cmp	r4, #0
 8009f94:	d1f4      	bne.n	8009f80 <memset+0x80>
 8009f96:	e7f9      	b.n	8009f8c <memset+0x8c>
 8009f98:	4603      	mov	r3, r0
 8009f9a:	4614      	mov	r4, r2
 8009f9c:	e7bf      	b.n	8009f1e <memset+0x1e>
 8009f9e:	461a      	mov	r2, r3
 8009fa0:	46a4      	mov	ip, r4
 8009fa2:	e7e0      	b.n	8009f66 <memset+0x66>
