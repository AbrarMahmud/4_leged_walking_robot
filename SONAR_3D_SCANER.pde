import peasy.*;
import processing.serial.*;



boolean state=true;
PeasyCam cam;
Class Scan;
String myText="";
Serial myPort;
int[] list=new int[3];
ArrayList<Scan> scan;

//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
void setup()
{
  fullScreen(P3D);
  // size(300,300,P3D);
  background(0);
  myPort=new Serial(this, "COM10", 9600);
  myPort.bufferUntil('\n');
  scan=new ArrayList<Scan>();

  cam=new PeasyCam(this, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}
//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
void serialEvent(Serial myPort)
{
  if (state)
  {
    myText=myPort.readStringUntil('\n');
    myText=trim(myText);
    list=int(split(myText, ','));
    if(list[0]==0){list[0]=200;}
    
  }
}
//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
void draw()
{
directionalLight(200, 200,200, 0, 300, 100);
  background(0);
  if (state)
  {
    scan.add(new Scan(list[0], list[1], list[2]));
  }


  for (Scan s : scan)
  {
    s.display();
  }


}

//..........................................................

void keyPressed()
{
  if (key=='A')
  {
    background(0);
  }
  if (key=='R')
  {
    state=!state;
  }
}
