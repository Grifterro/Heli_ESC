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
ADC_HandleTypeDef hadc4;
DMA_HandleTypeDef hdma_adc4;
OPAMP_HandleTypeDef hopamp4;

extern uint32_t vBusDMA_Buffer[ESC_VBUS_DMA_BUFFER_LENGTH];

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void GPIO_Init(void);
static void OPAMP_Init(void);
static void ADC_Init(void);
static void DMA_Init(void);
static void DMA_LinkADC_Init(ADC_HandleTypeDef* hadc);
static void TIM1_Init(void);
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
   PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC34;
   PeriphClkInit.Adc34ClockSelection = RCC_ADC34PLLCLK_DIV1;
   if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
   {
      Error_Handler();
   }
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

   /* TIM1 GPIO Configuration
    PB1     ------> TIM1_CH3N
    PA8     ------> TIM1_CH1
    PA9     ------> TIM1_CH2
    PA10     ------> TIM1_CH3
    PA11     ------> TIM1_CH1N
    PA12     ------> TIM1_CH2N
    */
   GPIO_InitStruct.Pin = GPIO_PIN_1;
   GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   GPIO_InitStruct.Pull = GPIO_NOPULL;
   GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
   GPIO_InitStruct.Alternate = GPIO_AF6_TIM1;
   HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

   GPIO_InitStruct.Pin = GPIO_PIN_8 | GPIO_PIN_9 | GPIO_PIN_10 | GPIO_PIN_11 | GPIO_PIN_12;
   GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   GPIO_InitStruct.Pull = GPIO_NOPULL;
   GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
   GPIO_InitStruct.Alternate = GPIO_AF6_TIM1;
   HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

static void OPAMP_Init(void)
{
   hopamp4.Instance = OPAMP4;
   hopamp4.Init.Mode = OPAMP_FOLLOWER_MODE;
   hopamp4.Init.NonInvertingInput = OPAMP_NONINVERTINGINPUT_IO0;
   hopamp4.Init.TimerControlledMuxmode = OPAMP_TIMERCONTROLLEDMUXMODE_DISABLE;
   hopamp4.Init.UserTrimming = OPAMP_TRIMMING_FACTORY;
   if (HAL_OPAMP_Init(&hopamp4) != HAL_OK)
   {
      Error_Handler();
   }

   HAL_OPAMP_SelfCalibrate(&hopamp4);
   HAL_OPAMP_Start(&hopamp4);
}

/**
 * @brief ADC_Init
 *
 */
static void ADC_Init(void)
{
   ADC_ChannelConfTypeDef sConfig = {0};

   __HAL_RCC_ADC34_CLK_ENABLE();

   hadc4.Instance = ADC4;
   hadc4.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
   hadc4.Init.Resolution = ADC_RESOLUTION_12B;
   hadc4.Init.ScanConvMode = ADC_SCAN_DISABLE;
   hadc4.Init.ContinuousConvMode = DISABLE;
   hadc4.Init.DiscontinuousConvMode = DISABLE;
   hadc4.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
   hadc4.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T1_TRGO2;
   hadc4.Init.DataAlign = ADC_DATAALIGN_RIGHT;
   hadc4.Init.NbrOfConversion = 1;
   hadc4.Init.DMAContinuousRequests = ENABLE;
   hadc4.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
   hadc4.Init.LowPowerAutoWait = DISABLE;
   hadc4.Init.Overrun = ADC_OVR_DATA_OVERWRITTEN;
   if (HAL_ADC_Init(&hadc4) != HAL_OK)
   {
      Error_Handler();
   }

   HAL_ADCEx_Calibration_Start(&hadc4, ADC_SINGLE_ENDED);

   sConfig.Channel = ADC_CHANNEL_3;
   sConfig.Rank = ADC_REGULAR_RANK_1;
   sConfig.SingleDiff = ADC_SINGLE_ENDED;
   sConfig.SamplingTime = ADC_SAMPLETIME_181CYCLES_5;
   sConfig.OffsetNumber = ADC_OFFSET_NONE;
   sConfig.Offset = 0;
   if (HAL_ADC_ConfigChannel(&hadc4, &sConfig) != HAL_OK)
   {
      Error_Handler();
   }
}

static void DMA_LinkADC_Init(ADC_HandleTypeDef* hadc)
{
   if (hadc->Instance == ADC4)
   {
      __HAL_RCC_ADC34_CLK_ENABLE();
      hdma_adc4.Instance = DMA2_Channel2;
      hdma_adc4.Init.Direction = DMA_PERIPH_TO_MEMORY;
      hdma_adc4.Init.PeriphInc = DMA_PINC_DISABLE;
      hdma_adc4.Init.MemInc = DMA_MINC_ENABLE;
      hdma_adc4.Init.PeriphDataAlignment = DMA_PDATAALIGN_HALFWORD;
      hdma_adc4.Init.MemDataAlignment = DMA_MDATAALIGN_HALFWORD;
      hdma_adc4.Init.Mode = DMA_CIRCULAR;
      hdma_adc4.Init.Priority = DMA_PRIORITY_LOW;
      if (HAL_DMA_Init(&hdma_adc4) != HAL_OK)
      {
         Error_Handler();
      }

      __HAL_LINKDMA(hadc, DMA_Handle, hdma_adc4);
   }
}

static void DMA_Init(void)
{
   __HAL_RCC_DMA2_CLK_ENABLE();

   HAL_NVIC_SetPriority(DMA2_Channel2_IRQn, 0, 0);
   HAL_NVIC_EnableIRQ(DMA2_Channel2_IRQn);
}

static void TIM1_Init(void)
{
   TIM_ClockConfigTypeDef sClockSourceConfig = {0};
   TIM_MasterConfigTypeDef sMasterConfig = {0};
   TIM_OC_InitTypeDef sConfigOC = {0};
   TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

   htim1.Instance = TIM1;
   htim1.Init.Prescaler = 0;
   htim1.Init.CounterMode = TIM_COUNTERMODE_CENTERALIGNED1;
   htim1.Init.Period = 2999;
   htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
   htim1.Init.RepetitionCounter = 0;
   htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
   if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
   {
      Error_Handler();
   }
   sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
   if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
   {
      Error_Handler();
   }
   if (HAL_TIM_PWM_Init(&htim1) != HAL_OK)
   {
      Error_Handler();
   }
   sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
   sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_OC4REF;
   sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
   if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
   {
      Error_Handler();
   }
   sConfigOC.OCMode = TIM_OCMODE_PWM1;
   sConfigOC.Pulse = 0;
   sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
   sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
   sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
   sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
   sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
   if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
   {
      Error_Handler();
   }
   if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
   {
      Error_Handler();
   }
   if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
   {
      Error_Handler();
   }

   __HAL_TIM_ENABLE_OCxPRELOAD(&htim1, TIM_CHANNEL_1);
   __HAL_TIM_ENABLE_OCxPRELOAD(&htim1, TIM_CHANNEL_2);
   __HAL_TIM_ENABLE_OCxPRELOAD(&htim1, TIM_CHANNEL_3);

   sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
   sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
   sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
   sBreakDeadTimeConfig.DeadTime = 36;  // ~0.5 µs @ 72 MHz
   sBreakDeadTimeConfig.BreakState = TIM_BREAK_ENABLE;
   sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
   sBreakDeadTimeConfig.BreakFilter = 4;
   sBreakDeadTimeConfig.Break2State = TIM_BREAK2_DISABLE;
   sBreakDeadTimeConfig.Break2Polarity = TIM_BREAK2POLARITY_HIGH;
   sBreakDeadTimeConfig.Break2Filter = 0;
   sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_ENABLE;
   if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
   {
      Error_Handler();
   }

   HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
   HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);
   HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
   HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);
   HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
   HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);

   /* CCR4 as triger for ADC in half CCR1/2/3 */
   /* Set comparison at half ARR (mid-term) */
   __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, (__HAL_TIM_GET_AUTORELOAD(&htim1) + 1U) / 2U);

   /* Channel 4 configuration in TIMING mode (no pin output, only CC event) */
   sConfigOC.OCMode = TIM_OCMODE_TIMING;
   sConfigOC.Pulse = (__HAL_TIM_GET_AUTORELOAD(&htim1) + 1U) / 2U;
   sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
   sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
   sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
   sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
   sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;

   if (HAL_TIM_OC_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
   {
      Error_Handler();
   }

   __HAL_TIM_ENABLE_OCxPRELOAD(&htim1, TIM_CHANNEL_4);

   /* Enable channel 4 (this triggers CC4 event generation, no output on pin) */
   if (HAL_TIM_OC_Start(&htim1, TIM_CHANNEL_4) != HAL_OK)
   {
      Error_Handler();
   }
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

   __HAL_RCC_SYSCFG_CLK_ENABLE();
   __HAL_RCC_PWR_CLK_ENABLE();

   HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000U);
   HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);
   HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);

   __set_BASEPRI(0);
   __set_PRIMASK(0);
   __enable_irq();

   GPIO_Init();
   OPAMP_Init();
   ADC_Init();
   DMA_Init();
   DMA_LinkADC_Init(&hadc4);
   TIM1_Init();
}
