abstract class Candy{
  
  String name;
  boolean pop;
  int[] colors = new int[3];
  
  int[] getColor(){
    return colors;
  }
  
  void setPop() {
    pop = true;
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