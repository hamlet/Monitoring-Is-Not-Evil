#include <MemoryFree.h>
#include <Flash.h>
#include <Ports.h>
#include <RF12.h> // needed to avoid a linker error :(

BlinkPlug buttons (3);
MilliTimer timer;

volatile long i;
long j;

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
  if(timer.poll(1000)){
    cli();
    j=i;
    i=0;
    sei();
    Serial.println(j);
  }
}

ISR(ADC_vect)		//ADC interrupt
{
  uint8_t high,low;

  low = ADCL;		//Make certain to read ADCL first, it locks the values
  high = ADCH;		//and ADCH releases them.

  i++;		
}  



