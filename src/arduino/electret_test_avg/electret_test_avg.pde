#include <Streaming.h>
#include <Ports.h>
#include <RF12.h> // needed to avoid a linker error :(

BlinkPlug buttons (3);
MilliTimer timer_sample;
MilliTimer timer_blink;
unsigned long value = 0, avg = 0, on, i = 0;
/*
  Smoothing
 From :
 http://www.arduino.cc/en/Tutorial/Smoothing
 This example code is in the public domain.
 */

// Define the number of samples to keep track of.  The higher the number,
// the more the readings will be smoothed, but the slower the output will
// respond to the input.  Using a constant rather than a normal variable lets
// use this value to determine the size of the readings array.
const int numReadings = 100;

int readings[numReadings];      // the readings from the analog input
int index = 0;                  // the index of the current reading
long total = 0;                  // the running total
int average = 0;                // the average

void setup () {
  buttons.ledOn(1+2);

  Serial.begin(115200);
  Serial << "\n[electret_test]\n";
  for (int thisReading = 0; thisReading < numReadings; thisReading++)
    readings[thisReading] = 0;   

  delay(100);
  buttons.ledOff(1+2);
}

void loop () {
  if (timer_sample.poll(2)){
    // subtract the last reading:
    total= total - readings[index];        
    // read from the sensor:  
    readings[index] = analogRead(0);
    // add the reading to the total:
    total= total + readings[index];      
    // calculate the average:
    average = total / numReadings;    

    Serial << '%' << millis() << "% |" << readings[index] << "| +" << average << "+\n";
    // advance to the next position in the array:  
    index = index + 1;                    
    // if we're at the end of the array...
    if (index >= numReadings)              
      // ...wrap around to the beginning:
      index = 0;                            
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





