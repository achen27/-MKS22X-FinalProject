import java.util.*;

Board b;
PImage bg;
int x = 250;
int y = 50;
int len = 50;

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
}

void draw() {
  b.toDrawCandy(x,y,len);
}
