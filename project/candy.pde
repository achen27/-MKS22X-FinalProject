abstract class Candy{
  
  /*
    Abstact Candy Class has 3 variables
      1. name - It gives it an identity. It is used to easily set two of them to the same 
      2. pop - A detection variable. It will be true if it will be removed in the future.
      3. color[] -  it stores a set of 3 colors (rbg values)
  */
  int xCor;
  int yCor;
  int endX;
  int endY;
  String name;
  int id;
  boolean pop;
  int[] colors = new int[3];
  int link;
  /*
    getColor is an accessor function. It is only used for testing.
  */
  
  int[] getColor(){
    return colors;
  }
  
  /*
    setPop() just sets pop to true.
  */
  
  void setPop() {
    pop = true;
  }
  
  /*
    getPop() gets the value of pop.
  */
  
  boolean getPop() {
    return pop;
  }
  
  abstract int special();
  
  
  
  
  /*
    getName() gets the value of name.
  */
  
  String getName() {
    return name;
  }
  
  /*
    getString() justs returns name for now. It is only used for testing purposes.
  */
  
  String toString() {
    return name;
  }
  
  abstract Candy cloner();
  
  boolean move() {
      if(endX > xCor) {
        xCor += 5;
        return true;
      }
      if(endX < xCor) {
        xCor -= 5;
        return true;
      }
      if(endY < yCor) {
        yCor -= 5;
        return true;
      }
      if(endY > yCor) {
        yCor += 5;
        return true;
      }
      return false;
  }
}
