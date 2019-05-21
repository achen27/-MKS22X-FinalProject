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
      return new NormalCandy(xvalue,yvalue,"Orange");
    }
    if (temp % 6 == 2) {
      return new NormalCandy(xvalue,yvalue,"Yellow");
    }
    if (temp % 6 == 3) {
      return new NormalCandy(xvalue,yvalue,"Green");
    }
    if (temp % 6 == 4) {
      return new NormalCandy(xvalue,yvalue,"Blue");
    }
    if (temp % 6 == 5) {
      return new NormalCandy(xvalue,yvalue,"Purple");
    }
    return null;
  }
  
  
  void reset() {
    board = new Candy[board.length][board[0].length];
  }
  
  void toDrawBoard(int x, int y, int len) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        square(x,y,len);
        x += len;
      }
      y += len;
      x = oriX;
    }
  }
  
  void toDrawCandy(int x, int y, int len) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        fill(board[i][j].getColor());
        circle(x+len/2,y+len/2, len/2);
        x += len;
      }
      y += len;
      x = oriX;
    }
  }
}
