/**
 ******************************************************************************
 * @file           : board_cfg.c
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

/* Private macro -------------------------------------------------------------*/

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
static TIM_HandleTypeDef htim1;

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void GPIO_Init(void);
static void OPAMP4_Init(void);
static void ADC4_Init(void);
static void TIM1_Trig_Init(uint16_t sample_shift_ticks);
static void Error_Handler(void);

/* Private function ----------------------------------------------------------*/
/**
 * @brief SystemClock_Config
 *
 * @param  None
 * @retval None
 */
static void SystemClock_Config(void)
{
   RCC_OscInitTypeDef RCC_OscInitStruct = {0};
   RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
   RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

   /** Initializes the RCC Oscillators according to the specified parameters
    * in the RCC_OscInitTypeDef structure.
    */
   RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
   RCC_OscInitStruct.HSEState = RCC_HSE_ON;
   RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
   RCC_OscInitStruct.HSIState = RCC_HSI_ON;
   RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
   RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
   RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
   if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
   {
      Error_Handler();
   }

   /** Initializes the CPU, AHB and APB buses clocks
    */
   RCC_ClkInitStruct.ClockType =
       RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
   RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
   RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
   RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
   RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

   if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
   {
      Error_Handler();
   }
   PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1 | RCC_PERIPHCLK_TIM1;
   PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_SYSCLK;
   PeriphClkInit.Tim1ClockSelection = RCC_TIM1CLK_PLLCLK;
   if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
   {
      Error_Handler();
   }

   /** Enables the Clock Security System
    */
   HAL_RCC_EnableCSS();
}

/**
 * @brief GPIO_Init
 *
 * @param  None
 * @retval None
 */
static void GPIO_Init(void)
{
   GPIO_InitTypeDef GPIO_InitStruct = {0};

   __HAL_RCC_GPIOA_CLK_ENABLE();
   __HAL_RCC_GPIOB_CLK_ENABLE();
   __HAL_RCC_GPIOC_CLK_ENABLE();
   __HAL_RCC_GPIOF_CLK_ENABLE();

   /* Configure ESC LED as output with open dren mode */
   GPIO_InitStruct.Pin = ESC_LED_STATUS_GPIO_PIN;
   GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   GPIO_InitStruct.Pull = GPIO_NOPULL;
   GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   HAL_GPIO_WritePin(ESC_LED_STATUS_GPIO_PORT, ESC_LED_STATUS_GPIO_PIN, GPIO_PIN_RESET);
   HAL_GPIO_Init(ESC_LED_STATUS_GPIO_PORT, &GPIO_InitStruct);

   /* Configure pin for VBUS */
   GPIO_InitStruct.Pin = ESC_VBUS_GPIO_PIN;
   GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
   GPIO_InitStruct.Pull = GPIO_NOPULL;
   HAL_GPIO_Init(ESC_VBUS_GPIO_PORT, &GPIO_InitStruct);
}

static void OPAMP4_Init(void)
{
   OPAMP_HandleTypeDef hopamp4 = {0};

   __HAL_RCC_SYSCFG_CLK_ENABLE();

   hopamp4.Instance = OPAMP4;
   hopamp4.Init.Mode = OPAMP_FOLLOWER_MODE;
   hopamp4.Init.NonInvertingInput = OPAMP_NONINVERTINGINPUT_IO0;
   hopamp4.Init.TimerControlledMuxmode = OPAMP_TIMERCONTROLLEDMUXMODE_DISABLE;
   hopamp4.Init.UserTrimming = OPAMP_TRIMMING_FACTORY;

   HAL_OPAMP_Init(&hopamp4);
   HAL_OPAMP_SelfCalibrate(&hopamp4);
   HAL_OPAMP_Start(&hopamp4);
}

/**
 * @brief ADC4_Init
 *
 */
static void ADC4_Init(void)
{
   ADC_HandleTypeDef hadc4;
   ADC_InjectionConfTypeDef hInjeConf = {0};

   __HAL_RCC_ADC34_CLK_ENABLE();

   hadc4.Instance = ADC4;
   hadc4.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
   hadc4.Init.Resolution = ADC_RESOLUTION_12B;
   hadc4.Init.DataAlign = ADC_DATAALIGN_RIGHT;
   hadc4.Init.ScanConvMode = ADC_SCAN_DISABLE;
   hadc4.Init.ContinuousConvMode = DISABLE;
   hadc4.Init.Overrun = ADC_OVR_DATA_OVERWRITTEN;
   HAL_ADC_Init(&hadc4);
   HAL_ADCEx_Calibration_Start(&hadc4, ADC_SINGLE_ENDED);

   hInjeConf.InjectedChannel = ADC_CHANNEL_3;
   hInjeConf.InjectedRank = ADC_INJECTED_RANK_1;
   hInjeConf.InjectedSamplingTime = ADC_SAMPLETIME_181CYCLES_5;
   hInjeConf.InjectedSingleDiff = ADC_SINGLE_ENDED;
   hInjeConf.ExternalTrigInjecConvEdge = ADC_EXTERNALTRIGINJECCONV_EDGE_RISING;
   hInjeConf.ExternalTrigInjecConv = ADC_EXTERNALTRIGINJECCONV_T1_CC4;
   HAL_ADCEx_InjectedConfigChannel(&hadc4, &hInjeConf);

   HAL_ADCEx_InjectedStart(&hadc4);
}

/**
 * @brief VBUS_TIM1_Trig_Init
 *
 * @param  None
 * @retval None
 */
static void TIM1_Trig_Init(uint16_t sample_shift_ticks)
{
   TIM_OC_InitTypeDef s = {0};

   s.OCMode = TIM_OCMODE_TOGGLE;
   s.Pulse = (__HAL_TIM_GET_AUTORELOAD(&htim1) / 2U) + sample_shift_ticks;
   s.OCPolarity = TIM_OCPOLARITY_HIGH;

   HAL_TIM_OC_ConfigChannel(&htim1, &s, TIM_CHANNEL_4);
   HAL_TIM_OC_Start(&htim1, TIM_CHANNEL_4);
}

/**
 * @brief Error_Handler
 *
 * @param  None
 * @retval None
 */
static void Error_Handler(void)
{
   __disable_irq();
   while (1)
   {
   }
}

/* Exported function ----------------------------------------------------------*/

/**
 * @brief ECU_HW_Init
 *
 * @param  None
 * @retval None
 */
void ECU_HW_Init(void)
{
   HAL_Init();
   SystemClock_Config();

   GPIO_Init();
   OPAMP4_Init();
   ADC4_Init();
   TIM1_Trig_Init(1);
}
