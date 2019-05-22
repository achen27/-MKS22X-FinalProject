class SpecialCandy extends Candy{
  
  int type;
  int colors;
  String Name;
  SpecialCandy(int xvalue,int yvalue, int typevalue) {
    xcor = xvalue;
    ycor = yvalue;
    type = typevalue;
    pop = false;
  }
  
  String toString() {
    return "Special " + type;
  }
}