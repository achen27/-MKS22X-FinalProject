public class Game{
  Board candyBoard;
  public Game(int xcor,int ycor) {
    candyBoard = new Board(xcor,ycor);
  }
  public String toString() {
    return candyBoard + "";
  }
  public static void main(String[] args) {
    Game candyCrush = new Game(5,6);
    candyCrush.candyBoard.fillempty();
    System.out.println(candyCrush);
  }
}
