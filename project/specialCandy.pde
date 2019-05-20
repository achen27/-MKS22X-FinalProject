import java.awt.Color;
public class SpecialCandy extends Candy{
  int type;
  public SpecialCandy(int xvalue,int yvalue, int typevalue) {
    xcor = xvalue;
    ycor = yvalue;
    type = typevalue;
    pop = false;
  }
  public String toString() {
    return "Special " + type;
  }
}
