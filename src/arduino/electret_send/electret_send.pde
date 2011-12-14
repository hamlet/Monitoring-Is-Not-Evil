#include <Streaming.h>
#include <Ports.h>
#include <RF12.h> // needed to avoid a linker error :(

BlinkPlug buttons (3);
MilliTimer timer_sample;
MilliTimer timer_blink;
char on;
unsigned long time;
int value;

void setup () {
  buttons.ledOn(1+2);

  Serial.begin(115200);
  Serial << "\n[electret_send]\n";

  delay(100);
  buttons.ledOff(1+2);
}

void loop () {
  if (timer_sample.poll(2)){
    time = millis();
    value = analogRead(0);
    Serial << '%' << time << "% |" << value << "|\n";                       
  }
  if (timer_blink.poll(1000)){
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





