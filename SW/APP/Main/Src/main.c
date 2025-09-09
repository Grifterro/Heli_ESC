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

/* Includes ------------------------------------------------------------------*/
#include <string.h>

/* Private includes ----------------------------------------------------------*/
#include "board_cfg.h"
#include "esc_hw_lla.h"

/* Private macro -------------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private typedef -----------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
extern const uint32_t BTL_ADDRESS;
#define BTL_BASE ((uint32_t)&BTL_ADDRESS)

/* Private function prototypes -----------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/
void App_JumpTo_BootLoader(void);

/* Private function ---------------------------------------------------------*/
/**
 * @brief
 * @retval NONE
 */
int main(void)
{
   ECU_HW_Init();

   ESC_HW_LLA__SetEscLedSts(ESC_HW_LLA__LED_STATUS_TURN_ON);
   ESC_HW_LLA__SetEscLedSts(ESC_HW_LLA__LED_STATUS_TURN_OFF);

   while (1)
   {
      ; /* Safety loop */
   }
   return 0;
}

/**
 * @brief Jumping from the user application to the user BootLoader.
 *
 * @param  None
 * @retval None
 */
__attribute__((noreturn)) void App_JumpTo_BootLoader(void)
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

   // Read the stack pointer (MSP) and the Reset_Handler address from the bootloader
   uint32_t btl_msp = *(__IO uint32_t *)(BTL_BASE + 0);
   uint32_t btl_reset = *(__IO uint32_t *)(BTL_BASE + 4);

   if ((btl_msp & 0x2FFE0000u) != 0x20000000u)
   {
      NVIC_SystemReset();
   }

   // Set the new stack
   __set_MSP(btl_msp);

   // Set the bootloader's vector table address (VTOR)
   SCB->VTOR = BTL_BASE;

   // Optional: instruction barrier (for safety)
   __DSB();
   __ISB();

   // Jump to the bootloader
   void (*btl_entry)(void) = (void (*)(void))(btl_reset | 1u);
   btl_entry();

   // This line should not be reached
   while (1);
}

/* Exported function ----------------------------------------------------------*/
