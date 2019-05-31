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
  
  boolean highlight(int x, int y, int x1, int y1){
    return x == x1 && y == y1;
  }
  
  void toDrawBoard(int x, int y, int len, int x1, int y1, int x2, int y2) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        //System.out.println("x: "+ x);
        //System.out.println("y: "+ y);
        //System.out.println(highlight(x,y,x1,y1));
        if (highlight(i,j,x1,y1) || highlight(i,j,x2,y2)){
          System.out.println("highlight");
          fill(75,255);
        } else {
          fill(75,150);
        }
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
         //toDrawCandy(250,50,50);
         }
        }
       }
       return true;
     }
     
  boolean fall() {
    delay(200);
    boolean output = false;
    Candy temp;
      for(int i = 0; i < board[0].length; i++) {
        if(board[0][i] == null) {
           board[0][i] = randomCandy();
           output = true;
         }
         //toDrawCandy(x,y,len);
         //delay(100);
        for(int r = 1; r < board.length; r++) {
          for(int c = board[0].length - 1; c >= 0; c--) {
            if(board[r][c] == null) {
              output = true;
              
              if (board[r - 1][c] != null) {
                temp = new NormalCandy(board[r - 1][c].getName());
                board[r][c] = temp;
                board[r - 1][c] = null;
                output = true;
              }
              
            }
          }
        }
      }
        //toDrawCandy(x,y,len);
        //delay(100);
        return output;
    }
  
  void toDrawCandy(int x, int y, int len) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        if(board[i][j] != null) {
        fill(board[i][j].getColor()[0],board[i][j].getColor()[1],board[i][j].getColor()[2]);
        ellipse(x+len/2 + len * j,y+len/2, len/2, len/2);
        } else {
          //System.out.println("oijwnfdeionsdf");
          fill(75,0);
          rect(x +  len * j,y,len,len);
          //ellipse(x+len/2 + len * j,y+len/2, len/2, len/2);
        }
      }
      y += len;
      x = oriX;
    }
  }
  
  void toDrawCandy2(int x, int y, int len, PImage p) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        if(board[i][j] != null) {
        fill(board[i][j].getColor()[0],board[i][j].getColor()[1],board[i][j].getColor()[2]);
        ellipse(x+len/2 + len * j,y+len/2, len/2, len/2);
        } else {
          //System.out.println("oijwnfdeionsdf");
          //fill(190);
          image(puff, x +  len * j,y);
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
