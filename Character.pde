public class Character{
  String name;
  boolean alive;
  int points;
  float x, y; 
  float speed = 12; //powerups

  Character(String chName, float startX, float startY){
    name = chName;
    alive = true;
    points = 0;
    x = startX;
    y = startY;
  }

  void display(){
    fill(#eb348c);
    noStroke();
    circle(x, y, 30);
    ellipse(x - 80, y - 5, 60, 10); // left leg
    ellipse(x - 80, y + 10, 60, 10); // right leg
    ellipse(x - 40, y, 60, 35); // body
    ellipse(x - 20, y, 60, 10);
  }

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
}
