abstract class Candy{
  
  String name;
  boolean pop;
  int[] colors = new int[3];
  
  
  
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
