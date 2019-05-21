class Game{
  
  Board candyBoard;
  
  Game(int xcor,int ycor) {
    candyBoard = new Board(xcor,ycor);
  }
  
  String toString() {
    return candyBoard + "";
  }
  
}
