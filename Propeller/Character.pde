public class Character{
  String name;
  boolean alive;
  int points;
  float x, y;
  float speed = 12;
  int translateLegX = -20;
  int translateLegY = -5;
  float legAngle = 0;
  int armX = 4;
  int armY = 0;
  float armAngle = 0;
  float armSpeed = .02;
  float legMaxAngle = .1;
  float legMinAngle = -.1;
  float legSpeed = .02;
  boolean rotateUp = true;
  float bodyWidth = 40;
  float bodyHeight = 23.5;
  float headSize = 20;
  float legWidth = 40;
  float legHeight = 7;

  Character(String chName, float startX, float startY){
    name = chName;
    alive = true;
    points = 0;
    x = startX;
    y = startY;
  }

  void kick(){
    if(rotateUp){
      if(legAngle >= legMaxAngle){
        rotateUp = false; //change direction of rotation
      }
      legAngle += legSpeed;
    }
    else{
      if (legAngle <= legMinAngle){
        rotateUp = true; //change direction of rotation
      }
      legAngle -= legSpeed;
    }
  }

  void moveArms(){
    if (armAngle >= TWO_PI){
      armAngle = 0;
    }
    else{
      armAngle += armSpeed;
    }
  }

  void swim(){
    kick();
    moveArms();
    displaySwimming();
  }

  void stopSwim(){
    displayStatic();
  }

  void displayStatic(){
    fill(#C2AFD8);
    noStroke();
    ellipse(x, y, bodyWidth, bodyHeight); //body
    circle(x + 27, y, headSize); //head
    pushMatrix();
    translate(x + translateLegX, y + translateLegY);
    rotate(legAngle);
    ellipse(0, 0, legWidth, legHeight); //right leg
    popMatrix();
    pushMatrix();
    translate(x + translateLegX, y + translateLegY + 10);
    rotate(legAngle);
    ellipse(0, 0, legWidth, legHeight); //left leg
    popMatrix();
    pushMatrix();
    translate(x + armX, y + armY);
    rotate(armAngle);
    ellipse(0, 0, 7, 65); //arm
    popMatrix();
  }

  void displaySwimming(){
    fill(#C2AFD8);
    noStroke();
    ellipse(x, y, bodyWidth, bodyHeight); //body
    circle(x + 27, y, headSize); //head

    pushMatrix();
    translate(x + translateLegX, y + translateLegY);
    rotate(legAngle);
    ellipse(0, 0, legWidth, legHeight); //right leg
    popMatrix();

    pushMatrix();
    translate(x + translateLegX, y + translateLegY + 10);
    rotate(legAngle);
    ellipse(0, 0, legWidth, legHeight); //left leg
    popMatrix();

    pushMatrix();
    translate(x + armX, y + armY);
    rotate(armAngle);
    ellipse(0, 0, 7, 65); // arm
    popMatrix();
  }

  void move(int direction, Water water){
    float newX = x;
    float newY = y;
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
    if (water.canMove(newX, newY)){
      x = newX;
      y = newY;
    }
  }
}
