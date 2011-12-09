#include <MemoryFree.h>
#include <Flash.h>
#include <Ports.h>
#include <RF12.h> // needed to avoid a linker error :(

BlinkPlug buttons (3);

#define NSAMPLES 500

volatile int values[NSAMPLES];
int time;
volatile long i;

void setup () {
  Serial.begin(57600);
  Serial << F("\n[electret_test]\n");

  buttons.ledOn(1+2);
  Serial << F("Free memory : ");
  Serial.println(freeMemory());
  delay(1000);
  buttons.ledOff(1+2);

  ADMUX |= (1 << REFS0); // Set ADC reference to AVCC

  ADCSRA |= (1 << ADEN);  // Enable ADC
  ADCSRA |= (1 << ADATE); // Enable auto-triggering
  ADCSRA |= (1 << ADIE);  // Enable ADC Interrupt

  sei();		     // Enable Global Interrupts

  ADCSRA |= (1 << ADSC);  // Start A2D Conversions
}

void loop () {
  if(i == -1) {
    buttons.ledOff(2);
    buttons.ledOn(1);
    Serial.print('%');
    Serial.print(millis());
    Serial.println('%');
    ADCSRA |= (1 << ADIE);    //Re-enable ADC interrupts and A2D conversions
    ADCSRA |= (1 << ADSC);
    i = 0;
  }
  else if (i >= NSAMPLES) {
    time = millis();
    ADCSRA &= ~(1 << ADSC);    //Stop ADC
    ADCSRA &= ~(1 << ADIE);    //Disable ADC interrupts

    buttons.ledOn(2);
    buttons.ledOff(1);
    for (i = 0; i<NSAMPLES ;i++)
      Serial.println(values[i]);
    Serial.print('+');
    Serial.print(time);
    Serial.println('+');
    i = -1;
  }

}

ISR(ADC_vect)		//ADC interrupt
{
  uint8_t high,low;

  low = ADCL;		//Make certain to read ADCL first, it locks the values
  high = ADCH;		//and ADCH releases them.

  values[i++] = (high << 8) | low;		
}  


// reads internal chip temperature
// from http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1252144888
int chipTempRaw(void) {
  while((ADCSRA & _BV(ADSC)));                   // Wait for any ongoing conversion to complete
  ADMUX = _BV(REFS1) | _BV(REFS0) | _BV(MUX3);   // Set internal 1.1V reference, temperature reading
  ADCSRA &= ~(_BV(ADATE) |_BV(ADIE));            // Clear auto trigger and interrupt enable
  ADCSRA |= _BV(ADEN) | _BV(ADSC);               // Enable AD and start conversion
  while((ADCSRA & _BV(ADSC)));                   // Wait until conversion is finished
  return(ADCL | (ADCH << 8));
} 



