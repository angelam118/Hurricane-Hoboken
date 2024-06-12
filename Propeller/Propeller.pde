class Propeller{
  float x, y;
  float radius;
  float speed;
  float angle;
  boolean movingUp;

  Propeller(float x, float y, float radius, float speed){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = speed;
    this.angle = 0;
    this.movingUp = random(1) < 0.5; //randomly start moving up/down
  }

  void update(){
    if (movingUp){
      y -= speed;
      if (y < 0){
        movingUp = false;
      }
    } 
    else{
      y += speed;
      if (y > height){
        movingUp = true;
      }
    }

    angle += 0.1;
  }

  void display(){
    pushMatrix();
    translate(x, y);
    fill(200);
    noStroke();
    ellipse(0, 0, radius * 2, radius * 2); //propeller inner circle

    for (int i = 0; i < 3; i++){
      pushMatrix();
      rotate(angle + (TWO_PI / 3) * i);
      ellipse(radius / 2, -5, radius, 50); //blades, ellipse/rect, size 10/50
      popMatrix();
    }
    popMatrix();
  }

  boolean hits(Character character){
    if (dist(x, y, character.x, character.y) < radius + 15){ //head
      return true;
    }
    
    if (dist(x, y, character.x - 40, character.y - 5) < radius + 30){ //left leg
      return true;
    }
    
    if (dist(x, y, character.x - 40, character.y + 10) < radius + 30){ //right leg
      return true;
    }

    float bodyWidth = 60;
    float bodyHeight = 35;
    if (x > character.x - 40 - radius && x < character.x - 40 + bodyWidth + radius &&
        y > character.y - bodyHeight / 2 - radius && 
        y < character.y + bodyHeight / 2 + radius){
      return true; //body
    }

    return false;
  }
}
