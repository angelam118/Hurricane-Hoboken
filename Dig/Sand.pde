
void setup(){
  size(500, 500, P3D);
}

void draw(){
  background(#EAE1C0);
  frameRate(1);
  PImage img = loadImage("sand.png");
  textureMode(NORMAL);
  beginShape();
texture(img);
vertex(40, 80, 0, 0);
vertex(320, 20, 1, 0);
vertex(380, 360, 1, 1);
vertex(160, 380, 0, 1);
endShape();
}
