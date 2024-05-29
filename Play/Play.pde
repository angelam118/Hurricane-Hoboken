int start=0;
void setup(){
  size(500,500);
}
void draw(){
  background(#4F93BF);
  frameRate(1);
  fill(#A0D0F0);
  noStroke();
  rect(0, 0, 500, 200);//this draws background again every time -- need to move the gray blocks to front
  stroke(1);
  //int h = (int)(Math.random()*100)+1;
  //building(h, start);
  //start+=20;
  for (int i =0; i< 30;i++){
    int h = (int)(Math.random()*100)+1;
    building(h, i*20);
  }
  Character pete= new Character("pete");
    noLoop();
    fill(#EAE1C0);
  rect(400, 250, 40 , 200);//sand bank
}
void building(int h, int start){
  fill(#969FA5);
 rect(start, h, 20, 200-h); 
}
