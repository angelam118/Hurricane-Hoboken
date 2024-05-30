import java.util.*;
int start=0;
boolean key;
Character pete;
ArrayList<Building> builds;
void setup(){
  size(500,500);
    frameRate(1);
    builds = new ArrayList<Building>();

}
void draw(){
  background(#4F93BF);
  fill(#A0D0F0);
  noStroke();
  rect(0, 0, 500, 200);//this draws background again every time -- need to move the gray blocks to front
  stroke(1);
  //int h = (int)(Math.random()*100)+1;
  //building(h, start);
  //start+=20;
  //if(key){
  for (int i =0; i< 30;i++){
    int h = (int)(Math.random()*100)+1;
    Building b = new Building(i*20, h);
    builds.add(b);
    b.display();
  //}
  }
  pete= new Character("pete");
    noLoop();
    //fill(0);
    //pete.drawChar();

    pete.swim();
    fill(#EAE1C0);
  rect(400, 250, 40 , 200);//sand bank
  //pete.drawChar();
}
void building(int h, int start){
  fill(#969FA5);
 PShape rec = createShape(RECT, start, h, 20, 200-h); 
 shape(rec);
 if(millis()==2){
   shape(createShape(RECT, start-20, h, 20, 200-h));
 }
}
void passTime(){
  if(frameCount==1){
    for(Building i:builds){
      i.addX(10);
      i.display();
    }
  }
}
void keyPressed(){
key =true;
    }
  
