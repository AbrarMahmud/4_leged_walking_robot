
#include<Wire.h>
#include<Adafruit_PWMServoDriver.h>

Adafruit_PWMServoDriver pwm =Adafruit_PWMServoDriver();
#define SERVOMIN 130
#define SERVOMAX 490
#define SERVO_FREQ 60
#define prePwm 0


boolean state1=true,state2=false,state3=true,state4=false;

void setup() 
{

  Serial.begin(9600);
  
pwm.begin();
pwm.setOscillatorFrequency(27000000);
pwm.setPWMFreq(SERVO_FREQ);

delay(10);
}




//...............................................................................................

void loop() {

  //sharp 90 degree trurns required 14 steps in left or right function

  //...................WRITE YOUR COMMAND HERE.....................//

forward(4);delay(500);
left(14);delay(500);
forward(4);delay(500);
right(14);delay(500);







}








//...................................................................................................
float deg(int servo ,int deg_)
{
 float pwm_=map(deg_,0,180,SERVOMIN,SERVOMAX);

  pwm.setPWM(servo,0,pwm_);

 return pwm_;
  }
//....................................................................................................


void forward(int steps)
{
  for(int i=0;i<steps;i++)
  {
    deg(5,60);deg(6,120);deg(8,120);deg(11,60);delay(500);   //reset motor position

    if(state1){deg(6,50);deg(11,130);delay(500);}
    deg(5,130);deg(8,50);delay(500);
    if(state2){deg(6,50);deg(11,130);delay(500);}
    
     deg(5,60);deg(6,120);deg(8,120);deg(11,60);delay(500);   //reset motor position

    state1=!state1;
    state2=!state2;
    }
  
 }
//.....................................................................................................
 void backward(int steps)
{
  for(int i=0;i<steps;i++)
  {
    deg(5,120);deg(6,60);deg(8,60);deg(11,120);delay(500);   //reset motor position

    if(state3) {deg(6,130);deg(11,50);delay(500);}
    deg(5,50);deg(8,130);delay(500);
    if(state4) {deg(6,130);deg(11,50);delay(500);}

    deg(5,120);deg(6,60);deg(8,60);deg(11,120);delay(500);   //reset motor position

    state3=!state3;
    state4=!state4;
    
    }
  
  
  }
//........................................................................................
  void left(int steps)
  {
    for(int i=0;i<steps;i++)
    {



deg(5,90);deg(6,90);deg(8,90);deg(11,90);delay(500);
deg(5,50);deg(8,50);delay(300);
deg(6,50);delay(500);
deg(11,50);delay(400);



deg(11,90);deg(8,90);delay(350);
deg(8,90);deg(5,90);deg(6,90);delay(350);



}
    }
//............................................................................................
void right(int steps)
{
  for(int i=0;i<steps;i++)
    {
deg(5,90);deg(6,90);deg(8,90);deg(11,90);delay(500);
deg(6,130);deg(11,130);delay(300);
deg(5,130);delay(500);
deg(8,130);delay(400);


deg(11,90);deg(8,90);delay(350);
deg(11,90);deg(5,90);deg(6,90);delay(350);

    }


   
  }
    
