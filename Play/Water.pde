
class Water{
  Character character;
  ArrayList<Propeller> propellers;
  int lives;
  boolean active;

  Water(Character c){
    character = c;
    lives = 1000;
    active = true;
    propellers = new ArrayList<Propeller>();
    propellers.add(new Propeller(-60, 0, 15, 1));
    propellers.add(new Propeller(20, 0, 15, 2));
    propellers.add(new Propeller(75, 0, 15, 1.5));
    propellers.add(new Propeller(150, 0, 15, 2.5));
  }

  void start(){
    active = true;
    character.x = -200;
    character.y = random(-250, height/2);  //randomize y position
  }

  void update(){
    if (active){
      background(#4F93BF);
      for (Propeller propeller:propellers){
        propeller.update();
        propeller.display();
        if (propeller.hits(character)){
          lives--;
          if (lives <= 0){
            active = false;
          }
          else{
            start();
          }
        }
      }
      character.stopSwim();

      if (character.x >= width - 30){ //reached right side?
        active = false; // end!!!
        //println("Yahooooooo!");
      }

      //fill(255);
      //textSize(20);
      //text("Lives: " + lives, 10, 20);
    }
  }

  boolean canMove(float newX, float newY){
    if (newX < -250 || newX > width || newY < -250 || newY > height){
      return false;
    }
    for (Propeller propeller:propellers){
      if (propeller.hits(character)){
        return false;
      }
    }
    return true;
  }
}
