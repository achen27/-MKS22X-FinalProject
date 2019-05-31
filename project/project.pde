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
int swapx1 = -1;
int swapy1 = -1;
int swapx2 = -1;
int swapy2 = -1;
int gamestep = 1;
PImage puff;








void mouseClicked(){
  if (first){
    swapy1 = (mouseX - x) / 50;
    swapx1 = (mouseY - y) / 50;
    first = false;
    update();
  } else {
    swapy2 = (mouseX - x) / 50;
    swapx2 = (mouseY - y) / 50;
    first = true;
    fill(0);
    rect(0,0, 100,100);
    run = true;
    update();
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
  b.toDrawBoard(x,y,len,swapx1,swapy1,swapx2,swapy2);
  b.fillempty();
  //b.toDrawCandy(x,y,len
  puff = loadImage("puffofsmoke.png");
  puff.resize(0,50);
}


void update() {
  background(bg);
  fill(75,150);
  b.toDrawBoard(x,y,len,swapx1,swapy1,swapx2,swapy2);
  b.toDrawCandy(x,y,len);
}

void update2() {
  background(bg);
  fill(75,150);
  b.toDrawBoard(x,y,len,swapx1,swapy1,swapx2,swapy2);
  b.toDrawCandy2(x,y,len, puff);
}

void draw() {
  update();
  fill(0);
  rect(0,0, 100,100);
  fill(255);
  text(swapx1, 10, 10);
  text(swapy1, 10, 40);
  text(swapx2, 20, 10);
  text(swapy2, 20, 40);
  text(mouseX, 40, 10);
  text(mouseY, 40, 40);
  /*if (gamestep != 1) {
    update();
  } else {
    update2();
    gamestep += 1;
    delay(500);
  }*/
  //delay(100);
  
  if(gamestep == 0) {
    if (b.swap(swapx1,swapy1,swapx2,swapy2)) {
      swapx1 = -1;
      swapy1 = -1;
      swapx2 = -1;
      swapy2 = -1;
      gamestep += 1;
    }
  } else if (gamestep == 1) {
    b.pop();
    update2();
    gamestep += 1;
  } else if(gamestep == 2) {
    if(b.fall() == false) {
     gamestep += 1; 
    }
  } else if(gamestep == 3) {
    if(b.check()) {
      gamestep = 1;
    } else {
     gamestep = 0; 
    }
  }
}
