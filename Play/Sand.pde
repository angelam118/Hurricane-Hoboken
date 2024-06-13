public class Sand{
  Character character;
  boolean active;
  PGraphics sandTexture;
  boolean[][] dugArea;
  ArrayList<Obstacle> obstacles;
  boolean inSand=false;
  int sandX=250;
    Sand(Character c){
    character = c;
    active = true;
    sandTexture = createSandTexture();
    dugArea = new boolean[500][500]; 
    obstacles = createObstacles();
  }
  boolean checkSand(){
    return inSand;
  }
  void stuck(){
    inSand=true;
  }
  int getSandX(){
    return sandX;
  }
  void setSandX(int x){
    sandX=x;
  }
  void drawSandBank(){
    fill(#C2B280);
    //System.out.println(sandX);
    rect(sandX, -50, 100, 300);
  }
  

 PGraphics createSandTexture(){
  PGraphics pg = createGraphics(500, 500); 
  pg.beginDraw();
  pg.background(#C2B280); 
  
  int numGrains = 1000;
  for (int i = 0; i < numGrains; i++){
    float x = random(pg.width);
    float y = random(pg.height);
    float grainSize = 2;
    pg.fill(160, 140, 100); //idk how to get the colors right
    pg.noStroke();
    pg.ellipse(x, y, grainSize, grainSize);
  }
pg.endDraw();
  return pg;
}

  ArrayList<Obstacle> createObstacles(){ //should randomize location?
    ArrayList<Obstacle> obs = new ArrayList<Obstacle>();
    obs.add(new Obstacle(200, 200, 50, 50));
    obs.add(new Obstacle(300, 100, 30, 60));
    obs.add(new Obstacle(400, 300, 60, 30)); 
    return obs;
  }

  void start(){
    active = true;
    character.x=-200;
    character.y=(int)random(-250, height/2); //randomize starting loc
  }

  void update(){
    if (active){
      image(sandTexture, -250, -250, 500, 500);

      for (int i = 0; i < width; i++){
        for (int j =0; j < height; j++){
          if (dugArea[i][j]){
            fill(#4F93BF); 
            rect(i-250, j-250, 1, 1);
          }
        }
      }
      for (Obstacle obs : obstacles){
        obs.display();
      }
      character.display();
      //if (character.x >= width - 30){ //reached right side
      //  active = false; //end
      //}
    }
  }

  void dig(float mouseX, float mouseY){
    int digRadius = 20; //make smaller to make it harder
    for (int i = -digRadius; i <= digRadius; i++){
      for (int j = -digRadius; j <= digRadius; j++){
        int x = (int)mouseX + i;
        int y = (int)mouseY + j;
        if (x >= 0 && x < width && y >= 0 && y < height){
          dugArea[x][y] = true;
        }
      }
    }
  }

  boolean canMove(float newX, float newY){
    if (newX < -250 || newX >= width || newY < -250 || newY >= height){
      return false;
    }
    if (!dugArea [(int)newX+250][(int)newY+250]){
      return false;
    }
    for (Obstacle obs:obstacles){
      if (obs.contains(newX, newY)){
        return false;
      }
    }
    return true;
  }
}

class Obstacle{
  float x, y, w, h;

  Obstacle(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display(){
    fill(#808080); 
    rect(x-250, y-250, w, h);
  }

  boolean contains(float px, float py){
    return px > x && px < x + w && py > y && py < y + h;
  }
}
