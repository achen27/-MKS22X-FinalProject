import processing.sound.*;

class Board {
  
  Candy[][] board;
  Random ran = new Random();
  int points;
  int moves;
  int len;
  
  Board(int rows,int cols,int leng) { //constructor
    len = leng;
    board = new Candy[rows][cols];
    points = 0;
    moves = 25;
  }
  
  void fillempty() { //fills board at the start of the game
  
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
  
  NormalCandy randomCandy(){ //random candy generator
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
  
  void toDrawBoard(int x, int y, int x1, int y1, int x2, int y2) { //draws game board on screen
    int oriX = x;
    
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        stroke(0);
        
        if (highlight(i,j,x1,y1) || highlight(i,j,x2,y2)){ //draws a highlighted square
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
  
  boolean highlight(int x, int y, int x1, int y1){ //helper method to check if square should be highlighted
    return x == x1 && y == y1;
  }
  
  void toDrawCandy(int x, int y, PImage puff, boolean p, PImage[] candies) { //draws images of candy on board
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
          
          if (p){ //draws puff of smoke on null squares
            imageMode(CORNER);
            image(puff, x +  len * j,y);
          }
          
        }
        
      }
      
      y += len;
      x = oriX;
    }
  }
  
  boolean swap(int x1, int y1, int x2, int y2){ //checks to see if swap is possible
    boolean output = false;
    
    if(x1 == x2 && y1 == y2){ //same square
      return false;
    }
    
    if ((x1 == x2 && Math.abs(y1-y2) == 1) || (y1 == y2 && Math.abs(x1-x2) == 1)){ //squares are next to each other
      
      if(board[x1][y1].special() > 0 && board[x2][y2].special() > 0) { //two special candy
        board[x1][y1].pop = true;
        board[x1][y1].pop = true;
        moves--;
        output = true;
      }
      
      //creats temp board
      Candy temp = board[x1][y1];
      board[x1][y1] = board[x2][y2]; 
      board[x2][y2] = temp;
      
      if (check()){ //valid swap
        moves--;
        return true;
      }
      
      //replaces game board with temp board
      temp = board[x1][y1];
      board[x1][y1] = board[x2][y2];
      board[x2][y2] = temp;
      
      return output;
      
    } else {
      return output;
    }
    
  }
  
  boolean check() { //checks board to see if anything can be popped
    boolean output = false;
    
     for(int r = 0; r < board.length - 2; r++) { //checks candy to the right
       for(int c = 0; c < board[0].length; c++) {
         
         if (board[r][c].getName().equals(board[r + 1][c].getName()) && board[r][c].getName().equals(board[r + 2][c].getName())) {
           board[r][c].setPop();
           board[r + 1][c].setPop();
           board[r + 2][c].setPop();
           output = true;
         }
         
       }
     }
     
     for(int r = 0; r < board.length; r++) { //checks candy below
       for(int c = 0; c < board[0].length - 2; c++) {
         
         if (board[r][c].getName().equals(board[r][c + 1].getName()) && board[r][c].getName().equals(board[r][c + 2].getName())) {
           board[r][c].setPop();
           board[r][c + 1].setPop();
           board[r][c + 2].setPop();
           output = true;
         }
         
       }
     }
     
     for(int r = 0; r < board.length; r++) { //checks number of candy in the combination
       for(int c = 0; c < board[0].length; c++) {
         
         if (board[r][c].pop && board[r][c].link == 0) {
           check2(r,c,board[r][c]);
         }
         
       }
     }
     
     scheck(0); //checks for special candy
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
    
    //simple pop or special candy created depending on number of candy
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
  
  void scheck(int checker) { //special candy pop checker
    int[][] cordinates = new int[board.length*board[0].length][3];
    int counter = 0;
    
    for(int r = 0; r < board.length;r++) { //counts special candy on board that need to be popped
      for(int c = 0; c < board[0].length; c ++) {
        
        if(board[r][c].getPop() && board[r][c].special() > 0) {
          cordinates[counter] = new int[]{r,c,board[r][c].special()};
          counter += 1;
        }
        
      }
    }
      
    for(int i = 0; i < counter; i++) { //sets all candy needed to be popped to true
      
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
  
  void horizontal(int r) { //helper method for horizontal line candy
    for (int c = 0; c < board[0].length; c++) {
      board[r][c].setPop();
    }
  }
  
  void vertical(int c) {//helper method for vertical line candy
    for (int r = 0; r < board.length; r++) {
      board[r][c].setPop();
    }
  }
  
  void bomb(int r,int c) { //helper method for bomb candy
  
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
  
  boolean pop() { //runs to board and set all candy with pop == true to null
  
    for(int r = 0; r < board.length; r++) {
      for(int c = 0; c < board[0].length; c++) {
        
        if(board[r][c].getPop()) {
        board[r][c] = null;
        }
        
      }
    }
    return true;
    
  }
  
  boolean fall() { //fall method
    delay(150);
    boolean output = false;
    
    for(int i = 0; i < board[0].length; i++) {
      
      if(board[0][i] == null) { //spawns random candy above board
        board[0][i] = randomCandy();
        board[0][i].endX = x + len/2 + len * i;
        board[0][i].endY = y + len/2;
        board[0][i].xCor = x + len/2 + len * i;
        board[0][i].yCor = y + len/2 - 50;
        output = true;
       }
       
       for(int r = 1; r < board.length; r++) { //replaces null spaces with the candy in the square above
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
  
  boolean move(int x) { //fall animation method
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
  
  void updatecor(int x, int y) { //upadates end coordinates of candies
    
    for(int r = 0; r < board.length;r++) {
      for(int c = 0; c < board[0].length; c ++) {
        
        if(board[r][c] != null) {
          board[r][c].endX = x + len/2 + len * c;
          board[r][c].endY = y + len * r +  len/2;
        }
        
      }
    }
    
  }
  
  void drawScoreBoard(PImage scoreboard){ //draws board on the left of the game board
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
    text("15,000", 120, 165);
  }
  
  boolean shuffle(){ //shuffle button
  
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
  
  void endgame(){ //method run after game ends to clear board
    delay(200);
    
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        board[i][j] = null;
      }
    }
    
  }
  
  void drawEnd(PImage[] stars){ //draws pop-up after game ends
  
    strokeWeight(1);
    fill(250,230,255);
    stroke(230,100,150);
    strokeWeight(10);
    rect(375, 150, 200, 250,20,20,20,20);
    strokeWeight(1);
    textAlign(CENTER);
    fill(55,135,210);
    stroke(75,170,245);
    rect(400, 310, 150, 50,10,10,10,10);
    textSize(50);
    fill(55,130,200);
    text("Score", 475, 280);
    textSize(50);
    fill(255);
    text(b.points, 475, 352);
    imageMode(CENTER);
    
    //draws stars depending on points
    if (points >= 5000){
      image(stars[0], 420, 210);
    }
    if (points >= 10000){
      image(stars[1], 475, 190);
    }
    if (points >= 15000){
      image(stars[2], 530, 210);
    }
  }
  
  void drawRestart(){ //restart button
    fill(235,70,250);
    stroke(0);
    strokeWeight(1);
    rect(750, 250, 160, 60,20,20,20,20);
    strokeWeight(1);
    textAlign(CENTER);
    fill(255);
    textSize(70);
    text("Restart", 830, 295);
  }

  String toString() { //debugging string with color
    String output = "";
    for(int r = 0; r < board.length; r++) {
      for(int c = 0; c < board[0].length; c++) {
        output += board[r][c] + "      ";
      }
      output += "\n";
    }
    return output;
  }
  
  String toString2() { //debugging string with pop
    String output = "";
    for(int r = 0; r < board.length; r++) {
      for(int c = 0; c < board[0].length; c++) {
        output += board[r][c].getPop() + "      ";
      }
      output += "\n";
    }
    return output;
  }

}
