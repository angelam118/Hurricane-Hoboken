import java.util.*;
int start=0;
boolean key;
Character pete;
ArrayList<Building> builds;
void setup(){
  size(500,500);
    frameRate(100);
    builds = new ArrayList<Building>();
    for (int i =0; i< 30000;i++){
      int h = (int)(Math.random()*100)+1;
      Building b = new Building(i*20, h);
      builds.add(b);
        pete= new Character("pete");

  
}
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
    pete.drawChar();
  for (Building i :builds){
    i.display();
  }
  //}
  Shark shark= new Shark();
  shark.drawShark(); //<>//
      //pete.swim();

    //noLoop();
    //fill(0);
    pete.drawChar();
    fill(#C2AFD8);
    //pete.swim();
    //fill(#EAE1C0);
  //rect(400, 250, 40 , 200);//sand bank
      //fill(#C2AFD8);

  //pete.drawChar();
}
void building(int h, int start){
  fill(#969FA5);
 PShape rec = createShape(RECT, start, h, 20, 200-h); 
 shape(rec);
}
//void passTime(){
//  if(frameCount==1){
//    for(Building i:builds){
//      i.addX(10);
//      i.display();
//    }
//  }
//}
void keyPressed(){
  //key =true;
   //circle(50, 50, 50);
  if(keyCode==RIGHT){
     pete.swim();
     pete.drawChar();
    for(Building i:builds){
      i.move();
      i.addX(10);
  }
  

  //translate(width/2, height/2);
//rotate(PI/3.0);
//rect(-104, -104, 208, 208);
      //pete.swim();
  //rect(40, 40, 40, 40);

  }
}

void keyReleased(){
    if (keyCode==RIGHT){ //<>//
      pete.drawChar();
    }
 }
    
  
