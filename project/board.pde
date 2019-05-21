class Board {
  Candy[][] board;
  Random ran = new Random();
  
  Board(int rows,int cols) {
    board = new Candy[rows][cols];
  }
  
  void fillempty() {
    for(int row = 0; row < board.length; row++) {
      for(int col = 0; col < board[0].length; col++) {
        board[row][col] = randomCandy(row,col);
      }
    }
  }
  
  NormalCandy randomCandy(int xvalue,int yvalue){
    int temp = ran.nextInt(6);
    if (temp % 6 == 0){
      return new NormalCandy(xvalue,yvalue,"Red");
    }
    if (temp % 6 == 1) {
      return new NormalCandy(xvalue,yvalue,"Blue");
    }
    if (temp % 6 == 2) {
      return new NormalCandy(xvalue,yvalue,"Green");
    }
    if (temp % 6 == 3) {
      return new NormalCandy(xvalue,yvalue,"Yellow");
    }
    if (temp % 6 == 4) {
      return new NormalCandy(xvalue,yvalue,"Purple");
    }
    if (temp % 6 == 5) {
      return new NormalCandy(xvalue,yvalue,"Pink");
    }
    return null;
  }
  
  
  void reset() {
    board = new Candy[board.length][board[0].length];
  }
  
  String toString() {
    String output = "[";
    for(int row = 0; row < board.length; row++) {
      for(int col = 0; col < board[0].length; col++) {
        output += board[row][col] + "   ";
      }
      output += "\n";
    }
    return output + "]";
  }
}
