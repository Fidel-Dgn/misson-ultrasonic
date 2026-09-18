/**
 *******************************************************************************
 * @file 	main.c
 * @author 	jjo
 * @date 	Mar 29, 2024
 * @brief	Fichier principal de votre projet sur carte Nucléo STM32G431KB
 *******************************************************************************
 */

#include "config.h"
#include "stm32g4_sys.h"

#include "stm32g4_systick.h"
#include "stm32g4_gpio.h"
#include "stm32g4_uart.h"
#include "stm32g4_utils.h"

#include <stdio.h>

#define SOUND_SPEED 340.0f
static uint32_t pulse_start_timestamp = 0;
static uint32_t pulse_end_timestamp   = 0;
static uint32_t distance = 0;

void US_echo_falling_edge(uint8_t pin_number);

/**
 * @brief Fonction de callback sur front montant
 *
 * @param pin : numéro de la broche recevant le signal écho
 */
void US_echo_rising_edge(uint8_t pin_number)
{
    HAL_GPIO_WritePin(LED_GREEN_GPIO, LED_GREEN_PIN, GPIO_PIN_SET);

    pulse_start_timestamp = BSP_systick_get_time_us();

    BSP_GPIO_pin_config(GPIOB, GPIO_PIN_4, GPIO_MODE_IT_FALLING,
                        GPIO_PULLDOWN, GPIO_SPEED_FREQ_HIGH, GPIO_NO_AF);

    BSP_EXTIT_set_callback(&US_echo_falling_edge,
                           BSP_EXTIT_gpiopin_to_pin_number(GPIO_PIN_4),
                           true);
}

/**
 * @brief Fonction de callback sur front descendant
 *
 * @param pin : numéro de la broche recevant le signal écho
 */
void US_echo_falling_edge(uint8_t pin_number)
{
    HAL_GPIO_WritePin(LED_GREEN_GPIO, LED_GREEN_PIN, GPIO_PIN_RESET);

    pulse_end_timestamp = BSP_systick_get_time_us();

    uint32_t pulse_duration = pulse_end_timestamp - pulse_start_timestamp;

    distance = pulse_duration / 58;   // distance en cm

    BSP_GPIO_pin_config(GPIOB, GPIO_PIN_4, GPIO_MODE_IT_RISING,
                        GPIO_PULLDOWN, GPIO_SPEED_FREQ_HIGH, GPIO_NO_AF);

    BSP_EXTIT_set_callback(&US_echo_rising_edge,
                           BSP_EXTIT_gpiopin_to_pin_number(GPIO_PIN_4),
                           true);
}

/**
  * @brief  Point d'entrée de votre application
  */
int main(void)
{
    HAL_Init();

    uint32_t* p_tim1_ccr1 = 0x40012c34;
    *p_tim1_ccr1 = 0x4;

    BSP_GPIO_enable();
    BSP_UART_init(UART2_ID,115200);

    BSP_SYS_set_std_usart(UART2_ID, UART2_ID, UART2_ID);

    BSP_GPIO_pin_config(LED_GREEN_GPIO, LED_GREEN_PIN, GPIO_MODE_OUTPUT_PP,
                        GPIO_NOPULL,GPIO_SPEED_FREQ_VERY_HIGH,GPIO_NO_AF);

    BSP_GPIO_pin_config(GPIOA, GPIO_PIN_8, GPIO_MODE_OUTPUT_PP,
                        GPIO_NOPULL,GPIO_SPEED_FREQ_VERY_HIGH,GPIO_NO_AF);

    BSP_GPIO_pin_config(GPIOB, GPIO_PIN_4, GPIO_MODE_INPUT,
                        GPIO_PULLDOWN, GPIO_SPEED_FREQ_HIGH, GPIO_NO_AF);

    BSP_GPIO_pin_config(GPIOB, GPIO_PIN_4, GPIO_MODE_IT_RISING,
                        GPIO_PULLDOWN, GPIO_SPEED_FREQ_HIGH, GPIO_NO_AF);

    BSP_EXTIT_set_callback(&US_echo_rising_edge,
                           BSP_EXTIT_gpiopin_to_pin_number(GPIO_PIN_4),
                           true);

    while (1)
    {
        // boucle infinie
    }
}
