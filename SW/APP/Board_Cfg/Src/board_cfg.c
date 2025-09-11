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
extern uint32_t vBusDMA_Buffer[ESC_VBUS_DMA_BUFFER_LENGTH];

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void GPIO_Init(void);
static void OPAMP4_Init(void);
static void ADC4_Init(void);
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
   ADC_HandleTypeDef hadc4 = {0};

   __HAL_RCC_ADC34_CLK_ENABLE();

   hadc4.Instance = ADC4;
   hadc4.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
   hadc4.Init.Resolution = ADC_RESOLUTION_12B;
   hadc4.Init.DataAlign = ADC_DATAALIGN_RIGHT;
   hadc4.Init.ScanConvMode = ADC_SCAN_DISABLE;
   hadc4.Init.DiscontinuousConvMode = DISABLE;
   hadc4.Init.ContinuousConvMode = ENABLE;
   hadc4.Init.ExternalTrigConv = ADC_SOFTWARE_START;
   hadc4.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIG_EDGE_NONE;
   hadc4.Init.DMAContinuousRequests = ENABLE;
   hadc4.Init.Overrun = ADC_OVR_DATA_OVERWRITTEN;
   HAL_ADC_Init(&hadc4);
   HAL_ADCEx_Calibration_Start(&hadc4, ADC_SINGLE_ENDED);

   ADC_ChannelConfTypeDef ADC_ChannelConfStruct = {0};
   ADC_ChannelConfStruct.Channel = ADC_CHANNEL_3;
   ADC_ChannelConfStruct.Rank = ADC_REGULAR_RANK_1;
   ADC_ChannelConfStruct.SamplingTime = ADC_SAMPLETIME_181CYCLES_5;
   HAL_ADC_ConfigChannel(&hadc4, &ADC_ChannelConfStruct);

   HAL_ADC_Start_DMA(&hadc4, (uint32_t*)vBusDMA_Buffer, ESC_VBUS_DMA_BUFFER_LENGTH);
   __HAL_DMA_ENABLE_IT(hadc4.DMA_Handle, DMA_IT_HT);
   __HAL_DMA_DISABLE_IT(hadc4.DMA_Handle, DMA_IT_TC);
}

static void MX_DMA_Init(void)
{
  __HAL_RCC_DMA2_CLK_ENABLE();
  HAL_NVIC_SetPriority(DMA2_Channel2_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Channel2_IRQn);
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
   HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000U);
   HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);
   HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);

   __set_BASEPRI(0);
   __set_PRIMASK(0);
   __enable_irq();

   GPIO_Init();
   OPAMP4_Init();
   ADC4_Init();
}
