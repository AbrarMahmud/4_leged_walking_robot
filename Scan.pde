class Scan
{
  int len_;
  int angle_;
  int he_;
  float List;
  Scan(int len, int angle, int he)
  {
    len_=len;
    angle_=angle;
    he_=he;
  }

  void display()
  {
    //.........................3 BASIC LINE FOR BAACKGROUND............................
    strokeWeight(1);
    stroke(255, 20);
    line(-height/4, 0, 0, height/4, 0, 0);
    line(0, 0, 0, 0, -height/4, 0);
    strokeWeight(1);
    stroke(255, 0, 0);
    line(0, 0, 0, 0, 0, height/4);



    
    pushMatrix();
   


   

    stroke(255, 0, 0, 2);      //......................STROKE OF THE RED LINE..............
    fill(255, 0, 0, 4);      //.......................CLOLOR OF THE RED LINE..............


    rotateZ(-radians(angle_)+PI/2);                  //..ROTATE THE RED LINE AROUND THE CENTER................
    rotateX(-radians(he_));                          //..INCRESE LAYER HEIGHT AFTER EVERY HALF ARC SCAN........
    translate(0, -height/8, 0);                      //..TRANSLATE THE 3D BOX (RED LINE) TO A PROPER LOCATION 
                                                     //   SO THAT THE PeasyCam CAN SHOW THE SCAN PROPERLY....................
    
  // box(2, height/4, 2);
    translate(0, height/8, 0);                       // TRANSLATE THE BOX POSITION BACK SO THE PREVIOUS Translate(); FUNCTION 
                                                     // WOULD NOT EFFECT THE NEXT BOX DRAWN IN THE SAME P.Display(); FUNCTION


    List =map(len_, 0, 200, 0, height/4);

    

    translate(0, -List/2, 0);                        //TRANSLATE THE INNER WHITE LINE TO PROPER LOCATION (   THESE PARAMETER WHERER ACHIEVED VIA TRIAL AND ERROR  )
    stroke(255, 15);
    fill(255, 255, 255, 50);
    box(2, List, 3);


    popMatrix();
  }
}
