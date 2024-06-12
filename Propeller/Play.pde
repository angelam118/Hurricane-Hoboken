Character pete;
Water water;
boolean swim;

void setup(){
  size(500, 500);
  pete = new Character("Pete", 30, height / 2);
  water = new Water(pete);
  water.start();
}

void draw(){
  if (water.active){
    water.update();
    if (swim){
      pete.swim();
    }
    else{
      pete.stopSwim();
    }
  }
}

void keyPressed(){
  if (water.active && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN)){
    swim = true;
    pete.move(keyCode, water);
  }
}

void keyReleased(){
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN){
    swim = false;
  }
}
