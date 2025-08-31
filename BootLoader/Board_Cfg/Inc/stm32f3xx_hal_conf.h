
/**
  ******************************************************************************
  * @file           : stm32f3xx_hal_conf.h
  * @brief          : Header for stm32f3xx_hal_conf.c file.
  *
  ******************************************************************************
  * @attention This software is developed by Fabian Donchór
  * email: fabian.donchor@gmail.com
  * All rights reserved.
  ******************************************************************************
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM32F3xx_HAL_CONF_H
#define __STM32F3xx_HAL_CONF_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>

/* Exported definitions ------------------------------------------------------*/
#define HAL_MODULE_ENABLED
#define HAL_GPIO_MODULE_ENABLED
#define HAL_EXTI_MODULE_ENABLED
#define HAL_RCC_MODULE_ENABLED
#define HAL_CORTEX_MODULE_ENABLED
#define HAL_FLASH_MODULE_ENABLED
#define HAL_PWR_MODULE_ENABLED
#define HAL_TIM_MODULE_ENABLED
#define HAL_DMA_MODULE_ENABLED
#define HAL_UART_MODULE_ENABLED

/* Oscillator timeouts */
#define HSE_STARTUP_TIMEOUT             ((uint32_t)100)             /* 100 ms */
#define LSE_STARTUP_TIMEOUT             ((uint32_t)5000)            /* 5 s */

/* Default oscillator values for STM32F303CBT7 */
#define HSE_VALUE                       ((uint32_t)8000000)   /* 8 MHz external crystal */
#define HSI_VALUE                       ((uint32_t)8000000)   /* 8 MHz internal RC */
#define HSI48_VALUE                     ((uint32_t)48000000)  /* 48 MHz internal oscillator, USB/SDIO */
#define LSI_VALUE                       ((uint32_t)40000)     /* ~40 kHz internal low-speed RC */
#define LSE_VALUE                       ((uint32_t)32768)     /* 32.768 kHz external low-speed crystal */

#define VDD_VALUE                       ((uint32_t)3300)   /* [mV] */
#define TICK_INT_PRIORITY               0
#define USE_RTOS                        0
#define PREFETCH_ENABLE                 1

/* Peripherals */
#define USE_SPI_CRC                     0

/* Exported includes --------------------------------------------------------*/
#include "stm32f3xx_hal_def.h"
#include "stm32f3xx_hal_cortex.h"
#include "stm32f3xx_hal_gpio.h"
#include "stm32f3xx_hal_gpio_ex.h"
#include "stm32f3xx_hal_exti.h"
#include "stm32f3xx_hal_rcc.h"
#include "stm32f3xx_hal_rcc_ex.h"
#include "stm32f3xx_hal_flash.h"
#include "stm32f3xx_hal_pwr.h"
#include "stm32f3xx_hal_dma.h"
#include "stm32f3xx_hal_dma_ex.h"
#include "stm32f3xx_hal_tim.h"
#include "stm32f3xx_hal_tim_ex.h"
#include "stm32f3xx_hal_uart.h"
#include "stm32f3xx_hal_uart_ex.h"

#include "stm32f3xx_hal.h"


/* Assert macro (optional but recommended in debug) -------------------------*/
#ifdef  USE_FULL_ASSERT
#include "assert.h"
#define assert_param(expr) ((expr) ? (void)0U : assert_failed((uint8_t *)__FILE__, __LINE__))
#else
#define assert_param(expr) ((void)0U)
#endif /* USE_FULL_ASSERT */

#endif /* __STM32F3xx_HAL_CONF_H */
