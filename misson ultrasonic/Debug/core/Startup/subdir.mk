################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../core/Startup/startup_stm32g431kbtx.s 

C_SRCS += \
../core/Startup/bootloader.c 

OBJS += \
./core/Startup/bootloader.o \
./core/Startup/startup_stm32g431kbtx.o 

S_DEPS += \
./core/Startup/startup_stm32g431kbtx.d 

C_DEPS += \
./core/Startup/bootloader.d 


# Each subdirectory must supply rules for building sources it contributes
core/Startup/%.o core/Startup/%.su core/Startup/%.cyclo: ../core/Startup/%.c core/Startup/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G431xx -c -I../core/Inc -I../drivers/stm32g4xx_hal/Inc -I../drivers/stm32g4xx_hal/Inc/Legacy -I../drivers/cmsis/Device/ST/STM32G4xx/Include -I../drivers/cmsis/Include -I../app -I../drivers/bsp -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
core/Startup/%.o: ../core/Startup/%.s core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-core-2f-Startup

clean-core-2f-Startup:
	-$(RM) ./core/Startup/bootloader.cyclo ./core/Startup/bootloader.d ./core/Startup/bootloader.o ./core/Startup/bootloader.su ./core/Startup/startup_stm32g431kbtx.d ./core/Startup/startup_stm32g431kbtx.o

.PHONY: clean-core-2f-Startup

