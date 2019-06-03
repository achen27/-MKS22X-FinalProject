import java.util.*;

Board b;
PImage bg;
PImage[] candies = new PImage[25];
int x = 250;
int y = 50;
int len = 50;

boolean once = false;
boolean moving = false;
boolean puffed = false;

boolean first = true;
boolean run = false;
int swapx1 = -1;
int swapy1 = -1;
int swapx2 = -1;
int swapy2 = -1;
int gamestep = 1;
PImage puff;
PFont font;


void mouseClicked(){
  if (first){
    swapy1 = (mouseX - x) / 50;
    swapx1 = (mouseY - y) / 50;
    first = false;
    update(false);
  } else {
    swapy2 = (mouseX - x) / 50;
    swapx2 = (mouseY - y) / 50;
    first = true;
    fill(0);
    rect(0,0, 100,100);
    run = true;
    update(false);
  }
}

void setup() {
  //frameRate(3);
  size(960, 540);
  for(int i=0;i<candies.length;i++){
    candies[i]=loadImage(str(i) + ".png");
    if ((i-1) % 4 == 0){
      candies[i].resize(0, 37);
    } else {
      candies[i].resize(0, 50);
    }
  }
  b = new Board(9,9,50);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  background(bg);
  fill(75,150);
  //square(50,80,52);
  b.toDrawBoard(x,y, swapx1,swapy1,swapx2,swapy2);
  b.fillempty();
  //b.toDrawCandy(x,y,len
  puff = loadImage("puffofsmoke.png");
  puff.resize(0,50);
  font = createFont("sweetlyBroken.ttf", 32);
  b.updatecor(x,y);
}


void update(boolean p) {
  background(bg);
  fill(75,150);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2);
  b.toDrawCandy(x,y, puff, p, candies);
  textSize(20);
  fill(255);
  textFont(font);
  text(b.points, 10, 200); 
}

void draw() {
  //delay(50);
  update(false);
  if(puffed){
      update(true);
      puffed = false;
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
  text(mouseY, 40, 40);
  
  if (moving) {
    moving = b.move(6);
  } else {
    if (gamestep == 0) {
      if (b.swap(swapx1,swapy1,swapx2,swapy2)) {
        gamestep += 1;
      } else if (run){
        swapx1 = -1;
        swapy1 = -1;
        swapx2 = -1;
        swapy2 = -1;
      }
    } else if (gamestep == 1) {
      //delay(200);
      b.pop();
      puffed = true;
      System.out.println("pufff");
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
        System.out.println(b.toString());
      }
    }
  
    if (gamestep == 0 && run){
      //update();
      run = false;
    }
    
    b.updatecor(x,y);
    moving = true;
  }
}
