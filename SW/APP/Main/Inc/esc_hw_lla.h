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
typedef enum
{
   ESC_HW_LLA__BLDC_STEP_1 = 0,
   ESC_HW_LLA__BLDC_STEP_2,
   ESC_HW_LLA__BLDC_STEP_3,
   ESC_HW_LLA__BLDC_STEP_4,
   ESC_HW_LLA__BLDC_STEP_5,
   ESC_HW_LLA__BLDC_STEP_6,
} ESC_HW_LLA__BLDC_STEP_t;
/* Exported constants --------------------------------------------------------*/

/* Exported variables --------------------------------------------------------*/

/* Exported functions prototypes ---------------------------------------------*/
/**
 * @brief ESC_HW_LLA__SetEscLedSts()
 */
void ESC_HW_LLA__SetEscLedSts(ESC_HW_LLA__GPIO_PinState PinState);
void ESC_HW_LLA__SetBldcStep(ESC_HW_LLA__BLDC_STEP_t bldc_step, uint8_t percentage_power);
#endif /* ESC_HW_LLA_H */
