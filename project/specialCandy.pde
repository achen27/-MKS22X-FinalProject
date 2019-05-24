class SpecialCandy extends Candy{
  
  int type;
  int colors;
  SpecialCandy(int xvalue,int yvalue, int typevalue, String scolor) {
    xcor = xvalue;
    ycor = yvalue;
    type = typevalue;
    pop = false;
    name = scolor;
  }
  
  String toString() {
    return "Special " + type;
  }
}
