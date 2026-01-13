
C:/Users/fabia/Desktop/HeliESC/SW/Out/CMake_Files/BootLoader.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <SystemInit>:
 8000188:	b480      	push	{r7}
 800018a:	af00      	add	r7, sp, #0
 800018c:	4b06      	ldr	r3, [pc, #24]	; (80001a8 <SystemInit+0x20>)
 800018e:	f8d3 3088 	ldr.w	r3, [r3, #136]	; 0x88
 8000192:	4a05      	ldr	r2, [pc, #20]	; (80001a8 <SystemInit+0x20>)
 8000194:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8000198:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 800019c:	bf00      	nop
 800019e:	46bd      	mov	sp, r7
 80001a0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80001a4:	4770      	bx	lr
 80001a6:	bf00      	nop
 80001a8:	e000ed00 	.word	0xe000ed00

080001ac <main>:
 80001ac:	b580      	push	{r7, lr}
 80001ae:	af00      	add	r7, sp, #0
 80001b0:	f000 f802 	bl	80001b8 <BootLoader_JumpTo_App>
 80001b4:	e7fe      	b.n	80001b4 <main+0x8>
	...

080001b8 <BootLoader_JumpTo_App>:
 80001b8:	b580      	push	{r7, lr}
 80001ba:	b086      	sub	sp, #24
 80001bc:	af00      	add	r7, sp, #0
 80001be:	b672      	cpsid	i
 80001c0:	bf00      	nop
 80001c2:	2300      	movs	r3, #0
 80001c4:	617b      	str	r3, [r7, #20]
 80001c6:	e010      	b.n	80001ea <BootLoader_JumpTo_App+0x32>
 80001c8:	4a1d      	ldr	r2, [pc, #116]	; (8000240 <BootLoader_JumpTo_App+0x88>)
 80001ca:	697b      	ldr	r3, [r7, #20]
 80001cc:	3320      	adds	r3, #32
 80001ce:	f04f 31ff 	mov.w	r1, #4294967295
 80001d2:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80001d6:	4a1a      	ldr	r2, [pc, #104]	; (8000240 <BootLoader_JumpTo_App+0x88>)
 80001d8:	697b      	ldr	r3, [r7, #20]
 80001da:	3360      	adds	r3, #96	; 0x60
 80001dc:	f04f 31ff 	mov.w	r1, #4294967295
 80001e0:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80001e4:	697b      	ldr	r3, [r7, #20]
 80001e6:	3301      	adds	r3, #1
 80001e8:	617b      	str	r3, [r7, #20]
 80001ea:	697b      	ldr	r3, [r7, #20]
 80001ec:	2b07      	cmp	r3, #7
 80001ee:	d9eb      	bls.n	80001c8 <BootLoader_JumpTo_App+0x10>
 80001f0:	4b14      	ldr	r3, [pc, #80]	; (8000244 <BootLoader_JumpTo_App+0x8c>)
 80001f2:	2200      	movs	r2, #0
 80001f4:	601a      	str	r2, [r3, #0]
 80001f6:	4b13      	ldr	r3, [pc, #76]	; (8000244 <BootLoader_JumpTo_App+0x8c>)
 80001f8:	2200      	movs	r2, #0
 80001fa:	605a      	str	r2, [r3, #4]
 80001fc:	4b11      	ldr	r3, [pc, #68]	; (8000244 <BootLoader_JumpTo_App+0x8c>)
 80001fe:	2200      	movs	r2, #0
 8000200:	609a      	str	r2, [r3, #8]
 8000202:	4b11      	ldr	r3, [pc, #68]	; (8000248 <BootLoader_JumpTo_App+0x90>)
 8000204:	681b      	ldr	r3, [r3, #0]
 8000206:	681b      	ldr	r3, [r3, #0]
 8000208:	613b      	str	r3, [r7, #16]
 800020a:	4b0f      	ldr	r3, [pc, #60]	; (8000248 <BootLoader_JumpTo_App+0x90>)
 800020c:	681b      	ldr	r3, [r3, #0]
 800020e:	3304      	adds	r3, #4
 8000210:	681b      	ldr	r3, [r3, #0]
 8000212:	60fb      	str	r3, [r7, #12]
 8000214:	693b      	ldr	r3, [r7, #16]
 8000216:	607b      	str	r3, [r7, #4]
 8000218:	687b      	ldr	r3, [r7, #4]
 800021a:	f383 8808 	msr	MSP, r3
 800021e:	bf00      	nop
 8000220:	4a0a      	ldr	r2, [pc, #40]	; (800024c <BootLoader_JumpTo_App+0x94>)
 8000222:	4b09      	ldr	r3, [pc, #36]	; (8000248 <BootLoader_JumpTo_App+0x90>)
 8000224:	681b      	ldr	r3, [r3, #0]
 8000226:	6093      	str	r3, [r2, #8]
 8000228:	f3bf 8f4f 	dsb	sy
 800022c:	bf00      	nop
 800022e:	f3bf 8f6f 	isb	sy
 8000232:	bf00      	nop
 8000234:	68fb      	ldr	r3, [r7, #12]
 8000236:	60bb      	str	r3, [r7, #8]
 8000238:	68bb      	ldr	r3, [r7, #8]
 800023a:	4798      	blx	r3
 800023c:	e7fe      	b.n	800023c <BootLoader_JumpTo_App+0x84>
 800023e:	bf00      	nop
 8000240:	e000e100 	.word	0xe000e100
 8000244:	e000e010 	.word	0xe000e010
 8000248:	08000000 	.word	0x08000000
 800024c:	e000ed00 	.word	0xe000ed00

08000250 <NMI_Handler>:
 8000250:	b480      	push	{r7}
 8000252:	af00      	add	r7, sp, #0
 8000254:	e7fe      	b.n	8000254 <NMI_Handler+0x4>

08000256 <HardFault_Handler>:
 8000256:	b480      	push	{r7}
 8000258:	af00      	add	r7, sp, #0
 800025a:	e7fe      	b.n	800025a <HardFault_Handler+0x4>

0800025c <MemManage_Handler>:
 800025c:	b480      	push	{r7}
 800025e:	af00      	add	r7, sp, #0
 8000260:	e7fe      	b.n	8000260 <MemManage_Handler+0x4>

08000262 <BusFault_Handler>:
 8000262:	b480      	push	{r7}
 8000264:	af00      	add	r7, sp, #0
 8000266:	e7fe      	b.n	8000266 <BusFault_Handler+0x4>

08000268 <UsageFault_Handler>:
 8000268:	b480      	push	{r7}
 800026a:	af00      	add	r7, sp, #0
 800026c:	e7fe      	b.n	800026c <UsageFault_Handler+0x4>

0800026e <SVC_Handler>:
 800026e:	b480      	push	{r7}
 8000270:	af00      	add	r7, sp, #0
 8000272:	e7fe      	b.n	8000272 <SVC_Handler+0x4>

08000274 <DebugMon_Handler>:
 8000274:	b480      	push	{r7}
 8000276:	af00      	add	r7, sp, #0
 8000278:	e7fe      	b.n	8000278 <DebugMon_Handler+0x4>

0800027a <PendSV_Handler>:
 800027a:	b480      	push	{r7}
 800027c:	af00      	add	r7, sp, #0
 800027e:	e7fe      	b.n	800027e <PendSV_Handler+0x4>

08000280 <SysTick_Handler>:
 8000280:	b480      	push	{r7}
 8000282:	af00      	add	r7, sp, #0
 8000284:	e7fe      	b.n	8000284 <SysTick_Handler+0x4>

08000286 <WWDG_IRQHandler>:
 8000286:	b480      	push	{r7}
 8000288:	af00      	add	r7, sp, #0
 800028a:	e7fe      	b.n	800028a <WWDG_IRQHandler+0x4>

0800028c <PVD_IRQHandler>:
 800028c:	b480      	push	{r7}
 800028e:	af00      	add	r7, sp, #0
 8000290:	e7fe      	b.n	8000290 <PVD_IRQHandler+0x4>

08000292 <TAMP_STAMP_IRQHandler>:
 8000292:	b480      	push	{r7}
 8000294:	af00      	add	r7, sp, #0
 8000296:	e7fe      	b.n	8000296 <TAMP_STAMP_IRQHandler+0x4>

08000298 <RTC_WKUP_IRQHandler>:
 8000298:	b480      	push	{r7}
 800029a:	af00      	add	r7, sp, #0
 800029c:	e7fe      	b.n	800029c <RTC_WKUP_IRQHandler+0x4>

0800029e <FLASH_IRQHandler>:
 800029e:	b480      	push	{r7}
 80002a0:	af00      	add	r7, sp, #0
 80002a2:	e7fe      	b.n	80002a2 <FLASH_IRQHandler+0x4>

080002a4 <RCC_IRQHandler>:
 80002a4:	b480      	push	{r7}
 80002a6:	af00      	add	r7, sp, #0
 80002a8:	e7fe      	b.n	80002a8 <RCC_IRQHandler+0x4>

080002aa <EXTI0_IRQHandler>:
 80002aa:	b480      	push	{r7}
 80002ac:	af00      	add	r7, sp, #0
 80002ae:	e7fe      	b.n	80002ae <EXTI0_IRQHandler+0x4>

080002b0 <EXTI1_IRQHandler>:
 80002b0:	b480      	push	{r7}
 80002b2:	af00      	add	r7, sp, #0
 80002b4:	e7fe      	b.n	80002b4 <EXTI1_IRQHandler+0x4>

080002b6 <EXTI2_TSC_IRQHandler>:
 80002b6:	b480      	push	{r7}
 80002b8:	af00      	add	r7, sp, #0
 80002ba:	e7fe      	b.n	80002ba <EXTI2_TSC_IRQHandler+0x4>

080002bc <EXTI3_IRQHandler>:
 80002bc:	b480      	push	{r7}
 80002be:	af00      	add	r7, sp, #0
 80002c0:	e7fe      	b.n	80002c0 <EXTI3_IRQHandler+0x4>

080002c2 <EXTI4_IRQHandler>:
 80002c2:	b480      	push	{r7}
 80002c4:	af00      	add	r7, sp, #0
 80002c6:	e7fe      	b.n	80002c6 <EXTI4_IRQHandler+0x4>

080002c8 <DMA1_Channel1_IRQHandler>:
 80002c8:	b480      	push	{r7}
 80002ca:	af00      	add	r7, sp, #0
 80002cc:	e7fe      	b.n	80002cc <DMA1_Channel1_IRQHandler+0x4>

080002ce <DMA1_Channel2_IRQHandler>:
 80002ce:	b480      	push	{r7}
 80002d0:	af00      	add	r7, sp, #0
 80002d2:	e7fe      	b.n	80002d2 <DMA1_Channel2_IRQHandler+0x4>

080002d4 <DMA1_Channel3_IRQHandler>:
 80002d4:	b480      	push	{r7}
 80002d6:	af00      	add	r7, sp, #0
 80002d8:	e7fe      	b.n	80002d8 <DMA1_Channel3_IRQHandler+0x4>

080002da <DMA1_Channel4_IRQHandler>:
 80002da:	b480      	push	{r7}
 80002dc:	af00      	add	r7, sp, #0
 80002de:	e7fe      	b.n	80002de <DMA1_Channel4_IRQHandler+0x4>

080002e0 <DMA1_Channel5_IRQHandler>:
 80002e0:	b480      	push	{r7}
 80002e2:	af00      	add	r7, sp, #0
 80002e4:	e7fe      	b.n	80002e4 <DMA1_Channel5_IRQHandler+0x4>

080002e6 <DMA1_Channel6_IRQHandler>:
 80002e6:	b480      	push	{r7}
 80002e8:	af00      	add	r7, sp, #0
 80002ea:	e7fe      	b.n	80002ea <DMA1_Channel6_IRQHandler+0x4>

080002ec <DMA1_Channel7_IRQHandler>:
 80002ec:	b480      	push	{r7}
 80002ee:	af00      	add	r7, sp, #0
 80002f0:	e7fe      	b.n	80002f0 <DMA1_Channel7_IRQHandler+0x4>

080002f2 <ADC1_2_IRQHandler>:
 80002f2:	b480      	push	{r7}
 80002f4:	af00      	add	r7, sp, #0
 80002f6:	e7fe      	b.n	80002f6 <ADC1_2_IRQHandler+0x4>

080002f8 <USB_HP_CAN_TX_IRQHandler>:
 80002f8:	b480      	push	{r7}
 80002fa:	af00      	add	r7, sp, #0
 80002fc:	e7fe      	b.n	80002fc <USB_HP_CAN_TX_IRQHandler+0x4>

080002fe <USB_LP_CAN_RX0_IRQHandler>:
 80002fe:	b480      	push	{r7}
 8000300:	af00      	add	r7, sp, #0
 8000302:	e7fe      	b.n	8000302 <USB_LP_CAN_RX0_IRQHandler+0x4>

08000304 <CAN_RX1_IRQHandler>:
 8000304:	b480      	push	{r7}
 8000306:	af00      	add	r7, sp, #0
 8000308:	e7fe      	b.n	8000308 <CAN_RX1_IRQHandler+0x4>

0800030a <CAN_SCE_IRQHandler>:
 800030a:	b480      	push	{r7}
 800030c:	af00      	add	r7, sp, #0
 800030e:	e7fe      	b.n	800030e <CAN_SCE_IRQHandler+0x4>

08000310 <EXTI9_5_IRQHandler>:
 8000310:	b480      	push	{r7}
 8000312:	af00      	add	r7, sp, #0
 8000314:	e7fe      	b.n	8000314 <EXTI9_5_IRQHandler+0x4>

08000316 <TIM1_BRK_TIM15_IRQHandler>:
 8000316:	b480      	push	{r7}
 8000318:	af00      	add	r7, sp, #0
 800031a:	e7fe      	b.n	800031a <TIM1_BRK_TIM15_IRQHandler+0x4>

0800031c <TIM1_UP_TIM16_IRQHandler>:
 800031c:	b480      	push	{r7}
 800031e:	af00      	add	r7, sp, #0
 8000320:	e7fe      	b.n	8000320 <TIM1_UP_TIM16_IRQHandler+0x4>

08000322 <TIM1_TRG_COM_TIM17_IRQHandler>:
 8000322:	b480      	push	{r7}
 8000324:	af00      	add	r7, sp, #0
 8000326:	e7fe      	b.n	8000326 <TIM1_TRG_COM_TIM17_IRQHandler+0x4>

08000328 <TIM1_CC_IRQHandler>:
 8000328:	b480      	push	{r7}
 800032a:	af00      	add	r7, sp, #0
 800032c:	e7fe      	b.n	800032c <TIM1_CC_IRQHandler+0x4>

0800032e <TIM2_IRQHandler>:
 800032e:	b480      	push	{r7}
 8000330:	af00      	add	r7, sp, #0
 8000332:	e7fe      	b.n	8000332 <TIM2_IRQHandler+0x4>

08000334 <TIM3_IRQHandler>:
 8000334:	b480      	push	{r7}
 8000336:	af00      	add	r7, sp, #0
 8000338:	e7fe      	b.n	8000338 <TIM3_IRQHandler+0x4>

0800033a <TIM4_IRQHandler>:
 800033a:	b480      	push	{r7}
 800033c:	af00      	add	r7, sp, #0
 800033e:	e7fe      	b.n	800033e <TIM4_IRQHandler+0x4>

08000340 <I2C1_EV_IRQHandler>:
 8000340:	b480      	push	{r7}
 8000342:	af00      	add	r7, sp, #0
 8000344:	e7fe      	b.n	8000344 <I2C1_EV_IRQHandler+0x4>

08000346 <I2C1_ER_IRQHandler>:
 8000346:	b480      	push	{r7}
 8000348:	af00      	add	r7, sp, #0
 800034a:	e7fe      	b.n	800034a <I2C1_ER_IRQHandler+0x4>

0800034c <I2C2_EV_IRQHandler>:
 800034c:	b480      	push	{r7}
 800034e:	af00      	add	r7, sp, #0
 8000350:	e7fe      	b.n	8000350 <I2C2_EV_IRQHandler+0x4>

08000352 <I2C2_ER_IRQHandler>:
 8000352:	b480      	push	{r7}
 8000354:	af00      	add	r7, sp, #0
 8000356:	e7fe      	b.n	8000356 <I2C2_ER_IRQHandler+0x4>

08000358 <SPI1_IRQHandler>:
 8000358:	b480      	push	{r7}
 800035a:	af00      	add	r7, sp, #0
 800035c:	e7fe      	b.n	800035c <SPI1_IRQHandler+0x4>

0800035e <SPI2_IRQHandler>:
 800035e:	b480      	push	{r7}
 8000360:	af00      	add	r7, sp, #0
 8000362:	e7fe      	b.n	8000362 <SPI2_IRQHandler+0x4>

08000364 <USART1_IRQHandler>:
 8000364:	b480      	push	{r7}
 8000366:	af00      	add	r7, sp, #0
 8000368:	e7fe      	b.n	8000368 <USART1_IRQHandler+0x4>

0800036a <USART2_IRQHandler>:
 800036a:	b480      	push	{r7}
 800036c:	af00      	add	r7, sp, #0
 800036e:	e7fe      	b.n	800036e <USART2_IRQHandler+0x4>

08000370 <USART3_IRQHandler>:
 8000370:	b480      	push	{r7}
 8000372:	af00      	add	r7, sp, #0
 8000374:	e7fe      	b.n	8000374 <USART3_IRQHandler+0x4>

08000376 <EXTI15_10_IRQHandler>:
 8000376:	b480      	push	{r7}
 8000378:	af00      	add	r7, sp, #0
 800037a:	e7fe      	b.n	800037a <EXTI15_10_IRQHandler+0x4>

0800037c <RTC_Alarm_IRQHandler>:
 800037c:	b480      	push	{r7}
 800037e:	af00      	add	r7, sp, #0
 8000380:	e7fe      	b.n	8000380 <RTC_Alarm_IRQHandler+0x4>

08000382 <USBWakeUp_IRQHandler>:
 8000382:	b480      	push	{r7}
 8000384:	af00      	add	r7, sp, #0
 8000386:	e7fe      	b.n	8000386 <USBWakeUp_IRQHandler+0x4>

08000388 <TIM8_BRK_IRQHandler>:
 8000388:	b480      	push	{r7}
 800038a:	af00      	add	r7, sp, #0
 800038c:	e7fe      	b.n	800038c <TIM8_BRK_IRQHandler+0x4>

0800038e <TIM8_UP_IRQHandler>:
 800038e:	b480      	push	{r7}
 8000390:	af00      	add	r7, sp, #0
 8000392:	e7fe      	b.n	8000392 <TIM8_UP_IRQHandler+0x4>

08000394 <TIM8_TRG_COM_IRQHandler>:
 8000394:	b480      	push	{r7}
 8000396:	af00      	add	r7, sp, #0
 8000398:	e7fe      	b.n	8000398 <TIM8_TRG_COM_IRQHandler+0x4>

0800039a <TIM8_CC_IRQHandler>:
 800039a:	b480      	push	{r7}
 800039c:	af00      	add	r7, sp, #0
 800039e:	e7fe      	b.n	800039e <TIM8_CC_IRQHandler+0x4>

080003a0 <ADC3_IRQHandler>:
 80003a0:	b480      	push	{r7}
 80003a2:	af00      	add	r7, sp, #0
 80003a4:	e7fe      	b.n	80003a4 <ADC3_IRQHandler+0x4>

080003a6 <SPI3_IRQHandler>:
 80003a6:	b480      	push	{r7}
 80003a8:	af00      	add	r7, sp, #0
 80003aa:	e7fe      	b.n	80003aa <SPI3_IRQHandler+0x4>

080003ac <UART4_IRQHandler>:
 80003ac:	b480      	push	{r7}
 80003ae:	af00      	add	r7, sp, #0
 80003b0:	e7fe      	b.n	80003b0 <UART4_IRQHandler+0x4>

080003b2 <UART5_IRQHandler>:
 80003b2:	b480      	push	{r7}
 80003b4:	af00      	add	r7, sp, #0
 80003b6:	e7fe      	b.n	80003b6 <UART5_IRQHandler+0x4>

080003b8 <TIM6_DAC_IRQHandler>:
 80003b8:	b480      	push	{r7}
 80003ba:	af00      	add	r7, sp, #0
 80003bc:	e7fe      	b.n	80003bc <TIM6_DAC_IRQHandler+0x4>

080003be <TIM7_IRQHandler>:
 80003be:	b480      	push	{r7}
 80003c0:	af00      	add	r7, sp, #0
 80003c2:	e7fe      	b.n	80003c2 <TIM7_IRQHandler+0x4>

080003c4 <DMA2_Channel1_IRQHandler>:
 80003c4:	b480      	push	{r7}
 80003c6:	af00      	add	r7, sp, #0
 80003c8:	e7fe      	b.n	80003c8 <DMA2_Channel1_IRQHandler+0x4>

080003ca <DMA2_Channel2_IRQHandler>:
 80003ca:	b480      	push	{r7}
 80003cc:	af00      	add	r7, sp, #0
 80003ce:	e7fe      	b.n	80003ce <DMA2_Channel2_IRQHandler+0x4>

080003d0 <DMA2_Channel3_IRQHandler>:
 80003d0:	b480      	push	{r7}
 80003d2:	af00      	add	r7, sp, #0
 80003d4:	e7fe      	b.n	80003d4 <DMA2_Channel3_IRQHandler+0x4>

080003d6 <DMA2_Channel4_IRQHandler>:
 80003d6:	b480      	push	{r7}
 80003d8:	af00      	add	r7, sp, #0
 80003da:	e7fe      	b.n	80003da <DMA2_Channel4_IRQHandler+0x4>

080003dc <DMA2_Channel5_IRQHandler>:
 80003dc:	b480      	push	{r7}
 80003de:	af00      	add	r7, sp, #0
 80003e0:	e7fe      	b.n	80003e0 <DMA2_Channel5_IRQHandler+0x4>

080003e2 <ADC4_IRQHandler>:
 80003e2:	b480      	push	{r7}
 80003e4:	af00      	add	r7, sp, #0
 80003e6:	e7fe      	b.n	80003e6 <ADC4_IRQHandler+0x4>

080003e8 <COMP1_2_3_IRQHandler>:
 80003e8:	b480      	push	{r7}
 80003ea:	af00      	add	r7, sp, #0
 80003ec:	e7fe      	b.n	80003ec <COMP1_2_3_IRQHandler+0x4>

080003ee <COMP4_5_6_IRQHandler>:
 80003ee:	b480      	push	{r7}
 80003f0:	af00      	add	r7, sp, #0
 80003f2:	e7fe      	b.n	80003f2 <COMP4_5_6_IRQHandler+0x4>

080003f4 <COMP7_IRQHandler>:
 80003f4:	b480      	push	{r7}
 80003f6:	af00      	add	r7, sp, #0
 80003f8:	e7fe      	b.n	80003f8 <COMP7_IRQHandler+0x4>

080003fa <USB_HP_IRQHandler>:
 80003fa:	b480      	push	{r7}
 80003fc:	af00      	add	r7, sp, #0
 80003fe:	e7fe      	b.n	80003fe <USB_HP_IRQHandler+0x4>

08000400 <USB_LP_IRQHandler>:
 8000400:	b480      	push	{r7}
 8000402:	af00      	add	r7, sp, #0
 8000404:	e7fe      	b.n	8000404 <USB_LP_IRQHandler+0x4>

08000406 <USBWakeUp_RMP_IRQHandler>:
 8000406:	b480      	push	{r7}
 8000408:	af00      	add	r7, sp, #0
 800040a:	e7fe      	b.n	800040a <USBWakeUp_RMP_IRQHandler+0x4>

0800040c <FPU_IRQHandler>:
 800040c:	b480      	push	{r7}
 800040e:	af00      	add	r7, sp, #0
 8000410:	e7fe      	b.n	8000410 <FPU_IRQHandler+0x4>
	...

08000414 <Reset_Handler>:
 8000414:	f8df d034 	ldr.w	sp, [pc, #52]	; 800044c <LoopForever+0x2>
 8000418:	f7ff feb6 	bl	8000188 <SystemInit>
 800041c:	480c      	ldr	r0, [pc, #48]	; (8000450 <LoopForever+0x6>)
 800041e:	490d      	ldr	r1, [pc, #52]	; (8000454 <LoopForever+0xa>)
 8000420:	4a0d      	ldr	r2, [pc, #52]	; (8000458 <LoopForever+0xe>)
 8000422:	2300      	movs	r3, #0
 8000424:	e002      	b.n	800042c <LoopCopyDataInit>

08000426 <CopyDataInit>:
 8000426:	58d4      	ldr	r4, [r2, r3]
 8000428:	50c4      	str	r4, [r0, r3]
 800042a:	3304      	adds	r3, #4

0800042c <LoopCopyDataInit>:
 800042c:	18c4      	adds	r4, r0, r3
 800042e:	428c      	cmp	r4, r1
 8000430:	d3f9      	bcc.n	8000426 <CopyDataInit>
 8000432:	4a0a      	ldr	r2, [pc, #40]	; (800045c <LoopForever+0x12>)
 8000434:	4c0a      	ldr	r4, [pc, #40]	; (8000460 <LoopForever+0x16>)
 8000436:	2300      	movs	r3, #0
 8000438:	e001      	b.n	800043e <LoopFillZerobss>

0800043a <FillZerobss>:
 800043a:	6013      	str	r3, [r2, #0]
 800043c:	3204      	adds	r2, #4

0800043e <LoopFillZerobss>:
 800043e:	42a2      	cmp	r2, r4
 8000440:	d3fb      	bcc.n	800043a <FillZerobss>
 8000442:	f000 f81d 	bl	8000480 <__libc_init_array>
 8000446:	f7ff feb1 	bl	80001ac <main>

0800044a <LoopForever>:
 800044a:	e7fe      	b.n	800044a <LoopForever>
 800044c:	20008000 	.word	0x20008000
 8000450:	20000000 	.word	0x20000000
 8000454:	20000000 	.word	0x20000000
 8000458:	080004c8 	.word	0x080004c8
 800045c:	20000000 	.word	0x20000000
 8000460:	20000000 	.word	0x20000000

08000464 <_init>:
 8000464:	b480      	push	{r7}
 8000466:	af00      	add	r7, sp, #0
 8000468:	bf00      	nop
 800046a:	46bd      	mov	sp, r7
 800046c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000470:	4770      	bx	lr

08000472 <_fini>:
 8000472:	b480      	push	{r7}
 8000474:	af00      	add	r7, sp, #0
 8000476:	bf00      	nop
 8000478:	46bd      	mov	sp, r7
 800047a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800047e:	4770      	bx	lr

08000480 <__libc_init_array>:
 8000480:	b570      	push	{r4, r5, r6, lr}
 8000482:	4e0d      	ldr	r6, [pc, #52]	; (80004b8 <__libc_init_array+0x38>)
 8000484:	4d0d      	ldr	r5, [pc, #52]	; (80004bc <__libc_init_array+0x3c>)
 8000486:	1b76      	subs	r6, r6, r5
 8000488:	10b6      	asrs	r6, r6, #2
 800048a:	d006      	beq.n	800049a <__libc_init_array+0x1a>
 800048c:	2400      	movs	r4, #0
 800048e:	f855 3b04 	ldr.w	r3, [r5], #4
 8000492:	3401      	adds	r4, #1
 8000494:	4798      	blx	r3
 8000496:	42a6      	cmp	r6, r4
 8000498:	d1f9      	bne.n	800048e <__libc_init_array+0xe>
 800049a:	4e09      	ldr	r6, [pc, #36]	; (80004c0 <__libc_init_array+0x40>)
 800049c:	4d09      	ldr	r5, [pc, #36]	; (80004c4 <__libc_init_array+0x44>)
 800049e:	1b76      	subs	r6, r6, r5
 80004a0:	f7ff ffe0 	bl	8000464 <_init>
 80004a4:	10b6      	asrs	r6, r6, #2
 80004a6:	d006      	beq.n	80004b6 <__libc_init_array+0x36>
 80004a8:	2400      	movs	r4, #0
 80004aa:	f855 3b04 	ldr.w	r3, [r5], #4
 80004ae:	3401      	adds	r4, #1
 80004b0:	4798      	blx	r3
 80004b2:	42a6      	cmp	r6, r4
 80004b4:	d1f9      	bne.n	80004aa <__libc_init_array+0x2a>
 80004b6:	bd70      	pop	{r4, r5, r6, pc}
 80004b8:	080004c8 	.word	0x080004c8
 80004bc:	080004c8 	.word	0x080004c8
 80004c0:	080004c8 	.word	0x080004c8
 80004c4:	080004c8 	.word	0x080004c8
