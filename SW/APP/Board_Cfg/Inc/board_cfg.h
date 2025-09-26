/**
 ******************************************************************************
 * @file           : board_cfg.h
 * @brief          : Header for board_cfg.c file.
 *                   This file contains the common defines of the board configuration.
 ******************************************************************************
 * @attention This software has been developed by Fabian Donchór since 2025.
 * email: fabian.donchor@gmail.com
 * All rights reserved.
 ******************************************************************************
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef BOARD_CFG_H
#define BOARD_CFG_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Private includes ----------------------------------------------------------*/
#include "stm32f3xx.h"
#include "stm32f3xx_hal.h"

/* Exported macro ------------------------------------------------------------*/

/* Exported definitions ------------------------------------------------------*/
/* Defines for VBUS line (power supply for ESC) */
#define ESC_VBUS_R1_OHM ((float)169000.0)
#define ESC_VBUS_R2_OHM ((float)18000.0)
#define ESC_VBUS_K (ESC_VBUS_R2_OHM / (ESC_VBUS_R1_OHM + ESC_VBUS_R2_OHM))
#define ESC_VBUS_GPIO_PORT GPIOB
#define ESC_VBUS_GPIO_PIN GPIO_PIN_13
#define ESC_VBUS_DMA_BUFFER_LENGTH ((size_t)100)

/* Defines for ESC LED Status */
#define ESC_LED_STATUS_GPIO_PORT GPIOB
#define ESC_LED_STATUS_GPIO_PIN GPIO_PIN_2

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported variables --------------------------------------------------------*/

/* Exported functions prototypes ---------------------------------------------*/
/**
 * @brief ECU_HW_Init
 *
 * @param  None
 * @retval None
 */
void ECU_HW_Init(void);

/**
 * @brief
 *
 * @param  None
 * @retval None
 */

#endif /* BOARD_CFG_H */
