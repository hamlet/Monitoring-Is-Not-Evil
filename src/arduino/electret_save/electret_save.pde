#include <Streaming.h>
#include <Ports.h>
#include <RF12.h> // needed to avoid a linker error :(

BlinkPlug buttons (3);
MilliTimer timer_sample;
MilliTimer timer_blink;
unsigned int value = 0;
unsigned int on;
unsigned int i = 0;

#define NBSAMPLES 500 

void setup () {
  buttons.ledOn(1+2);

  Serial.begin(115200);
  Serial << "\n[electret_test]\n";

  delay(100);
  buttons.ledOff(1+2);
}

void loop () {
  if( i == NBSAMPLES ) {
    value = value / NBSAMPLES;
    Serial << '%' << millis() << "% |" << value << "|\n";
    value = 0;
    i = 0;
  }
  else if ((i < NBSAMPLES) && timer_sample.poll(2)) {
    value += analogRead(0);
    i++;
  }
  else if (timer_blink.poll(1000)){
    if(on){
      buttons.ledOff(2);
      buttons.ledOn(1);
    }
    else {
      buttons.ledOn(2);
      buttons.ledOff(1);
    }
    on = !on;
  }
}
