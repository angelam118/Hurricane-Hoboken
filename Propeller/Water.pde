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
    propellers.add(new Propeller(100, 0, 15, 2));
    propellers.add(new Propeller(200, 0, 15, 3));
    propellers.add(new Propeller(300, 0, 15, 2.5));
    propellers.add(new Propeller(400, 0, 15, 3.5));
  }

  void start(){
    active = true;
    character.x = 30;
    character.y = random(100, height - 100);  //randomize y position
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
      character.displayStatic();

      if (character.x >= width - 30){ //reached right side?
        active = false; // end!!!
        println("Yahooooooo!");
      }

      //fill(255);
      //textSize(20);
      //text("Lives: " + lives, 10, 20);
    }
  }

  boolean canMove(float newX, float newY){
    if (newX < 0 || newX > width || newY < 0 || newY > height){
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
