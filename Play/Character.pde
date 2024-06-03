public class Character{
  String name;
  boolean alive;
  int points;
  float x, y; //<>//
  PShape arms, rightLeg, leftLeg, torso;
  float angle, kick, armAngle;
  boolean swim, counter;
  
  
  
  Character(String chName){
    name=chName;
    alive=true;
    points=0;
    angle = PI/2;
    fill(#C2AFD8);
    noStroke();
    kick=-.2;
    counter=false;
    armAngle=0;
     //drawChar();
    // translate(width/2, height/2);
    //rotate(PI/100);
    //drawChar();
  }
  
  void swim(){
    swim=true;
    //rightArm.rotate(PI);
        //rightArm= createShape(ELLIPSE, 280, 320, 12, 60);

   //shape(rightArm);
   //translate(width/2, height/2);
   // rotate(PI/100);
   //drawChar();

  }
  void drawChar(){
        fill(#C2AFD8);
noStroke();
     torso=createShape(ELLIPSE,260, 300, 60, 35);// body //<>//
     shape(torso);
  
  //PShape arms=createShape();
  //arms.beginShape();
  //createShape(ELLIPSE, 280, 270, 12, 60);
  //createShape(ELLIPSE, 280, 320, 12, 60);
  //arms.endShape();
  ///shape(arms, 200, 200);
    circle(300, 300, 30);
    //translate(width/2, height/2);
    //rotate(angle);
    
      //leftArm= createShape(ELLIPSE, 10, 40, 120, 12);
     
if(swim==true){
  
    fill(#C2AFD8);
    shape(torso);
    //arms=createShape(ELLIPSE, 270, 300, 12, 110);
    //shape(arms);
    //rightLeg=createShape(ELLIPSE, 210, 290, 65, 12);   //right leg 
    //leftLeg = createShape(ELLIPSE, 210, 310, 65, 12);//left leg
  
   //rightLeg=createShape(ELLIPSE, -30, 60, 65, 12);   //right leg 
    //leftLeg = createShape(ELLIPSE, -30, 40, 65, 12);//left leg
//if (second() % 1 == 0) {  
//     float check = random(-1, 1);
//     if(check<0)kick=-.2;
//      else kick=.2;
//  }
armAngle+=.1;
rectMode(CENTER);

translate(270, 300);
rotate(armAngle);
arms=createShape(ELLIPSE, 0, 0, 12, 110);
shape(arms);
rotate(-armAngle);
rectMode(CORNER);
translate(-270, -300);
kick=.2;
angle = angle+kick;
float c=0;
System.out.println(counter);
System.out.println(angle);

  if( counter){
    //kick=.2;
       c = -cos(angle);

  }else {
    //kick=-.2;
       c = cos(angle);

  }
  counter=!counter;

  //angle = angle+kick;
  //float c = cos(angle);
  translate(240, 250);
  rotate(c);
     rightLeg=createShape(ELLIPSE, -20, 60, 65, 12);   //right leg 
    leftLeg = createShape(ELLIPSE, -20, 40, 65, 12);//left leg

     //shape(leftArm);
        shape(leftLeg);
        shape(rightLeg);
   angle=PI/2;
  rotate(-c);

  translate(-240, -250);

      swim=false;  
}else{
  arms=createShape(ELLIPSE, 270, 300, 12, 110);
    shape(arms);
  rightLeg=createShape(ELLIPSE, 215, 290, 65, 12);   //right leg 
    leftLeg = createShape(ELLIPSE, 215, 310, 65, 12);//left leg
    shape(rightLeg);
    shape(leftLeg);
    
    fill(#4F93BF);
  //rightLeg=createShape(ELLIPSE, 215, 290, 65, 12);   //right leg 
    //leftLeg = createShape(ELLIPSE, 215, 310, 65, 12);//left leg
    shape(rightLeg);
    shape(leftLeg);
    shape(arms);
}
stroke(1);
}
    //rightArm= createShape(ELLIPSE, 280, 320, 12, 60);
    //torso=createShape(ELLIPSE,260, 300, 60, 35);// body
    //rightLeg=createShape(ELLIPSE, 220, 310, 65, 12);   //right leg 
    //leftLeg = createShape(ELLIPSE, 220, 295, 65, 12);//left leg
    //leftArm= createShape(ELLIPSE, 280, 280, 12, 60);
    //rightArm= createShape(ELLIPSE, 280, 320, 12, 60);
   //translate(width/2, height/2);
   //rotate(PI/4);
   
   //shape(rightArm);
    //translate(width/2, height/2);
    //rotate(radians(90));
    //PShape test =createShape(ELLIPSE, 200, 200, 35, 20);
    //shape(rightArm);
  }
