/**
 ******************************************************************************
 * @file           : esc_hw_lla.h
 * @brief          : Header for board_cfg.c file.
 *                   This file contains the common defines of the
 *                   HW low level abstraction.
 ******************************************************************************
 * @attention This software has been developed by Fabian Donchór since 2025.
 * email: fabian.donchor@gmail.com
 * All rights reserved.
 ******************************************************************************
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef ESC_HW_LLA_H
#define ESC_HW_LLA_H

/* Includes ------------------------------------------------------------------*/

/* Private includes ----------------------------------------------------------*/
// #include "stm32f3xx.h"
//  #include "stm32f3xx_hal.h"

/* Exported macro ------------------------------------------------------------*/

/* Exported definitions ------------------------------------------------------*/
#define ESC_HW_LLA__LED_STATUS_TURN_ON GPIO_PIN_SET
#define ESC_HW_LLA__LED_STATUS_TURN_OFF GPIO_PIN_RESET

/* Exported types ------------------------------------------------------------*/
typedef GPIO_PinState ESC_HW_LLA__GPIO_PinState;

/* Exported constants --------------------------------------------------------*/

/* Exported variables --------------------------------------------------------*/

/* Exported functions prototypes ---------------------------------------------*/
/**
 * @brief ESC_HW_LLA__SetEscLedSts()
 */
void ESC_HW_LLA__SetEscLedSts(ESC_HW_LLA__GPIO_PinState PinState);
#endif /* ESC_HW_LLA_H */
