class SpecialCandy extends Candy{
  
  int type;
  int colors;
  
  SpecialCandy(int typevalue, String scolor) {
    type = typevalue;
    pop = false;
    name = scolor;
  }
  
  String toString() {
    return "Special " + type;
  }
}
