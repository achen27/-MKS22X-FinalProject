class NormalCandy extends Candy{
  
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
      colors[0] = 235;
      colors[1] = 50;
      colors[3] = 35;
      name = "Red";
    }
    if (scolor.equals("Orange")) {
      colors[0] = 240;
      colors[1] = 144;
      colors[3] = 55;
      name = "Orange";
    }
    if (scolor.equals("Yellow")) {
      colors[0] = 250;
      colors[1] = 235;
      colors[3] = 80;
      name = "Yellow";
    }
    if (scolor.equals("Green")) {
      colors[0] = 110;
      colors[1] = 210;
      colors[3] = 65;
      name = "Green";
    }
    if (scolor.equals("Blue")) {
      colors[0] = 60;
      colors[1] = 140;
      colors[3] = 240;
      name = "Blue";
    }
    if (scolor.equals("Purple")) {
      colors[0] = 200;
      colors[1] = 60;
      colors[3] = 250;
      name = "Purple";
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
