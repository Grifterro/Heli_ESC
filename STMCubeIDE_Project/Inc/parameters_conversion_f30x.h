
/**
  ******************************************************************************
  * @file    parameters_conversion_f30x.h
  * @author  Motor Control SDK Team, ST Microelectronics
  * @brief   This file contains the definitions needed to convert MC SDK parameters
  *          so as to target the STM32F3 Family.
  *
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PARAMETERS_CONVERSION_F30X_H
#define __PARAMETERS_CONVERSION_F30X_H

/************************* CPU & ADC PERIPHERAL CLOCK CONFIG ******************/
#define SYSCLK_FREQ                      72000000uL
#define TIM_CLOCK_DIVIDER                1
#define ADV_TIM_CLK_MHz                  144 /* Actual TIM clk including Timer clock divider*/
#define ADC_CLK_MHz                      72
#define HALL_TIM_CLK                     72000000uL
#define APB1TIM_FREQ                     72000000uL

/*************************  IRQ Handler Mapping  *********************/
#define TIMx_BRK_M1_IRQHandler           TIM1_BRK_TIM15_IRQHandler

#define BEMF_ADC4_READING_IRQHandler     ADC4_IRQHandler

#define PERIOD_COMM_IRQHandler           TIM2_IRQHandler

/*************************  ADC Physical characteristics  *********************/
#define ADC_TRIG_CONV_LATENCY_CYCLES     3.5
#define ADC_SAR_CYCLES                   13u

#define M1_VBUS_SW_FILTER_BW_FACTOR      6u

/* USER CODE BEGIN Additional parameters */

/* USER CODE END Additional parameters */

#endif /*__PARAMETERS_CONVERSION_F30X_H*/

/******************* (C) COPYRIGHT 2025 STMicroelectronics *****END OF FILE****/
