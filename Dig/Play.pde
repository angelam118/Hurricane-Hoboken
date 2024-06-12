Character pete;
Sand sand;
boolean swim;

void setup(){
  size(500, 500);
  pete = new Character("Pete", 30, height / 2);
  sand = new Sand(pete);
  sand.start();
}

void draw(){
  if (sand.active){
    sand.update();
    if (swim){
      pete.swim();
    }
    else{
      pete.stopSwim();
    }
  }
}

void keyPressed(){
  if (sand.active && (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN)){
    swim = true;
    pete.move(keyCode, sand);
  }
}

void keyReleased(){
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN){
    swim = false;
  }
}

void mouseDragged(){
  sand.dig(mouseX, mouseY);
}
