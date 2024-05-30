public class Character{
  String name;
  boolean alive;
  int points;
  int orientation;//vert or horizontal
  PShape rightArm, leftArm, rightLeg, leftLeg, torso;
  
  
  Character(String chName){
    name=chName;
    alive=true;
    points=0;
    fill(#C2AFD8);
      noStroke();

    circle(300, 300, 30);
    torso=createShape(ELLIPSE,260, 300, 60, 35);// body
    
    //ellipse(280, 300, 60, 10);
    rightLeg=createShape(ELLIPSE, 220, 310, 65, 12);   //right leg 
    leftLeg = createShape(ELLIPSE, 220, 295, 65, 12);//left leg
    leftArm= createShape(ELLIPSE, 280, 280, 12, 60);
    rightArm= createShape(ELLIPSE, 280, 320, 12, 60);
   shape(torso);
   shape(rightLeg);
   shape(leftLeg);
   shape(rightArm);
   shape(leftArm);
   drawChar();
   //swim();
   //shape(rightArm);


  }
  
  void swim(){
    //rightArm.rotate(PI);
        //rightArm= createShape(ELLIPSE, 280, 320, 12, 60);

   //shape(rightArm);

  }
  void drawChar(){
    translate(width/2, height/2);
    rotate(radians(90));
    //PShape test =createShape(ELLIPSE, 200, 200, 35, 20);
    shape(rightArm);
  }
  void moveRight(){
  }
  void moveLeft(){
  }
}
