Character pete;
Sand sand;

void setup(){
  size(500, 500);
  pete = new Character("Pete", 30, height / 2);
  sand = new Sand(pete);
  sand.start();
}

void draw(){
  sand.update();
}

void keyPressed(){
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN){
    pete.move(keyCode, sand);
  }
}

void mouseDragged(){
  sand.dig(mouseX, mouseY);
}
