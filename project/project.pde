import java.util.*;

Board b;
PImage bg;
int x = 250;
int y = 50;
int len = 50;
boolean once = false;

int swapx1;
int swapy1;
int swapx2;
int swapy2;

void mouseclciked()

void setup() {
  size(960, 540);
  b = new Board(9,9);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  background(bg);
  fill(75,150);
  //square(50,80,52);
  b.toDrawBoard(x,y,len);
  b.fillempty();
  //b.toDrawCandy(x,y,len);
}

void draw() {
  if (!once) {
  b.check();
  System.out.println(b.toString2());
  b.pop();  
  b.fall();
  b.toDrawCandy(x,y,len);
  System.out.println(b);
  once = true;
  }
}
