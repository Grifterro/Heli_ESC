################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/bus_voltage_sensor.c \
C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/ntc_temperature_sensor.c \
C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/pid_regulator.c \
C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/r_divider_bus_voltage_sensor.c \
C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/revup_ctrl_sixstep.c \
C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/speed_pos_fdbk_sixstep.c 

OBJS += \
./Middlewares/MotorControl/bus_voltage_sensor.o \
./Middlewares/MotorControl/ntc_temperature_sensor.o \
./Middlewares/MotorControl/pid_regulator.o \
./Middlewares/MotorControl/r_divider_bus_voltage_sensor.o \
./Middlewares/MotorControl/revup_ctrl_sixstep.o \
./Middlewares/MotorControl/speed_pos_fdbk_sixstep.o 

C_DEPS += \
./Middlewares/MotorControl/bus_voltage_sensor.d \
./Middlewares/MotorControl/ntc_temperature_sensor.d \
./Middlewares/MotorControl/pid_regulator.d \
./Middlewares/MotorControl/r_divider_bus_voltage_sensor.d \
./Middlewares/MotorControl/revup_ctrl_sixstep.d \
./Middlewares/MotorControl/speed_pos_fdbk_sixstep.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/MotorControl/bus_voltage_sensor.o: C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/bus_voltage_sensor.c Middlewares/MotorControl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../../Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../../MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Inc -I../../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/MotorControl/ntc_temperature_sensor.o: C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/ntc_temperature_sensor.c Middlewares/MotorControl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../../Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../../MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Inc -I../../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/MotorControl/pid_regulator.o: C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/pid_regulator.c Middlewares/MotorControl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../../Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../../MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Inc -I../../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/MotorControl/r_divider_bus_voltage_sensor.o: C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/r_divider_bus_voltage_sensor.c Middlewares/MotorControl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../../Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../../MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Inc -I../../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/MotorControl/revup_ctrl_sixstep.o: C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/revup_ctrl_sixstep.c Middlewares/MotorControl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../../Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../../MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Inc -I../../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/MotorControl/speed_pos_fdbk_sixstep.o: C:/Users/fabia/.st_workbench/projects/STEVAL-ESC001V1/MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Src/speed_pos_fdbk_sixstep.c Middlewares/MotorControl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F303xC -c -I../../Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc -I../../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../../MCSDK_v6.4.0-Full/MotorControl/MCSDK/MCLib/Any/Inc -I../../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../../Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-MotorControl

clean-Middlewares-2f-MotorControl:
	-$(RM) ./Middlewares/MotorControl/bus_voltage_sensor.cyclo ./Middlewares/MotorControl/bus_voltage_sensor.d ./Middlewares/MotorControl/bus_voltage_sensor.o ./Middlewares/MotorControl/bus_voltage_sensor.su ./Middlewares/MotorControl/ntc_temperature_sensor.cyclo ./Middlewares/MotorControl/ntc_temperature_sensor.d ./Middlewares/MotorControl/ntc_temperature_sensor.o ./Middlewares/MotorControl/ntc_temperature_sensor.su ./Middlewares/MotorControl/pid_regulator.cyclo ./Middlewares/MotorControl/pid_regulator.d ./Middlewares/MotorControl/pid_regulator.o ./Middlewares/MotorControl/pid_regulator.su ./Middlewares/MotorControl/r_divider_bus_voltage_sensor.cyclo ./Middlewares/MotorControl/r_divider_bus_voltage_sensor.d ./Middlewares/MotorControl/r_divider_bus_voltage_sensor.o ./Middlewares/MotorControl/r_divider_bus_voltage_sensor.su ./Middlewares/MotorControl/revup_ctrl_sixstep.cyclo ./Middlewares/MotorControl/revup_ctrl_sixstep.d ./Middlewares/MotorControl/revup_ctrl_sixstep.o ./Middlewares/MotorControl/revup_ctrl_sixstep.su ./Middlewares/MotorControl/speed_pos_fdbk_sixstep.cyclo ./Middlewares/MotorControl/speed_pos_fdbk_sixstep.d ./Middlewares/MotorControl/speed_pos_fdbk_sixstep.o ./Middlewares/MotorControl/speed_pos_fdbk_sixstep.su

.PHONY: clean-Middlewares-2f-MotorControl

