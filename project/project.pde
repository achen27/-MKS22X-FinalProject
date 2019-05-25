import java.util.*;

Board b;
PImage bg;
int x = 250;
int y = 50;
int len = 50;
boolean once = false;

boolean first = true;
boolean run = false;
int swapx1;
int swapy1;
int swapx2;
int swapy2;

void mouseClicked(){
  if (first){
    swapy1 = (mouseX - x) / 50;
    swapx1 = (mouseY - y) / 50;
    first = false;
  } else {
    swapy2 = (mouseX - x) / 50;
    swapx2 = (mouseY - y) / 50;
    first = true;
    fill(0);
    rect(0,0, 100,100);
    run = true;
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
void game() {
  b.pop();
  b.fall();
  if (b.check()) {
    game();
  }
  
}
void draw() {
  
    fill(0);
  rect(0,0, 100,100);
  fill(255);
  text(swapx1, 10, 10);
  text(swapy1, 10, 40);
  text(swapx2, 20, 10);
  text(swapy2, 20, 40);
  text(mouseX, 40, 10);
  text(mouseY, 40, 40);
  b.toDrawCandy(x,y,len);
  System.out.println(b);
  if (run && b.swap(swapx1,swapy1,swapx2,swapy2)){
    System.out.println("aidj");
    b.toDrawCandy(x,y,len);
    run = false;
    game();
  }
}
