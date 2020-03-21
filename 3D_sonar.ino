#include <Servo.h>

#include <NewPing.h>

#define TRIGGER_PIN  A0// Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN    A1  // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 200 // Maximum distance we want to ping for (in centimeters). Maximum sensor distance is rated at 400-500cm.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.

Servo myServo,myServo2;

int S;
int p=0,q=180;
boolean state1=true,state2=false;

void setup() {
  Serial.begin(9600);
  myServo.attach(10);
  myServo2.attach(9);
}

void loop() {
//..........................................................
for(int j=10;j<=90;j=j+1)
{ 
  if(state1)
  { 
for(int i=p;i<=q;i++)
{
  myServo.write(i);
  myServo2.write(j);
  S=sonar.ping_cm();

  Serial.print(S);
  Serial.print(",");
  Serial.print(i);
  Serial.print(",");
  Serial.println(j);
delay(50);

   
 }}


//.....................
if(state2)
{

for(int i=180;i>=0;i--)
{
  myServo.write(i);
  myServo2.write(j);
  S=sonar.ping_cm();

  Serial.print(S);
  Serial.print(",");
  Serial.print(i);
  Serial.print(",");
  Serial.println(j);
  delay(50);
 }}
 
state1=!state1;
state2=!state2;
 
 }
 //....................................................................
 
}
