Space[]Star;
Particles[] Right;
Particles[] Left;


class Space
{
  double myX, myY, mySize, myColor, myAngle, mySpeed;

  Space() {
    myX=500;
    myY=100;
    mySize=8;
    mySpeed=(Math.random()*10);
    myAngle=(Math.random()*2)*Math.PI;
  }

  void show() {
    fill(255, 255, 255);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void move() {
    myX=myX+Math.cos(myAngle)*mySpeed;
    myY=myY+Math.sin(myAngle)*mySpeed;
  }
}//end class

class Shootingstar extends Space
{
  Shootingstar() {
    myX=500;
    myY=100;
    mySize=10;
    mySpeed=Math.random()*10;
    myAngle=(Math.random()*2)*Math.PI;
  }
  void show()
  {
    fill(246, 89, 146);
    rect((float)(myX), (float)(myY), (float)(mySize), (float)(mySize));
  }
}


class Particles
{
  double myX, myY, mySize, mySpeed, myAngle;
  int myColor, myOpacity;
  Particles(int x, int y, double angle, double secondangle) {
    myX=x;
    myY=y;
    mySize=20;
    myColor=color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySpeed=(int)(Math.random()*10);
    myAngle=((Math.random()*angle))*Math.PI+secondangle;
    myOpacity=(int)(Math.random()*40)+60;
  }

  void move() {
    myX=myX+Math.cos(myAngle)*mySpeed;
    myY=myY+Math.sin(myAngle)*mySpeed;
  }

  void show() {
    noStroke();
    fill(myColor, myOpacity);
    rect((float)myX, (float)myY, (float)10, (float)5);
    fill(0);
    rect(425, 350, 150, 300);
    triangle(425, 350, 575, 350, 500, 200);
    fill(0);
    triangle(425, 550, 390, 550, 425, 400);
    triangle(575, 550, 610, 550, 575, 400);
  }
}//end class


void setup() {
  frameRate(60);
  size(1000, 1000);
  // Particles(int x, int y, double angle, double secondangle)
  Right = new Particles[800];
  for (int i = 0; i<Right.length; i++) {
    Right[i]=new Particles(575, 650, 0.3, 0.3);
  }

  Left = new Particles[500];
  for (int i = 0; i<Left.length; i++) {
    Left[i]=new Particles(425, 650, 0.3, 2);
  }
  Star =new Space[500];
  for (int i=0; i<Star.length; i++) {
    Star[i]=new Space();
  }

  for (int i=100; i<500; i+=50) {
    Star[i]= new Shootingstar();
  }
}

void draw() {
  background(0, 0, 139);
  for (int i=0; i<Star.length; i++) {
    Star[i].move();
    Star[i].show();
  }

  for (int i=0; i<Right.length; i++) {
    Right[i].show();
    Right[i].move();
  }
  for (int i=0; i<Left.length; i++) {
    Left[i].show();
    Left[i].move();
  }
}







