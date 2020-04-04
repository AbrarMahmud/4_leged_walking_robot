import processing.video.*;
Capture video;
color rgb=color(255,0,0);
//color rgb;

int x_,y_;
void setup()
{
size(640,360);

video=new Capture(this,640,360);
video.start();
}
void captureEvent(Capture video)
 {
video.read();
}



void draw()
{
  float max=500;
 image(video,0,0);
loadPixels();

for(int x=0;x<width;x++){

  for(int y=0;y<height;y++)
  {
  int loc =x+y*width;
  float r1=red(video.pixels[loc]);
  float g1=green(video.pixels[loc]);
  float b1=blue(video.pixels[loc]);
  
  float r2=red(rgb);
  float g2=green(rgb);
  float b2=blue(rgb);
  
 float dis=dist(r1,g1,b1,r2,g2,b2);
  //pixels[loc]=video.pixels[loc];
 if(dis<max) 
 {
 max=dis;
 x_=x;
 y_=y;
 
 
 }

 
  
  
  
   }



}



updatePixels();
  
fill(255);
rect(x_,y_,20,20);
  
  
}

void mousePressed()
{
rgb=get(mouseX,mouseY);


}
