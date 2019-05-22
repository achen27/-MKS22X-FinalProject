abstract class Candy{

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
  
  boolean pop() {
    pop = true;
    return pop;
  }
  
}