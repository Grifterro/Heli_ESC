/**
  ******************************************************************************
  * @file           : system_stm32f3xx.c
  * @brief          : 
  *
  ******************************************************************************
  * @attention This software has been developed by Fabian Donchór since 2025.
  * email: fabian.donchor@gmail.com
  * All rights reserved.
  ******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Private includes ----------------------------------------------------------*/
#include "stm32f3xx.h"
#include "stm32f3xx_hal_conf.h"

/* Private macro -------------------------------------------------------------*/

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
uint32_t SystemCoreClock = HSI_VALUE;
const uint8_t AHBPrescTable[16] =  {0,0,0,0,0,0,0,0,1,2,3,4,6,7,8,9};
const uint8_t APBPrescTable[8]  =  {0,0,0,0, 1,2,3,4};

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
* @brief ECU_HW_Init
*
* @param  None
* @retval None
*/
void SystemInit(void)
{
#ifdef __FPU_PRESENT
  #if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
    SCB->CPACR |= ((3UL << 20) | (3UL << 22));
  #endif
#endif
  RCC->CR |= RCC_CR_HSION;
  RCC->CR &= ~(RCC_CR_PLLON | RCC_CR_HSEON | RCC_CR_CSSON);
  RCC->CFGR  = 0x00000000U;
  RCC->CFGR2 = 0x00000000U;
  RCC->CFGR3 = 0x00000000U;
  RCC->CIR   = 0x00000000U;

  /* TODO: TU w wersji docelowej ustaw PLL/HSE wg potrzeb
     (np. w BootLoader niższe taktowanie, w App pełne 72 MHz) */

  SystemCoreClock = HSI_VALUE;
}

void SystemCoreClockUpdate(void)
{
  /* TODO: jeśli przełączysz na PLL/HSE, przelicz SystemCoreClock */
  SystemCoreClock = HSI_VALUE;
}
