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
  

  boolean check() {
     for(int r = 0; r < board.length - 2; r++) {
       for(int c = 0; c < board[0].length; c++) {
         if (board[r][c].getName().equals(board[r + 1][c]) && board[r][c].getName().equals(board[r + 2][c])) {
           board[r][c].setPop();
           board[r + 1][c].setPop();
           board[r + 2][c].setPop();
         }
       }
     }
     for(int r = 0; r < board.length; r++) {
       for(int c = 0; c < board[0].length - 2; c++) {
         if (board[r][c].getName().equals(board[r + 1][c].getName()) && board[r][c].getName().equals(board[r + 2][c].getName())) {
           board[r][c].setPop();
           board[r][c + 1].setPop();
           board[r][c + 2].setPop();
         }
       }
     }
}
  boolean pop() {
    for(int r = 0; r < board.length; r++) {
       for(int c = 0; c < board[0].length; c++) {
         board[r][c] = null;
         }
       }
     }

  void toDrawCandy(int x, int y, int len) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        fill(board[i][j].getColor()[0],board[i][j].getColor()[1],board[i][j].getColor()[2]);
        circle(x+len/2,y+len/2, len/2);
        x += len;
      }
      y += len;
      x = oriX;
    }
  }
}