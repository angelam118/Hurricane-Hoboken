public class Shark{
  boolean inside;
  int x, y;
  Shark(int startX, int startY){
    inside=false;
    x=250;
    y=startY;
    noStroke();
    ellipse(x, y, 40, 70);
  }
  void addX(){
    x-=1;
  }
  int getX(){
    return x;
  }
  void drawShark(){
    PImage shark= loadImage("shark.png");
    image(shark, x, -60, 200, 200);  

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
  void escape(){
    inside=false;
  }
  void setInside(){
    inside=true;
  }
}
