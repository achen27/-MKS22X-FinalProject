class Board {
  Candy[][] board;
  Random ran = new Random();
  
  Board(int rows,int cols) {
    board = new Candy[rows][cols];
  }
  
  void fillempty() {
    for(int row = 0; row < board.length; row++) {
      for(int col = 0; col < board[0].length; col++) {
        board[row][col] = randomCandy();
      }
    }
  }
  
  NormalCandy randomCandy(){
    int temp = ran.nextInt(6);
    if (temp % 6 == 0){
      return new NormalCandy("Red");
    }
    if (temp % 6 == 1) {
      return new NormalCandy("Orange");
    }
    if (temp % 6 == 2) {
      return new NormalCandy("Yellow");
    }
    if (temp % 6 == 3) {
      return new NormalCandy("Green");
    }
    if (temp % 6 == 4) {
      return new NormalCandy("Blue");
    }
    if (temp % 6 == 5) {
      return new NormalCandy("Purple");
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
        rect(x,y,len,len);
        x += len;
      }
      y += len;
      x = oriX;
    }
  }
  

  boolean check() {
    boolean output = false;
     for(int r = 0; r < board.length - 2; r++) {
       for(int c = 0; c < board[0].length; c++) {
         if (board[r][c].getName().equals(board[r + 1][c].getName()) && board[r][c].getName().equals(board[r + 2][c].getName())) {
           board[r][c].setPop();
           board[r + 1][c].setPop();
           board[r + 2][c].setPop();
           output = true;
         }
       }
     }
     for(int r = 0; r < board.length; r++) {
       for(int c = 0; c < board[0].length - 2; c++) {
         if (board[r][c].getName().equals(board[r][c + 1].getName()) && board[r][c].getName().equals(board[r][c + 2].getName())) {
           board[r][c].setPop();
           board[r][c + 1].setPop();
           board[r][c + 2].setPop();
           output = true;
         }
       }
     }
    return output;
  }
  
  boolean pop() {
    for(int r = 0; r < board.length; r++) {
       for(int c = 0; c < board[0].length; c++) {
         if(board[r][c].getPop()) {
         board[r][c] = null;
         System.out.println("row: " +r+" col: " + c);
         //toDrawCandy(250,50,50);
         }
        }
       }
       return true;
     }
     
  void fall(int x, int y, int len) {
    delay(300);
    boolean first = true;
    Candy temp;
    
    while (first) {
      first = false;
      
      for(int i = 0; i < board[0].length; i++) {
        if(board[0][i] == null) {
           board[0][i] = randomCandy();
           first = true;
         }
         //toDrawCandy(x,y,len);
         //delay(100);
        for(int r = board.length - 1; r > 0; r--) {
          for(int c = 0; c < board[0].length; c++) {
            if(board[r][c] == null) {
              first = true;
              
              if (board[r - 1][c] != null) {
                temp = new NormalCandy(board[r - 1][c].getName());
                board[r][c] = temp;
                board[r - 1][c] = null;
                first = true;
              }
              
            }
          }
        }
      }
      
        //toDrawCandy(x,y,len);
        //delay(100);
    }
  }
  
  void toDrawCandy(int x, int y, int len) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        if(board[i][j] != null) {
        fill(board[i][j].getColor()[0],board[i][j].getColor()[1],board[i][j].getColor()[2]);
        ellipse(x+len/2 + len * j,y+len/2, len/2, len/2);
        } else {
          System.out.println("oijwnfdeionsdf");
          fill(190);
          square(x +  len * j,y,len);
          //ellipse(x+len/2 + len * j,y+len/2, len/2, len/2);
        }
      }
      y += len;
      x = oriX;
    }
  }

  String toString() {
    String output = "";
    for(int r = 0; r < board.length; r++) {
      for(int c = 0; c < board[0].length; c++) {
        output += board[r][c] + "      ";
      }
      output += "\n";
    }
    return output;
  }
  String toString2() {
    String output = "";
    for(int r = 0; r < board.length; r++) {
      for(int c = 0; c < board[0].length; c++) {
        output += board[r][c].getPop() + "      ";
      }
      output += "\n";
    }
    return output;
    
  }
  
  boolean swap(int x1, int y1, int x2, int y2){
    if(x1 == x2 && y1 == y2){
      return false;
    }
    if(x1 == x2 && y1 == y2){
      return false;
    }
    if ((x1 == x2 && Math.abs(y1-y2) == 1) || (y1 == y2 && Math.abs(x1-x2) == 1)){
      Candy temp = board[x1][y1];
      board[x1][y1] = board[x2][y2];
      board[x2][y2] = temp;
      //toDrawCandy(x,y,len);
      //delay(100);
      if (check()){
        return true;
      }
      temp = board[x1][y1];
      board[x1][y1] = board[x2][y2];
      board[x2][y2] = temp;
      return false;
    } else {
      return false;
    }
  }
}
