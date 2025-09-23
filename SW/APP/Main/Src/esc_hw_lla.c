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
extern TIM_HandleTypeDef htim1;
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

/**
 * @brief ESC_HW_LLA__SetBldcStep()
 */
void ESC_HW_LLA__SetBldcStep(ESC_HW_LLA__BLDC_STEP_t bldc_step, uint8_t percentage_power)
{
   uint32_t tim_arr_value = __HAL_TIM_GET_AUTORELOAD(&htim1);
   uint32_t percentage_duty;

   HAL_TIM_PWM_Stop(&htim1, TIM_CHANNEL_1);
   HAL_TIMEx_PWMN_Stop(&htim1, TIM_CHANNEL_1);
   HAL_TIM_PWM_Stop(&htim1, TIM_CHANNEL_2);
   HAL_TIMEx_PWMN_Stop(&htim1, TIM_CHANNEL_2);
   HAL_TIM_PWM_Stop(&htim1, TIM_CHANNEL_3);
   HAL_TIMEx_PWMN_Stop(&htim1, TIM_CHANNEL_3);

   if (percentage_power > 100)
   {
      percentage_power = 100;
   }

   percentage_duty = ((uint32_t)tim_arr_value * (uint32_t)percentage_power) / 100U;

   switch (bldc_step)
   {
      case ESC_HW_LLA__BLDC_STEP_1:
      {
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, percentage_duty); /* AH % duty */
         HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);                      /* PWM on AH */
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);               /* BL ON without PWM */
         HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);                   /* BL */
         break;
      }
      case ESC_HW_LLA__BLDC_STEP_2:
      {
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, percentage_duty); /* AH % duty */
         HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);                      /* PWM on AH */
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);               /* CL ON without PWM */
         HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);                   /* CL */
         break;
      }
      case ESC_HW_LLA__BLDC_STEP_3:
      {
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, percentage_duty); /* BH % duty */
         HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);                      /* PWM on BH */
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);               /* CL ON without PWM */
         HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);                   /* CL */
         break;
      }
      case ESC_HW_LLA__BLDC_STEP_4:
      {
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, percentage_duty); /* BH % duty */
         HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);                      /* PWM on BH */
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);               /* AL ON without PWM */
         HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);                   /* AL */
         break;
      }
      case ESC_HW_LLA__BLDC_STEP_5:
      {
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, percentage_duty); /* CH % duty */
         HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);                      /* PWM on CH */
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);               /* AL ON without PWM */
         HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);                   /* AL */
         break;
      }
      case ESC_HW_LLA__BLDC_STEP_6:
      {
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, percentage_duty); /* CH % duty */
         HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);                      /* PWM on CH */
         __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);               /* BL ON without PWM */
         HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);                   /* BL */
         break;
      }
      default:
         break;
   }
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

HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);
HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);
HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);

*/