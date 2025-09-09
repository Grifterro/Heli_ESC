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