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

/*** Includes ------------------------------------------------------------------*/
#include <stdint.h>

/*** Private includes ----------------------------------------------------------*/
#include "board_cfg.h"
#include "stm32f3xx.h"

/*** Private define ------------------------------------------------------------*/

/*** Private macro -------------------------------------------------------------*/

/*** Private typedef -----------------------------------------------------------*/

/*** Private variables ---------------------------------------------------------*/
extern uint32_t APP_ADDRESS;

/*** Private function prototypes -----------------------------------------------*/
void BootLoader_JumpTo_App(void);

/*** Private function ----------------------------------------------------------*/
/**
* @brief btl_main
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
void BootLoader_JumpTo_App(void)
{
    // Disable all interrupts
    __disable_irq();

    // Deactivate all NVIC interrupts
    for (uint32_t i = 0; i < 8; i++) {
        NVIC->ICER[i] = 0xFFFFFFFF;
        NVIC->ICPR[i] = 0xFFFFFFFF;
    }

    // Disable SysTick
    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL  = 0;

    // Read the stack pointer (MSP) and the Reset_Handler address from the application
    uint32_t app_stack = *(volatile uint32_t*)APP_ADDRESS;
    uint32_t app_reset_handler = *(volatile uint32_t*)(APP_ADDRESS + 4);

    // Set the new stack
    __set_MSP(app_stack);

    // Set the application's vector table address (VTOR)
    SCB->VTOR = APP_ADDRESS;

    // Optional: instruction barrier (for safety)
    __DSB();
    __ISB();

    // Jump to the application
    void (*app_entry)(void) = (void*)app_reset_handler;
    app_entry();

    // This line should not be reached
    while (1);
}

/*** External functions --------------------------------------------------------*/