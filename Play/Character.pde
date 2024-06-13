public class Character{
  String name;
  boolean alive;
  int points;
  float translateLegX=-40;
  float translateLegY=-10;
  float legAngle=0;
  int armX=15;
  int armY=0;
  float armAngle=0;
  float armSpeed=.02;
  float legMaxAngle=.1;
  float legMinAngle=-.1;
  float legSpeed=.02;
  boolean rotateUp=true;
  int speed=12;
  float x=0;
  float y=0;
  void setX(int xV){
    x=xV;

  }
  
  void setY(int yV){
    y=yV;

  }
  
  Character(String chName){
    name=chName;
    alive=true;
    points=0;
    fill(#C2AFD8);
    noStroke();
    armAngle=0;
    
  }
  //for dig
  void move(int direction, Sand sand){
    float newX = x;
    float newY = y;
    if (direction == LEFT){
      newX -= speed;
    } else if (direction == RIGHT){
      newX += speed;
    } else if (direction == UP){
      newY -= speed;
    } else if (direction == DOWN){
      newY += speed;
    }
    if (sand.canMove(newX, newY)){
      x = newX;
      y = newY;
    }
  }
void display(){
    fill(#c2afd8);
    noStroke();
    //circle(x, y, 30);
    //ellipse(x - 80, y - 5, 60, 10); // left leg
    //ellipse(x - 80, y + 10, 60, 10); // right leg
    //ellipse(x - 40, y, 60, 35); // body
    //ellipse(x - 20, y, 60, 10);
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
  //pushMatrix(); //<>//
  fill(#C2AFD8);
  noStroke();
  //System.out.println("x"+x+"Y"+y);
  ellipse(x, y, 60, 35);// body
  circle(x+40, y, 30);
  //popMatrix();
  
  pushMatrix();
  //translate(translateLegX, translateLegY);
  translate(x-40, y-10);
  rotate(legAngle);
  ellipse(0, 0, 65, 12);   //right leg 
  popMatrix();
  
  //make right leg
  
  pushMatrix();
  translate(x-40, y-10+20);
  rotate(legAngle);
  ellipse( 0, 0, 65, 12);   //right leg 
  popMatrix();
  
  pushMatrix();
  //make arms
  translate(x+15, y);
  rotate(armAngle);
  ellipse(0, 0, 12, 100);
  popMatrix();
}
void stopSwim(){
  fill(#C2AFD8);
  noStroke();
  pushMatrix();
  ellipse(x, y, 60, 35);// body
  circle(x+40, y, 30);
  popMatrix();
  //make right leg
  pushMatrix();
  //translate(translateLegX, translateLegY);
    translate(x-40, y-10);

  rotate(legAngle);
  ellipse(0, 0, 65, 12);   //right leg 
  popMatrix();
  
  //make right leg
  pushMatrix();
  //translate(translateLegX, translateLegY+20);
    translate(x-40, y+10);
  ellipse(0, 0, 65, 12);   //right leg 
  popMatrix();
  
  pushMatrix();
  //make arms
  translate(x+15, y);
  rotate(armAngle);
  ellipse( 0, 0, 12, 100);//left leg
  popMatrix();

}
void move(int direction, Water water){
    float newX = x;
    float newY = y;
    System.out.println("shld be swimming");
        System.out.println("x"+x);

    if (direction == LEFT){
      newX -= speed;
    }
    else if (direction == RIGHT){
      newX += speed;
    }
    else if (direction == UP){
      newY -= speed;
    }
    else if (direction == DOWN){
      newY += speed;
    }
    if(water.canMove(newX, newY)){
      x = newX;
      y = newY;

    }

  }
  }
