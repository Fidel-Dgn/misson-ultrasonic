################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../core/Src/stm32g4xx_it.c \
../core/Src/syscalls.c \
../core/Src/sysmem.c \
../core/Src/system_stm32g4xx.c 

OBJS += \
./core/Src/stm32g4xx_it.o \
./core/Src/syscalls.o \
./core/Src/sysmem.o \
./core/Src/system_stm32g4xx.o 

C_DEPS += \
./core/Src/stm32g4xx_it.d \
./core/Src/syscalls.d \
./core/Src/sysmem.d \
./core/Src/system_stm32g4xx.d 


# Each subdirectory must supply rules for building sources it contributes
core/Src/%.o core/Src/%.su core/Src/%.cyclo: ../core/Src/%.c core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G431xx -c -I../core/Inc -I../drivers/stm32g4xx_hal/Inc -I../drivers/stm32g4xx_hal/Inc/Legacy -I../drivers/cmsis/Device/ST/STM32G4xx/Include -I../drivers/cmsis/Include -I../app -I../drivers/bsp -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-core-2f-Src

clean-core-2f-Src:
	-$(RM) ./core/Src/stm32g4xx_it.cyclo ./core/Src/stm32g4xx_it.d ./core/Src/stm32g4xx_it.o ./core/Src/stm32g4xx_it.su ./core/Src/syscalls.cyclo ./core/Src/syscalls.d ./core/Src/syscalls.o ./core/Src/syscalls.su ./core/Src/sysmem.cyclo ./core/Src/sysmem.d ./core/Src/sysmem.o ./core/Src/sysmem.su ./core/Src/system_stm32g4xx.cyclo ./core/Src/system_stm32g4xx.d ./core/Src/system_stm32g4xx.o ./core/Src/system_stm32g4xx.su

.PHONY: clean-core-2f-Src

