import java.util.*;

Board b;
PImage bg;
int x = 250;
int y = 50;
int len = 50;
boolean once = false;

boolean first = true;
int swapx1;
int swapy1;
int swapx2;
int swapy2;

void mouseClicked(){
  if (first){
    swapx1 = (mouseX - x) / 50;
    swapy1 = (mouseY - y) / 50;
    first = false;
  } else {
    swapx2 = (mouseX - x) / 50;
    swapy2 = (mouseY - y) / 50;
    first = true;
  }
}

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
  text(swapx1, 10, 10);
  b.toDrawCandy(x,y,len);
  System.out.println(b);
  if (first){
    b.swap(swapx1,swapy1,swapx2,swapy2);
    b.toDrawCandy(x,y,len);
  }
}
