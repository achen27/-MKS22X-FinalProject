class NormalCandy extends Candy{
  
  /* Normal Candy Constructor
    Functions:
    It uses a String as a input. This is used so we can name each of the orbs.
    It also makes it easier to add new colors/candies in the future.
    It detects the String and saves the rbg into it so it display the color later.
  */
  
  NormalCandy(String scolor) {
    xCor = 0;
    yCor = 0;
    if (scolor.equals("Red")) {
      colors[0] = 235;
      colors[1] = 50;
      colors[2] = 35;
      name = "Red";
    }
    if (scolor.equals("Orange")) {
      colors[0] = 240;
      colors[1] = 144;
      colors[2] = 55;
      name = "Orange";
    }
    if (scolor.equals("Yellow")) {
      colors[0] = 250;
      colors[1] = 235;
      colors[2] = 80;
      name = "Yellow";
    }
    if (scolor.equals("Green")) {
      colors[0] = 110;
      colors[1] = 210;
      colors[2] = 65;
      name = "Green";
    }
    if (scolor.equals("Blue")) {
      colors[0] = 60;
      colors[1] = 140;
      colors[2] = 240;
      name = "Blue";
    }
    if (scolor.equals("Purple")) {
      colors[0] = 200;
      colors[1] = 60;
      colors[2] = 250;
      name = "Purple";
    }
    pop = false;
  }
  NormalCandy(String scolor,int xcor, int ycor) {
    if (scolor.equals("Red")) {
      colors[0] = 235;
      colors[1] = 50;
      colors[2] = 35;
      name = "Red";
    }
    if (scolor.equals("Orange")) {
      colors[0] = 240;
      colors[1] = 144;
      colors[2] = 55;
      name = "Orange";
    }
    if (scolor.equals("Yellow")) {
      colors[0] = 250;
      colors[1] = 235;
      colors[2] = 80;
      name = "Yellow";
    }
    if (scolor.equals("Green")) {
      colors[0] = 110;
      colors[1] = 210;
      colors[2] = 65;
      name = "Green";
    }
    if (scolor.equals("Blue")) {
      colors[0] = 60;
      colors[1] = 140;
      colors[2] = 240;
      name = "Blue";
    }
    if (scolor.equals("Purple")) {
      colors[0] = 200;
      colors[1] = 60;
      colors[2] = 250;
      name = "Purple";
    }
    pop = false;
    xCor = xcor;
    yCor = ycor;
  }
  /*
    toString returns the type and the color of the candy.
    It is only used for testing purposes.
  */
  
  Candy cloner() {
    output = new NormalCandy(name,xCor,yCor);
  }
  
  
  
  
  String toString() {
    if (name == null) {
      return "Normal " + colors;
    }
    return name;
  }
}
