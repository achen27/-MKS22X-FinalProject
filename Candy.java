import java.awt.Color;
abstract class Candy{
  public int xcor;
  public int ycor;
  public boolean pop;
  public void setXCor(int xvalue) {
    xcor = xvalue;
  }
  public void setYCOr(int yvalue) {
    ycor = yvalue;
  }
  public boolean pop() {
    pop = true;
    return pop;
  }
}
