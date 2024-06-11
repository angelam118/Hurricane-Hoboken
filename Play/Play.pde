import java.util.*;
int start=0;
boolean key;
int openness=0;
boolean openMore=false;
Character pete;
boolean swim=false;
boolean won = false;
Shark shark;
Hurricane hur;
ArrayList<Building> builds;
Building last ;
void setup(){
  size(500,500);
  frameRate(100);
  builds = new ArrayList<Building>();//create list of buildings
  for (int i =0; i< 30000;i++){
    int h = (int)(Math.random()*-170)-70;
    Building b = new Building(i*20-250, h);
    builds.add(b);
    if(i==20){//select last building so you can win
      last=builds.get(i);
    }
  }
  pete=new Character("pete");
  hur=new Hurricane();
  shark = new Shark(0, 0);
}
void draw(){
  translate(width/2, height/2);
      System.out.println(last.getX());

  
  if(shark.checkInside()){
    background(#8B1414);
  fill(#4F93BF);
  rect(-250, -openness, 500, 20+openness);//sky behind teeth
  fill(#F5F0F0);
  for(int i=-250;i<250;i+=30){
    triangle(i, -openness, i+15, 20-openness, i+30, -openness);
  }
  for(int i=-265;i<250;i+=30){
    triangle(i, 20,  i+10, 0, i+30, 20 );
  }
  if(openMore){
    openness++;
  }
  }else{
  
  background(#4F93BF);
  fill(#A0D0F0);
  noStroke();
  rect(-250, -250, 500, 200);// draws background again every time
  stroke(1);
  for (Building i :builds){
    i.display();
  }
  if(swim){
    pete.swim();
    hur.stay();
  }else{
    pete.stopSwim();
    hur.approach();
  }
 // shark= new Shark(40, 460);
   // shark.swim(); //<>//
   // fill(#C2AFD8);
  }
  if(last.getX()<=0){
    PImage img = loadImage("stuy.png");
    image(img, 70, -130, 200, 200);
    text("WIN", 0, 0);
    System.out.println("WIN");
    hur.stay();
  }
}
void building(int h, int start){
  fill(#969FA5);
 PShape rec = createShape(RECT, start, h, 20, 200-h); 
 shape(rec);
}
void keyPressed(){
  //key =true;
   //circle(50, 50, 50);
  if(keyCode==RIGHT){
     swim=true;
     //pete.drawChar();
    for(Building i:builds){
      i.move();
      i.addX(10);
  }
  }
}

void keyReleased(){
    if (keyCode==RIGHT){
      swim=false;
    }
 }
 void mousePressed(){
  openMore=true;
}
void mouseReleased(){
  openMore=false;
}
  
