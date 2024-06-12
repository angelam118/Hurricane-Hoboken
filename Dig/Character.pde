public class Character{
    String name;
    boolean alive;
    int points;
    float x, y;
    float speed = 12; //powerups
    float directionAngle = 0;
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
    float rotationSpeed = 0.1;

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
            pushMatrix();
            translate(x, y);
            rotate(directionAngle); //orientation shift
            fill(#C2AFD8);
            noStroke();
            ellipse(0, 0, bodyWidth, bodyHeight); //body
            circle(27, 0, headSize); //head

            pushMatrix();
            translate(translateLegX, translateLegY);
            rotate(legAngle);
            ellipse(0, 0, legWidth, legHeight); //right leg
            popMatrix();

            pushMatrix();
            translate(translateLegX, translateLegY + 10);
            rotate(legAngle);
            ellipse(0, 0, legWidth, legHeight); //left leg
            popMatrix();

            pushMatrix();
            translate(armX, armY);
            rotate(armAngle);
            ellipse(0, 0, 7, 65); //arm
            popMatrix();
            popMatrix();
    }

    void displaySwimming(){
            pushMatrix();
            translate(x, y);
            rotate(directionAngle); //orientation shift
            fill(#C2AFD8);
            noStroke();
            ellipse(0, 0, bodyWidth, bodyHeight); //body
            circle(27, 0, headSize); //head

            pushMatrix();
            translate(translateLegX, translateLegY);
            rotate(legAngle);
            ellipse(0, 0, legWidth, legHeight); //right leg
            popMatrix();

            pushMatrix();
            translate(translateLegX, translateLegY + 10);
            rotate(legAngle);
            ellipse(0, 0, legWidth, legHeight); //left leg
            popMatrix();

            pushMatrix();
            translate(armX, armY);
            rotate(armAngle);
            ellipse(0, 0, 7, 65); //arm
            popMatrix();
            popMatrix();
    }

    void move(int direction, Sand sand){
        float newX = x;
        float newY = y;
        float targetAngle = directionAngle;

        if (direction == LEFT){
            newX -= speed;
            targetAngle = PI;
        }
        else if (direction == RIGHT){
            newX += speed;
            targetAngle = 0;
        }
        else if (direction == UP){
            newY -= speed;
            targetAngle = -HALF_PI;
        }
        else if (direction == DOWN){
            newY += speed;
            targetAngle = HALF_PI;
        }

        if (sand.canMove(newX, newY)){
            x = newX;
            y = newY;
        }

        if (abs(targetAngle - directionAngle) > rotationSpeed){ //orientation changes
            if ((targetAngle - directionAngle + TWO_PI) % TWO_PI < PI){
                directionAngle += rotationSpeed;
            }
            else{
                directionAngle -= rotationSpeed;
            }
        }
        else{
            directionAngle = targetAngle;
        }
    }
}
