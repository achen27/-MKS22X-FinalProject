import java.util.*;

class Game {
  Board candyBoard;
    
  Game(int xcor,int ycor) {
    candyBoard = new Board(xcor,ycor);
  }

}
  
Game g;


void setup() {
  size(600, 500);
  g = new Game(10,10);
}
