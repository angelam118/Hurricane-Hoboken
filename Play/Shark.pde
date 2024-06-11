public class Shark{
  boolean inside;
  int x, y;
  
  Shark(int startX, int startY){
    inside=false;
    x=startX;
    y=startY;
    noStroke();
    ellipse(x, y, 40, 70);
  }
  void swim(){
    int newX=x;
    int newY=y;
    y=newY;
    x=newX;
    fill(#969FA5);
  }
  boolean checkInside(){
    return inside;
  }
}
