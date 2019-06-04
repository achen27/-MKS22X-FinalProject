import java.util.*;
import processing.sound.*;

SoundFile file; //music
SoundFile pop; //sfx

Board b;

PImage bg; //background
PImage[] candies = new PImage[25]; //candy images
PImage[] stars = new PImage[3]; //star images
PImage scoreboard;
PImage puff; //pop animation
PFont font;

int x = 250; //upper left corner
int y = 50;  //of board
int len = 50; //length of each square

boolean end; //game ending
boolean moving; //fall animation
boolean puffed; //pop animation
boolean click; //restricting when player can click
boolean first; //keeping track of first or second click
boolean run; //after second click a check is run through the board

int swapx1; //coordinates of two candies
int swapy1;
int swapx2;
int swapy2;

int gamestep; //separated game steps for animation purposes


void mousePressed(){
  if (click){ //check if player is allowed to click
    if (!end){
      if (first){ //updates first candy coordinates
        swapy1 = (mouseX - x) / 50;
        swapx1 = (mouseY - y) / 50;
        first = false;
        update(false);
      } else { //updates second candy coordinates
        swapy2 = (mouseX - x) / 50;
        swapx2 = (mouseY - y) / 50;
        first = true;
        run = true;
        update(false);
      }
      if (mouseX >= 80 && mouseX <= 160 && mouseY >= 275 && mouseY <= 350){ //shuffle button
        click = false;
        b.shuffle();
        gamestep = 1;
      }
      if (mouseX >= 750 && mouseX <= 910 && mouseY >= 250 && mouseY <= 310){ //restart button
        click = false;
        setup();
      }
    } else {
      if (mouseX >= 750 && mouseX <= 910 && mouseY >= 250 && mouseY <= 310){ //restart button
        click = false;
        setup();
      }
    }
  }
}

void setup() {
  size(960, 540); //size of game
  
  //loading sounds
  if(file != null) { 
    file.stop();
  }
  file = new SoundFile(this, "loop1.mp3");
  file.loop();
  pop = new SoundFile(this, "pop.mp3");
  
  //loading images and fonts
  scoreboard = loadImage("scoreboard.png");
  scoreboard.resize(200,400);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  background(bg);
  puff = loadImage("puffofsmoke.png");
  puff.resize(0,50);
  font = createFont("sweetlyBroken.ttf", 32);
  for(int i=0;i<candies.length;i++){ 
    candies[i]=loadImage(str(i) + ".png");
    if ((i-1) % 4 == 0){
      candies[i].resize(0, 37);
    } else {
      candies[i].resize(0, 50);
    }
  }
  for(int i=0;i<stars.length;i++){
    stars[i]=loadImage(str(i+25) + ".png");
    stars[i].resize(0, 50);
  }
  
  //creating and drawing new board
  b = new Board(9,9,50);
  fill(75,150);
  b.toDrawBoard(x,y, swapx1,swapy1,swapx2,swapy2);
  b.fillempty();
  b.updatecor(x,y);
  
  //updating instance variables
  update(false);
  end = false;
  moving = false;
  puffed = false;
  click = false;
  first = true;
  run = false;
  swapx1 = -1;
  swapy1 = -1;
  swapx2 = -1;
  swapy2 = -1;
  gamestep = 1;
}


void update(boolean p) { //update board on screen
  background(bg);
  fill(75,150);
  b.drawScoreBoard(scoreboard);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2);
  b.toDrawCandy(x,y, puff, p, candies);
  b.drawRestart();
}

void draw() {
  update(false);
  
  if(puffed){ //runs update with pop animation
      update(true);
      puffed = false;
   }
  
  if (gamestep == 1){ //resets coordinates
    swapx1 = -1;
    swapy1 = -1;
    swapx2 = -1;
    swapy2 = -1;
  }
  
  if (moving) {
    moving = b.move(5); //fall animation
  } else {
    
    if (gamestep == 0) {
      click = true;
      
      if (b.swap(swapx1,swapy1,swapx2,swapy2)) { //check if candies can swap
        gamestep += 1;
        click = false;
      } else if (run){
        swapx1 = -1;
        swapy1 = -1;
        swapx2 = -1;
        swapy2 = -1;
      }
      
    } else if (gamestep == 1) { //pops candy
    
      pop.play();
      b.pop();
      puffed = true;
      gamestep += 1;
      
    } else if(gamestep == 2) { //fall animation
      
      if(b.fall() == false) { 
        gamestep += 1; 
      }
      
    } else if(gamestep == 3) {
      
      if(b.check()) { //repeats from pop if there are still combinations on the board
        gamestep = 1;
      } else {
        
        if (b.moves == 0){ //ends game if no moves left
          b.endgame();
          end = true;
        }
        
        gamestep = 0; 
      }
      
    }
  
    if (gamestep == 0 && run){ //stops running check
      run = false;
      click = true;
    }
    
    b.updatecor(x,y); //updates coordinates of candies
    moving = true;
  }
  
  if (end){ //draw ending pop-up
    b.drawEnd(stars);
  }
}
