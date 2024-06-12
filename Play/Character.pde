public class Character{
  String name;
  boolean alive;
  int points;
  int translateLegX=-40;
  int translateLegY=-10;
  float legAngle=0;
  int armX=15;
  int armY=0;
  float armAngle=0;
  float armSpeed=.02;
  float legMaxAngle=.1;
  float legMinAngle=-.1;
  float legSpeed=.02;
  boolean rotateUp=true;
  
  Character(String chName){
    name=chName;
    alive=true;
    points=0;
    fill(#C2AFD8);
    noStroke();
    armAngle=0;
  }
void kick(){
  if(rotateUp){
    if(legAngle>=legMaxAngle){
      rotateUp=false;//change dir of rotation
    }
      legAngle+=legSpeed;
    
  }else{
    if(legAngle<=legMinAngle){
      rotateUp=true;//change dir of rotation
    }
      legAngle-=legSpeed;
    
  }
}
void moveArms(){
  if(armAngle>=TWO_PI){
   armAngle=0; 
  }else{
    armAngle+=armSpeed;
  }
}
void swim(){
  kick();
  moveArms();
  pushMatrix(); //<>//
  fill(#C2AFD8);
  noStroke();
  ellipse(0, 0, 60, 35);// body
  circle(40, 0, 30);
  popMatrix();
  
  pushMatrix();
  translate(translateLegX, translateLegY);
  rotate(legAngle);
  ellipse(0, 0, 65, 12);   //right leg 
  popMatrix();
  
  //make right leg
  
  pushMatrix();
  translate(translateLegX, translateLegY+20);
  rotate(legAngle);
  ellipse( 0, 0, 65, 12);   //right leg 
  popMatrix();
  
  pushMatrix();
  //make arms
  translate(armX, armY);
  rotate(armAngle);
  ellipse(0, 0, 12, 100);//left leg
  popMatrix();
}
void stopSwim(){
  fill(#C2AFD8);
  noStroke();
  pushMatrix();
  ellipse(0, 0, 60, 35);// body
  circle(40, 0, 30);
  popMatrix();
  //make right leg
  pushMatrix();
  translate(translateLegX, translateLegY);
  rotate(legAngle);
  ellipse(0, 0, 65, 12);   //right leg 
  popMatrix();
  
  //make right leg
  pushMatrix();
  translate(translateLegX, translateLegY+20);
  ellipse(0, 0, 65, 12);   //right leg 
  popMatrix();
  
  pushMatrix();
  //make arms
  translate(armX, armY);
  rotate(armAngle);
  ellipse( 0, 0, 12, 100);//left leg
  popMatrix();

}
  }
