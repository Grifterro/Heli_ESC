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

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void GPIO_Init(void);
static void ADC3_Init(void);
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

   /* Configure pin for VBUS */
   GPIO_InitStruct.Pin = ESC_VBUS_GPIO_PIN;
   GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
   GPIO_InitStruct.Pull = GPIO_NOPULL;
   HAL_GPIO_Init(ESC_VBUS_GPIO_PORT, &GPIO_InitStruct);

   HAL_GPIO_WritePin(ESC_LED_STATUS_GPIO_PORT, ESC_LED_STATUS_GPIO_PIN, GPIO_PIN_RESET);
   HAL_GPIO_Init(ESC_LED_STATUS_GPIO_PORT, &GPIO_InitStruct);
}

/**
 * @brief ADC3_Init
 *
 */
static void ADC3_Init(void)
{
   ADC_HandleTypeDef hadc3;
   ADC_MultiModeTypeDef multimode = {0};
   ADC_ChannelConfTypeDef sConfig = {0};

   /** Common config */
   hadc3.Instance = ADC3;
   hadc3.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
   hadc3.Init.Resolution = ADC_RESOLUTION_12B;
   hadc3.Init.ScanConvMode = ADC_SCAN_DISABLE;
   hadc3.Init.ContinuousConvMode = ENABLE;
   hadc3.Init.DiscontinuousConvMode = DISABLE;
   hadc3.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
   hadc3.Init.ExternalTrigConv = ADC_SOFTWARE_START;
   hadc3.Init.DataAlign = ADC_DATAALIGN_RIGHT;
   hadc3.Init.NbrOfConversion = 1;
   hadc3.Init.DMAContinuousRequests = DISABLE;
   hadc3.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
   hadc3.Init.LowPowerAutoWait = DISABLE;
   hadc3.Init.Overrun = ADC_OVR_DATA_OVERWRITTEN;
   if (HAL_ADC_Init(&hadc3) != HAL_OK)
   {
      Error_Handler();
   }

   /** Configure the ADC multi-mode */
   multimode.Mode = ADC_MODE_INDEPENDENT;
   if (HAL_ADCEx_MultiModeConfigChannel(&hadc3, &multimode) != HAL_OK)
   {
      Error_Handler();
   }

   /** Configure Regular Channel */
   sConfig.Channel = ADC_CHANNEL_5;
   sConfig.Rank = ADC_REGULAR_RANK_1;
   sConfig.SingleDiff = ADC_SINGLE_ENDED;
   sConfig.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
   sConfig.OffsetNumber = ADC_OFFSET_NONE;
   sConfig.Offset = 0;
   if (HAL_ADC_ConfigChannel(&hadc3, &sConfig) != HAL_OK)
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

   GPIO_Init();
   ADC3_Init();
}
