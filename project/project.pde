import java.util.*;
import processing.sound.*;

SoundFile file; //music
SoundFile pop; //sfx

Board b; // where our entire game is run 

PImage bg; //background
PImage[] candies = new PImage[25]; //candy images
PImage[] stars = new PImage[3]; //star images
PImage scoreboard;
PImage puff; //pop animation
PFont font;

int x = 250; //upper left corner
int y = 50;  //of board
int len = 50; //length of each square

boolean demo = false; //demo button to switch game mode
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
        b.shuffle(); // java's shuffle for arrays
        gamestep = 1;
      }
      if (mouseX >= 750 && mouseX <= 910 && mouseY >= 250 && mouseY <= 310){ //restart button
        click = false;
        setup(); // restarts the game
      }
    } else {
      if (mouseX >= 750 && mouseX <= 910 && mouseY >= 250 && mouseY <= 310){ //restart button
        click = false;
        setup(); // restarts the game
      }
    }
    
    if (mouseX >= 780 && mouseX <= 880 && mouseY >= 150 && mouseY <= 200){
      demo = !demo;
      setup(); // demo just lowers the amount of colors on the board
    }
    
  }
}

void setup() {
  size(960, 540); //size of game
  
  //loading sounds
  if(file != null) { 
    file.stop(); //stops the music if there is music playing;
  }
  file = new SoundFile(this, "loop1.mp3"); //loads the music
  file.loop(); // plays the music repeatly
  pop = new SoundFile(this, "pop.mp3"); // loads the SFX
  
  //loading images and fonts
  scoreboard = loadImage("scoreboard.png"); // loads the scoreboard
  scoreboard.resize(200,400);
  bg = loadImage("background.jpg"); // loads the background
  bg.resize(960, 540); 
  background(bg); //sets the background to bg
  puff = loadImage("puffofsmoke.png"); // loads the smokeclouds
  puff.resize(0,50);
  font = createFont("sweetlyBroken.ttf", 32); // our font
  for(int i=0;i<candies.length;i++){ // different candy files need different resizes
    candies[i]=loadImage(str(i) + ".png");
    if ((i-1) % 4 == 0){
      candies[i].resize(0, 37);
    } else {
      candies[i].resize(0, 50);
    }
  }
  for(int i=0;i<stars.length;i++){ // our end game stars
    stars[i]=loadImage(str(i+25) + ".png");
    stars[i].resize(0, 50);
  }
  
  //creating and drawing new board
  b = new Board(9,9,50); // rows is 9, col is 9, length is 50 units
  fill(75,150);
  b.toDrawBoard(x,y, swapx1,swapy1,swapx2,swapy2);
  b.fillempty(); // fills in the null in the board for start game purposes
  b.updatecor(x,y); // updates the cordinates of the x and y of the candies
  
  //updating instance variables
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
  
  update(false); //runs update to check board
}


void update(boolean p) { //update board on screen and draws it;
  background(bg);
  fill(75,150);
  b.drawScoreBoard(scoreboard);
  b.toDrawBoard(x,y,swapx1,swapy1,swapx2,swapy2);
  b.toDrawCandy(x,y, puff, p, candies);
  b.drawRestart();
  b.drawDemo();
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
  
  if (moving) { // our moving variable tells the program if there is still candies that needs to be moved
    moving = b.move(5); //fall animation
  } else {
    
    if (gamestep == 0) { // gamestep 0 is when the player clicks onto the board
      click = true;
      
      if (b.swap(swapx1,swapy1,swapx2,swapy2)) { //check if candies can swap
        gamestep += 1; // goes to gamestep 1
        click = false;
      } else if (run){
        swapx1 = -1;
        swapy1 = -1;
        swapx2 = -1;
        swapy2 = -1;
      }
      
    } else if (gamestep == 1) { //game step 1 pops candy
    
      pop.play();
      b.pop();
      puffed = true;
      gamestep += 1;
      
    } else if(gamestep == 2) { //game step 2 makes the candies fall 
      
      if(b.fall() == false) { 
        gamestep += 1; 
      }
      
    } else if(gamestep == 3) { //game step 3 checks the board
      
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
