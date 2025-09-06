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

/* Private includes ----------------------------------------------------------*/
#include "board_cfg.h"

/* Private macro -------------------------------------------------------------*/

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/
static void Error_Handler(void);

/* Private function ----------------------------------------------------------*/
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

}

