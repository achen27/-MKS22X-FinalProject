public class Board{
  Candy[][] board;
  public Board(int rows,int cols) {
    board = new Candy[rows][cols];
  }
  public void fillempty() {
      for(int row = 0; row < board.length; row++) {
        for(int col = 0; col < board[0].length; col++) {
          board[row][col] = NormalCandy.randomCandy(row,col);
        }
      }
  }
  public String toString() {
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
