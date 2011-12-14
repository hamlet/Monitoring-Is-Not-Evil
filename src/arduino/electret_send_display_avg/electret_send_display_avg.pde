#include <Streaming.h>
#include <PString.h>
#include <Ports.h>
#include <PortsLCD.h>
#include <RF12.h> // needed to avoid a linker error :(

PortI2C myI2C (4);
LiquidCrystalI2C lcd (myI2C);
BlinkPlug buttons (3);
MilliTimer timer_sample;
MilliTimer timer_blink;
MilliTimer timer_display;
//unsigned long value = 0, avg = 0, on, i = 0;
char on = 0;
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
const int numReadings = 500;

int readings[numReadings];      // the readings from the analog input
int index = 0;                  // the index of the current reading
long total = 0;                  // the running total
int average = 0;                // the average
float deviation;

void setup () {
  buttons.ledOn(1+2);

  Serial.begin(115200);
  Serial << "\n[electret_test]\n";
  // set up the LCD's number of rows and columns: 
  lcd.begin(16, 2);
  // Print a message to the LCD.
  lcd.print("MonitorIsNotEvil");
  for (int thisReading = 0; thisReading < numReadings; thisReading++)
    readings[thisReading] = 0;   

  delay(100);
  buttons.ledOff(1+2);
}
void d(LiquidCrystalI2C s, int i) {
  s << i / 10;
  s << i % 10;
}
void ptime(LiquidCrystalI2C s) {
  unsigned long milliseconds = millis();
  d(s, milliseconds / (1000*60*60));
  d(s, ((milliseconds / 1000) /60) % 60);
  d(s, (milliseconds / 1000) % 60);
}
void loop () {
  if (timer_sample.poll(2)){
    // subtract the last reading:
    total= total - readings[index];        
    // read from the sensor:  
    readings[index] = analogRead(0);
    // add the reading to the total:
    total= total + readings[index];      
    Serial << '%' << millis() << "% |" << readings[index] << "|\n";
    // advance to the next position in the array:  
    index++;                    
    // if we're at the end of the array...
    if (index >= numReadings)              
      // ...wrap around to the beginning:
      index = 0;                            
  }
  if (timer_display.poll(5000)){
    // calculate the average:
    average = total / numReadings;    
    deviation =0;
    for (int i = 0; i < numReadings; i++) 
      deviation += sq(readings[i]-average) ;  
    deviation = sqrt(deviation/numReadings);

    lcd.setCursor(0,1);
    ptime(lcd);
    lcd << ' ' << average << ' ' << deviation;
    Serial << "++" << millis() << "+ ~" << average << "~ |" << deviation << "|\n";
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



