/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : The main program body.
  *
  ******************************************************************************
  * @attention This software is developed by Fabian Donchór
  * Copyright (c) 2025 Flytronic.
  * All rights reserved.
  ******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include <string.h>

/* Private includes ----------------------------------------------------------*/
#include "board_cfg.h"

/* Private macro -------------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/
#define BOOTLOADER_ADDRESS              ((uint32_t) 0x08000000U)
#define BOOTLOADER_UPDATER_ADDRESS      ((uint32_t) 0x080E0000U)



/* Private typedef -----------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

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
    HAL_Init();
    ECU_HW_Init();

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
void App_JumpTo_BootLoader(void)
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
    SysTick->VAL  = 0;

    // Read the stack pointer (MSP) and the Reset_Handler address from the application
    uint32_t bootloader_stack = *(volatile uint32_t*)BOOTLOADER_ADDRESS;
    uint32_t bootloader_reset_handler = *(volatile uint32_t*)(BOOTLOADER_ADDRESS + 4);

    // Set the new stack
    __set_MSP(bootloader_stack);

    // Set the application's vector table address (VTOR)
    SCB->VTOR = BOOTLOADER_ADDRESS;

    // Optional: instruction barrier (for safety)
    __DSB();
    __ISB();

    // Jump to the BootLoader
    void (*bootloader_entry)(void) = (void*)bootloader_reset_handler;
    bootloader_entry();

    // This line should not be reached
    while (1)
    {
        ;
    }
}

/* Exported function ----------------------------------------------------------*/
