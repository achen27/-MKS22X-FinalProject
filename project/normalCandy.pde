class NormalCandy extends Candy{
  
  int colors;
  String name;
  int color1 = 6;
  
  NormalCandy(int xvalue,int yvalue, int colorvalue) {
    xcor = xvalue;
    ycor = yvalue;
    colors = colorvalue;
    pop = false;
    name = "invalid";
  }
  
  NormalCandy(int xvalue,int yvalue, String scolor) {
    xcor = xvalue;
    ycor = yvalue;
    if (scolor.equals("Red")) {
      colors = 16711680;
      name = "Red";
    }
    if (scolor.equals("Green")) {
      colors = 32768;
      name = "Green";
    }
    if (scolor.equals("Blue")) {
      colors = 255;
      name = "Blue";
    }
    if (scolor.equals("Yellow")) {
      colors = 16776960;
      name = "Yellow";
    }
    if (scolor.equals("Purple")) {
      colors = 8388758;
      name = "Purple";
    }
    if (scolor.equals("Orange")) {
      colors = 16744448;
      name = "Orange";
    }
    pop = false;
  }
  
  String toString() {
    if (name == null) {
      return "Normal " + colors;
    }
    return name;
  }
}
