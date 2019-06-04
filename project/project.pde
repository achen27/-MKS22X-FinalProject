import java.util.*;
import processing.sound.*;

SoundFile file;
SoundFile pop;
Board b;
PImage bg;
PImage[] candies = new PImage[25];
PImage scoreboard;
int x = 250;
int y = 50;
int len = 50;
boolean end = false;

boolean once = false;
boolean moving = false;
boolean puffed = false;
boolean click = false;

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
  if (click){
    if (!end){
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
      if (mouseX >= 80 && mouseX <= 160 && mouseY >= 275 && mouseY <= 350){
        click = false;
        b.shuffle();
        gamestep = 1;
      }
      if (mouseX >= 750 && mouseX <= 910 && mouseY >= 250 && mouseY <= 310){
        click = false;
        setup();
      }
    } else {
      if (mouseX >= 750 && mouseX <= 910 && mouseY >= 250 && mouseY <= 310){
        click = false;
        setup();
      }
    }
  }
}

void setup() {
  if(file != null) {
    file.stop();
  }
  file = new SoundFile(this, "loop1.mp3");
  file.loop();
  pop = new SoundFile(this, "pop.mp3");
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
  scoreboard = loadImage("scoreboard.png");
  scoreboard.resize(200,400);
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
  update(false);
}


void update(boolean p) {
  background(bg);
  fill(75,150);
  b.drawScoreBoard(scoreboard);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2);
  b.toDrawCandy(x,y, puff, p, candies);
  b.drawRestart();
}

void draw() {
  //delay(50);
  System.out.println(click);
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
  /*fill(0);
  shapeMode(CORNER);
  rect(0,0,100,100);
  fill(255);
  textSize(20);
  text(swapx1, 10, 20);
  text(swapy1, 10, 50);
  text(swapx2, 20, 20);
  text(swapy2, 20, 50);
  text(mouseX, 40, 20);
  text(mouseY, 40, 50);
  text(mouseY, 40, 50);*/
  
  if (moving) {
    moving = b.move(5);
  } else {
    if (gamestep == 0) {
      click = true;
      if (b.swap(swapx1,swapy1,swapx2,swapy2)) {
        gamestep += 1;
        click = false;
      } else if (run){
        swapx1 = -1;
        swapy1 = -1;
        swapx2 = -1;
        swapy2 = -1;
      }
    } else if (gamestep == 1) {
      //delay(200);
      pop.play();
      b.pop();
      puffed = true;
      //System.out.println("pufff");
      gamestep += 1;
    } else if(gamestep == 2) {
      if(b.fall() == false) {
        gamestep += 1; 
      }
    } else if(gamestep == 3) {
      if(b.check()) {
        gamestep = 1;
      } else {
        if (b.moves == 0){
          b.endgame();
          end = true;
          System.out.println("end");
        }
        gamestep = 0; 
        //System.out.println(b.toString());
      }
    }
  
    if (gamestep == 0 && run){
      //update();
      run = false;
      click = true;
    }
    
    //System.out.println(gamestep);
    
    b.updatecor(x,y);
    moving = true;
  }
}
