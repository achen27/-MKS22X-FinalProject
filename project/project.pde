import java.util.*;

Board b;
PImage bg;
int x = 250;
int y = 50;

boolean once = false;
boolean moving = false;

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
    update(0);
  } else {
    swapy2 = (mouseX - x) / 50;
    swapx2 = (mouseY - y) / 50;
    first = true;
    fill(0);
    rect(0,0, 100,100);
    run = true;
    update(0);
  }
}

void setup() {
  //frameRate(3);
  size(960, 540);
  b = new Board(9,9,50);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  background(bg);
  fill(190);
  //square(50,80,52);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2,0);
  b.fillempty();
  //b.toDrawCandy(x,y,len
  puff = loadImage("puffofsmoke.png");
  puff.resize(0,50);
}


void update(int t) {
  background(bg);
  fill(75,150);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2,t);
  b.toDrawCandy(x,y);
  textSize(20);
  text(b.points, 10, 200); 
}

void update2() {
  background(bg);
  fill(75,150);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2,0);
  textSize(20);
  text(b.points, 10, 200); 
  b.toDrawCandy2(x,y, puff);
}

void draw() {
  if (gamestep != 0 && gamestep != 1){
    update(0);
  }
  
  if (gamestep == 1){
    swapx1 = -1;
    swapy1 = -1;
    swapx2 = -1;
    swapy2 = -1;
  }
  
  //delay(200);
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
  if (moving) {
    moving = b.move();
  }
  else {
    if (gamestep == 0) {
    if (b.swap(swapx1,swapy1,swapx2,swapy2)) {
      update(1);
      delay(200);
      gamestep += 1;
      
    } else if (run){
      update(2);
      delay(200);
      swapx1 = -1;
      swapy1 = -1;
      swapx2 = -1;
      swapy2 = -1;
    }
  } else if (gamestep == 1) {
    //delay(200);
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
  if (gamestep == 0 && run){
    update(2);
    delay(200);
    run = false;
  } else if (gamestep == 1){
    update(1);
    delay(200);
  }
  b.updatecor(x,y);
  moving = true;
  }
}
