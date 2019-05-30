import java.util.*;

Board b;
PImage bg;
int x = 250;
int y = 50;
int len = 50;
boolean once = false;
boolean dogame = false;

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
  //frameRate(3);
  size(960, 540);
  b = new Board(9,9);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  background(bg);
  fill(190);
  //square(50,80,52);
  b.toDrawBoard(x,y,len);
  b.fillempty();
  game0();
  //b.toDrawCandy(x,y,len);
  game();
}

void game0() {
  b.pop();
  System.out.println(b.toString());
  fill(190);
  b.toDrawBoard(x,y,len);
  b.toDrawCandy(x,y,len);
  System.out.println("NULLLL");
  dogame = true;
}

void update() {
  fill(190);
  b.toDrawBoard(x,y,len);
  b.toDrawCandy(x,y,len);
}

void game1() {
  b.fall(x,y,len);
  dogame = false;
  System.out.println(dogame);
  if(b.check()) {
    System.out.println("Loooppp");
    game0();
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


  if (run && b.swap(swapx1,swapy1,swapx2,swapy2)){
    System.out.println("aidj");
    run = false;
    game0();
  }
  update();
  delay(500);
  
  if(dogame) {
    System.out.println("pt2 " + dogame);
    game1();
    delay(500);
  }
}
