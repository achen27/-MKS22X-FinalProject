import java.util.*;

class Game {
  Board candyBoard;
    
  Game(int xcor,int ycor) {
    candyBoard = new Board(xcor,ycor);
  }

}
  
Game g;
PImage bg;

void setup() {
  size(960, 540);
  g = new Game(9,9);
  bg = loadImage("background.jpg");
  bg.resize(960, 540);
  fill(93,115,129,80);
  square(10,10,5);
}

void draw() {
  background(bg);
}
