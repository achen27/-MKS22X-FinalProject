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
      id = 0;
    }
    if (scolor.equals("Orange")) {
      colors[0] = 240;
      colors[1] = 144;
      colors[2] = 55;
      name = "Orange";
      id = 1;
    }
    if (scolor.equals("Yellow")) {
      colors[0] = 250;
      colors[1] = 235;
      colors[2] = 80;
      name = "Yellow";
      id = 2;
    }
    if (scolor.equals("Green")) {
      colors[0] = 110;
      colors[1] = 210;
      colors[2] = 65;
      name = "Green";
      id = 3;
    }
    if (scolor.equals("Blue")) {
      colors[0] = 60;
      colors[1] = 140;
      colors[2] = 240;
      name = "Blue";
      id = 4;
    }
    if (scolor.equals("Purple")) {
      colors[0] = 200;
      colors[1] = 60;
      colors[2] = 250;
      name = "Purple";
      id = 5;
    }
    pop = false;
  }
  
  NormalCandy(String scolor,int xcor, int ycor) {
    if (scolor.equals("Red")) {
      colors[0] = 235;
      colors[1] = 50;
      colors[2] = 35;
      name = "Red";
      id = 0;
    }
    if (scolor.equals("Orange")) {
      colors[0] = 240;
      colors[1] = 144;
      colors[2] = 55;
      name = "Orange";
      id = 1;
    }
    if (scolor.equals("Yellow")) {
      colors[0] = 250;
      colors[1] = 235;
      colors[2] = 80;
      name = "Yellow";
      id = 2;
    }
    if (scolor.equals("Green")) {
      colors[0] = 110;
      colors[1] = 210;
      colors[2] = 65;
      name = "Green";
      id = 3;
    }
    if (scolor.equals("Blue")) {
      colors[0] = 60;
      colors[1] = 140;
      colors[2] = 240;
      name = "Blue";
      id = 4;
    }
    if (scolor.equals("Purple")) {
      colors[0] = 200;
      colors[1] = 60;
      colors[2] = 250;
      name = "Purple";
      id = 5;
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
    return new NormalCandy(name,xCor,yCor);
  }
   
  int special() {
   return 0; 
  }
  
  
  
  String toString() {
    if (name == null) {
      return "Normal " + colors;
    }
    return name;
  }
}
