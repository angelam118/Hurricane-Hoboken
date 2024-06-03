public class Shark{
  boolean inside;
  int x, y;
  
  Shark(){
    inside=false;
    x=40;
    y=460;
    drawShark();//shld go somewhere else
  }
  void drawShark(){
    translate(x, y);
    rotate(PI/4);
    noStroke();
    ellipse(0, 0, 40, 70);
    rotate(-PI/4);//rotate back
    translate(-x, -y);
  }
  void swim(){
    //every
  }
  
}
