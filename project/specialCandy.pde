class SpecialCandy extends Candy{
  
  int type;
  int colors;
  SpecialCandy(int xvalue,int yvalue, int typevalue, int ) {
    xcor = xvalue;
    ycor = yvalue;
    type = typevalue;
    pop = false;
  }
  
  String toString() {
    return "Special " + type;
  }
}