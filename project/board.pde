class Board {
  Candy[][] board;
  Random ran = new Random();
  int points;
  int moves;
  int len;
  
  Board(int rows,int cols,int leng) {
    len = leng;
    board = new Candy[rows][cols];
    points = 0;
    moves = 20;
  }
  
  boolean shuffle(){
    if (moves >= 5){
      List<Candy> b = new ArrayList();
      for (int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
         b.add(board[i][j]);
        }
      }
      Collections.shuffle(b);
      int a = 0;
      for (int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
          board[i][j] = b.get(a);
          a++;
        }
      }
      moves -= 5;
      return true;
    }
    return false;
  }
  
  void clear(){
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        board[i][j] = null;
      }
      
    }
  }
  
  void endgame(){
    delay(200);
    clear();
  }
  
  void drawScoreBoard(PImage scoreboard){
    imageMode(CORNER);
    image(scoreboard,20,0);
    textFont(font);
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("shuffle", 120, 320);
    textSize(35);
    fill(255);
    text(b.points, 120, 243);
    textSize(90);
    text(b.moves, 120, 63);
    textSize(70);
    text("20,000", 120, 165);
  }
  
  void drawRestart(){
    fill(235,70,250);
    stroke(235,70,250);
    rect(750, 250, 160, 60,20,20,20,20);
    textAlign(CENTER);
    fill(255);
    textSize(70);
    text("Restart", 830, 295);
  }
  
  void fillempty() {
    for(int row = 0; row < board.length; row++) {
      for(int col = 0; col < board[0].length; col++) {
        board[row][col] = randomCandy();
      }
    }
    
    for(int r = 0; r < board.length;r++) {
      for(int c = 0; c < board[0].length; c ++) {
        if(board[r][c] != null) {
          board[r][c].endX = x + len/2 + len * c;
          board[r][c].endY = y + len * r +  len/2;
          board[r][c].xCor = x + len/2 + len * c;
          board[r][c].yCor = y + len * r +  len/2;
        }
      }
    }
  }
  
  NormalCandy randomCandy(){
    int temp = ran.nextInt(6);
    NormalCandy output = null;
    if (temp == 0){
      output = new NormalCandy("Red");
    }
    if (temp == 1) {
      output = new NormalCandy("Orange");
    }
    if (temp == 2) {
      output = new NormalCandy("Yellow");
    }
    if (temp == 3) {
      output = new NormalCandy("Green");
    }
    if (temp == 4) {
      output = new NormalCandy("Blue");
    }
    if (temp == 5) {
      output = new NormalCandy("Purple");
    }
    return output;
  }
  
  
  void reset() {
    board = new Candy[board.length][board[0].length];
  }
  
  boolean highlight(int x, int y, int x1, int y1){
    return x == x1 && y == y1;
  }
  
  void toDrawBoard(int x, int y, int x1, int y1, int x2, int y2) {
    int oriX = x;
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        stroke(0);
        //System.out.println("x: "+ x);
        //System.out.println("y: "+ y);
        //System.out.println(highlight(x,y,x1,y1));
        if (highlight(i,j,x1,y1) || highlight(i,j,x2,y2)){
          //System.out.println("highlight");
          fill(240,150);
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
     
     for(int r = 0; r < board.length; r++) {
       for(int c = 0; c < board[0].length; c++) {
         if (board[r][c].pop && board[r][c].link == 0) {
           //System.out.println("link#" + board[r][c].link);
           check2(r,c,board[r][c]);
         }
       }
     }
     scheck(0);
    return output;
  }
  
  void check2(int r,int c,Candy input) {
    board[r][c].link = 1;
    if( r - 1 > -1 && board[r-1][c].pop && board[r - 1][c].link == 0 && board[r-1][c].name.equals(input.name)) {
      input.link += check3(r - 1,c,board[r - 1][c],input.name);
    }
    if( r + 1 < board.length && board[r+1][c].pop && board[r + 1][c].link  == 0 && board[r+1][c].name.equals(input.name)) {
      input.link += check3(r + 1,c,board[r + 1][c],input.name);
    }
    if( c - 1 > -1 && board[r][c - 1].pop && board[r][c - 1].link  == 0 && board[r][c - 1].name.equals(input.name)) {
      input.link += check3(r,c - 1,board[r][c - 1],input.name);
    }
    if( c + 1 < board[0].length && board[r][c + 1].pop && board[r][c + 1].link  == 0 && board[r][c + 1].name.equals(input.name)) {
      input.link += check3(r,c + 1,board[r][c + 1],input.name);
    }
    
    if(input.link <= 3) {
      points += input.link * 100;
    }
    if(input.link == 4) {
      int rand = ran.nextInt(2);
      board[r][c] = new SpecialCandy(1 + rand,board[r][c].name,board[r][c].xCor,board[r][c].yCor,board[r][c].id+rand+2);
      points += 500;
    }
    if(input.link >= 5) {
      board[r][c] = new SpecialCandy(3,board[r][c].name,board[r][c].xCor,board[r][c].yCor,board[r][c].id+1);
      points += 150 * input.link;
    }
    //System.out.println(input.link);
  }
  
  int check3(int r, int c, Candy input, String name) {
    board[r][c].link = -1;
    int counter  = 1;
    if( r - 1 > -1 && board[r - 1][c].pop && board[r - 1][c].link == 0 && board[r-1][c].name.equals(input.name)) {
      counter += check3(r - 1,c,board[r - 1][c],name);
    }
    if( r + 1 < board.length && board[r+1][c].pop && board[r + 1][c].link  == 0 && board[r+1][c].name.equals(input.name)) {
      counter += check3(r + 1,c,board[r + 1][c],name);
    }
    if( c - 1 > -1 && board[r][c - 1].pop && board[r][c - 1].link  == 0 && board[r][c - 1].name.equals(input.name)) {
      counter += check3(r,c - 1,board[r][c - 1],name);
    }
    if( c + 1 < board[0].length && board[r][c + 1].pop && board[r][c + 1].link  == 0 && board[r][c + 1].name.equals(input.name)) {
      counter += check3(r,c + 1,board[r][c + 1],name);
    }
    return counter;
    
  }
  
  boolean pop() {
    for(int r = 0; r < board.length; r++) {
      for(int c = 0; c < board[0].length; c++) {
        if(board[r][c].getPop()) {
        board[r][c] = null;
        }
      }
    }
       return true;
  }
     
  boolean fall() {
    delay(150);
    boolean output = false;
    //Candy temp;
      for(int i = 0; i < board[0].length; i++) {
        if(board[0][i] == null) {
          board[0][i] = randomCandy();
          board[0][i].endX = x + len/2 + len * i;
          board[0][i].endY = y + len/2;
          board[0][i].xCor = x + len/2 + len * i;
          board[0][i].yCor = y + len/2 - 50;
          output = true;
         }
         for(int r = 1; r < board.length; r++) {
          for(int c = board[0].length - 1; c >= 0; c--) {
            if(board[r][c] == null) {
              output = true;
              
              if (board[r - 1][c] != null) {
                board[r][c] = board[r - 1][c].cloner();
                board[r - 1][c] = null;
              }
            }
          }
        }
      }
        return output;
    }
  
  void toDrawCandy(int x, int y, PImage puff, boolean p, PImage[] candies) {
    int oriX = x;
    
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        if(board[i][j] != null) {
          fill(board[i][j].getColor()[0],board[i][j].getColor()[1],board[i][j].getColor()[2]);
          imageMode(CENTER);
          image(candies[board[i][j].id], board[i][j].xCor,board[i][j].yCor);
        } else {
          fill(75,0);
          rect(x + len * j,y,len,len);
          if (p){
            imageMode(CORNER);
            image(puff, x +  len * j,y);
          }
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
      if (check()){
        moves--;
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
  
  boolean move(int x) {
    boolean output = false;
    for(int i = 0; i < x; i++) {
     for(int r = 0; r < board.length; r++) {
       for(int c = 0 ; c < board[0].length; c++) {
          if(board[r][c] != null && board[r][c].move()) {
           output = true; 
          }
       }
     }
    }
     return output;
  }
  
  void updatecor(int x, int y) {
    for(int r = 0; r < board.length;r++) {
      for(int c = 0; c < board[0].length; c ++) {
        if(board[r][c] != null) {
          board[r][c].endX = x + len/2 + len * c;
          board[r][c].endY = y + len * r +  len/2;
        }
      }
    }
  }
  
  void horizontal(int r) {
    for (int c = 0; c < board[0].length; c++) {
      board[r][c].setPop();
    }
  }
  
  void vertical(int c) {
    for (int r = 0; r < board.length; r++) {
      board[r][c].setPop();
    }
  }
  
  void bomb(int r,int c) {
    if( r - 1 > -1 && c - 1 > -1) {
      board[r-1][c-1].setPop();
    }
    if( r - 1 > -1) {
      board[r-1][c].setPop();
    }
    if( r - 1 > -1 && c + 1 < board[0].length) {
      board[r-1][c+1].setPop();
    }
    if(c - 1 > -1) {
      board[r][c-1].setPop();
    }
    if(c + 1 < board[0].length) {
      board[r][c+1].setPop();
    }
    if( r + 1 < board.length && c - 1 > -1) {
      board[r+1][c-1].setPop();
    }
    if( r + 1 < board.length && c + 1 < board[0].length) {
      board[r+1][c+1].setPop();
    }
    if( r + 1 < board.length) {
      board[r+1][c].setPop();
    }
  }
  
  
  void scheck(int checker) {
    int[][] cordinates = new int[board.length*board[0].length][3];
    int counter = 0;
    for(int r = 0; r < board.length;r++) {
      for(int c = 0; c < board[0].length; c ++) {
        if(board[r][c].getPop() && board[r][c].special() > 0) {
            cordinates[counter] = new int[]{r,c,board[r][c].special()};
            counter += 1;
           }
        }
      }
      
    for(int i = 0; i < counter; i++) {
     if(cordinates[i][2] == 1) {
       horizontal(cordinates[i][0]); 
     }
     if(cordinates[i][2] == 2) {
       vertical(cordinates[i][1]); 
     }
     if(cordinates[i][2] == 3) {
       bomb(cordinates[i][0],cordinates[i][1]); 
     }
    }
    if (checker != counter) {
     scheck(counter); 
    }
   }

}
