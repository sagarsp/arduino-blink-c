#include    <avr/io.h>
#include    <util/delay.h>

#define     BLINK_DELAY_MS  18000

int main (void)
{
    DDRB |= _BV(DDB5);

    while(1)
    {
        PORTB |= _BV(PORTB5);
        _delay_ms(BLINK_DELAY_MS);

        PORTB &= ~_BV(PORTB5);
        _delay_ms(BLINK_DELAY_MS);
    }

    return 0;
}
