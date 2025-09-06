/**
  ******************************************************************************
  * @file           : stm32f3xx_it.h
  * @brief          : 
  *
  ******************************************************************************
  * @attention This software is developed by Fabian Donchór
  * Copyright (c) 2025 Flytronic.
  * All rights reserved.
  ******************************************************************************
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM32F3xx_IT_H
#define __STM32F3xx_IT_H

/* Includes ------------------------------------------------------------------*/

/* Private includes ----------------------------------------------------------*/

/* Exported macro ------------------------------------------------------------*/

/* Exported definitions ------------------------------------------------------*/

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported variables --------------------------------------------------------*/

/* Exported functions prototypes ---------------------------------------------*/
/**
  * @brief .
  * @param  None
  * @retval None
*/
void NMI_Handler_APP(void);
void HardFault_Handler_APP(void);
void MemManage_Handler_APP(void);
void BusFault_Handler_APP(void);
void UsageFault_Handler_APP(void);
void DebugMon_Handler_APP(void);

#endif /* __STM32F3xx_IT_H */
