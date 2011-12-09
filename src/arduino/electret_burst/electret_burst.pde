#include <MemoryFree.h>
#include <Flash.h>
#include <Ports.h>
#include <RF12.h> // needed to avoid a linker error :(

BlinkPlug buttons (3);

#define NSAMPLES 500

int values[NSAMPLES];
int i, time;

void setup () {
  Serial.begin(57600);
  Serial << F("\n[electret_test]\n");

  buttons.ledOn(1+2);
  Serial << F("Free memory : ");
  Serial.println(freeMemory());
  delay(1000);
  buttons.ledOff(1+2);

}

void loop () {
  buttons.ledOff(2);
  buttons.ledOn(1);
  Serial.print('%');
  Serial.print(millis());
  Serial.println('%');
  for (i = 0; i<NSAMPLES ;i++)
    values[i] =  analogRead(0);
  time = millis();

  buttons.ledOn(2);
  buttons.ledOff(1);
  for (i = 0; i<NSAMPLES ;i++)
    Serial.println(values[i]);
  Serial.print('+');
  Serial.print(time);
  Serial.println('+');

}


