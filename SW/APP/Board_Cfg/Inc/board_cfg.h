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
// GPIO
#define LED_Status_GPIO_Pin       GPIO_PIN_2
#define LED_Status_GPIO_Port      GPIOB
#define VBUS_GPIO_Pin             GPIO_PIN_13
#define VBUS_GPIO_Port            GPIOB

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
* @brief SystemClock_Config
*
* @param  None
* @retval None
*/
void SystemClock_Config(void);

#endif /* BOARD_CFG_H */
