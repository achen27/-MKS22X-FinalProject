abstract class Candy{
  
  String name;
  int xcor;
  int ycor;
  boolean pop;
  int[] colors = new int[3];
  
  void setXCor(int xvalue) {
    xcor = xvalue;
  }
  
  void setYCOr(int yvalue) {
    ycor = yvalue;
  }
  
  int[] getColor(){
    return colors;
  }
  
  boolean setPop() {
    pop = true;
    return pop;
  }
  boolean getPop() {
    return pop;
  }
  String getName() {
    return name;
  }
  String toString() {
    return name;
  }
}
