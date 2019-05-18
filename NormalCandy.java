import java.awt.Color;
import java.util.*;
public class NormalCandy extends Candy{
  int color;
  String name;
  static Random ran = new Random();
  static int colors = 6;
  public NormalCandy(int xvalue,int yvalue, int colorvalue) {
    xcor = xvalue;
    ycor = yvalue;
    color = colorvalue;
    pop = false;
    name = "invalid";
  }
  public NormalCandy(int xvalue,int yvalue, String scolor) {
    xcor = xvalue;
    ycor = yvalue;
    if (scolor.equals("Red")) {
      color = 16711680;
      name = "Red";
    }
    if (scolor.equals("Green")) {
      color = 32768;
      name = "Green";
    }
    if (scolor.equals("Blue")) {
      color = 255;
      name = "Blue";
    }
    if (scolor.equals("Yellow")) {
      color = 16776960;
      name = "Yellow";
    }
    if (scolor.equals("Purple")) {
      color = 8388758;
      name = "Purple";
    }
    if (scolor.equals("Pink")) {
      color = 16711808;
      name = "Pink";
    }
    pop = false;
  }
  public static NormalCandy randomCandy(int xvalue,int yvalue){
    int temp = ran.nextInt(6);
    if (temp % colors == 0){
      return new NormalCandy(xvalue,yvalue,"Red");
    }
    if (temp % colors == 1) {
      return new NormalCandy(xvalue,yvalue,"Blue");
    }
    if (temp % colors == 2) {
      return new NormalCandy(xvalue,yvalue,"Green");
    }
    if (temp % colors == 3) {
      return new NormalCandy(xvalue,yvalue,"Yellow");
    }
    if (temp % colors == 4) {
      return new NormalCandy(xvalue,yvalue,"Purple");
    }
    if (temp % colors == 5) {
      return new NormalCandy(xvalue,yvalue,"Pink");
    }
    return null;
  }
  public String toString() {
    if (name == null) {
      return "Normal " + color;
    }
    return name;
  }
}
