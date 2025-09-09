/**
 ******************************************************************************
 * @file           : main.c
 * @brief          :
 *
 ******************************************************************************
 * @attention This software has been developed by Fabian Donchór since 2025.
 * email: fabian.donchor@gmail.com
 * All rights reserved.
 ******************************************************************************
 */

/*** Includes ------------------------------------------------------------------*/
#include <stdint.h>

/*** Private includes ----------------------------------------------------------*/
#include "board_cfg.h"
#include "stm32f3xx.h"

/*** Private define ------------------------------------------------------------*/

/*** Private macro -------------------------------------------------------------*/

/*** Private typedef -----------------------------------------------------------*/

/*** Private variables ---------------------------------------------------------*/
extern const uint32_t APP_ADDRESS;
#define APP_BASE ((uint32_t)&APP_ADDRESS)

/*** Private function prototypes -----------------------------------------------*/
void BootLoader_JumpTo_App(void);

/*** Private function ----------------------------------------------------------*/
/**
 * @brief main
 * @param  None
 * @retval None
 */
int main(void)
{
   BootLoader_JumpTo_App();
   /* Infinite loop */
   while (1)
   {
      ; /* Nothing to do */
   }

   return 0;
}

/**
 * @brief Jumping from the bootloader to the user application
 * @param
 * @retval
 */
__attribute__((noreturn)) void BootLoader_JumpTo_App(void)
{
   // Disable all interrupts
   __disable_irq();

   // Deactivate all NVIC interrupts
   for (uint32_t i = 0; i < 8; i++)
   {
      NVIC->ICER[i] = 0xFFFFFFFF;
      NVIC->ICPR[i] = 0xFFFFFFFF;
   }

   // Disable SysTick
   SysTick->CTRL = 0;
   SysTick->LOAD = 0;
   SysTick->VAL = 0;

   HAL_RCC_DeInit();

   // Read the stack pointer (MSP) and the Reset_Handler address from the APP
   uint32_t app_msp = *(__IO uint32_t *)(APP_BASE + 0);
   uint32_t app_reset = *(__IO uint32_t *)(APP_BASE + 4);

   if ((app_msp & 0x2FFE0000u) != 0x20000000u)
   {
      NVIC_SystemReset();
   }

   // Set the new stack
   __set_MSP(app_msp);

   // Set the APP's vector table address (VTOR)
   SCB->VTOR = APP_BASE;

   // Optional: instruction barrier (for safety)
   __DSB();
   __ISB();

   // Jump to the APP
   void (*app_entry)(void) = (void (*)(void))(app_reset | 1u);
   app_entry();

   // This line should not be reached
   while (1);
}

/*** External functions --------------------------------------------------------*/