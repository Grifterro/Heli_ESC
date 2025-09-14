/**
 ******************************************************************************
 * @file           : esc_hw_lla.c
 * @brief          :
 *
 ******************************************************************************
 * @attention This software has been developed by Fabian Donchór since 2025.
 * email: fabian.donchor@gmail.com
 * All rights reserved.
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include <stdbool.h>

/* Private includes ----------------------------------------------------------*/
#include "board_cfg.h"
#include "esc_hw_lla.h"

/* Private macro -------------------------------------------------------------*/

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private function ----------------------------------------------------------*/

/**
 * @brief Error_Handler
 *
 * @param  None
 * @retval None
 */

/* Exported function ----------------------------------------------------------*/
/**
 * @brief
 */
void ESC_HW_LLA__SetEscLedSts(ESC_HW_LLA__GPIO_PinState PinState)
{
   HAL_GPIO_WritePin(ESC_LED_STATUS_GPIO_PORT, ESC_LED_STATUS_GPIO_PIN, PinState);
}

/* ToDo */
/*void VBusWhenPWMoff(void)
{
   hadc4.Init.ContinuousConvMode = ENABLE;
   hadc4.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
   HAL_ADC_Init(&hadc4);
   HAL_ADC_Start_DMA(&hadc4, (uint32_t*)vBusDMA_Buffer, LEN);
}*/

/* główny switch włączający PWM na wyjściach
__HAL_TIM_MOE_ENABLE(&htim1);
__HAL_TIM_MOE_DISABLE(&htim1);
*/

/* ustawienie wartości PWM
uint32_t arr = __HAL_TIM_GET_AUTORELOAD(&htim1);
__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, arr/2); // ~50% duty
*/

/*
HAL_TIM_PWM_Stop
*/