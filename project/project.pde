import java.util.*;

Board b;
PImage bg;

void setup() {
  size(960, 540);
  b = new Board(9,9);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  background(bg);
  fill(75,150);
  //square(50,80,52);
  b.toDraw(250,50,50);
}

void draw() {
  
}
