import java.util.*;
int start=0;
boolean key;

SupplyList supplies=new SupplyList();

int openness=0;
boolean openMore=false;
Character pete;
boolean swim=false;
boolean won = false;
boolean inSand=false;
boolean first =true;
int curBuild=0;
Shark shark;
Hurricane hur;
Sand sand = new Sand();
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
    if(i==200){//select last building so you can win
      last=builds.get(i);
    }
  }
  pete=new Character("pete");
  hur=new Hurricane();
  shark = new Shark(0, 0);
}
void draw(){
  //
  translate(width/2, height/2);
  //System.out.println(width);
  //display for inside of shark
  if(shark.checkInside()){
    openness=supplies.openMouth();
   background(#8B1414);
   stroke(1);
  fill(#4F93BF);
  rect(-250, -openness, 500, 20+openness);//sky behind teeth
  fill(#F5F0F0);
  for(int i=-250;i<250;i+=30){
    triangle(i, -openness, i+15, 20-openness, i+30, -openness);
  }
  for(int i=-265;i<250;i+=30){
    triangle(i, 20,  i+10, 0, i+30, 20 );
  }
  text("You were eaten by a shark! Stack objects to escape", -100, -100);
  if(openMore){
    openness++;
  }
  supplies.drawList();
  if(openness>=100){
    shark.escape();
    first=false;
  }
}
  //display for inside sand bank
  else if(inSand){
    
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
    first=false;
    hur.stay();
    curBuild++;
    sand.setSandX(sand.getSandX()-1);

  }else {
    pete.stopSwim();
    if(!won){
    hur.approach();
    }
     if(first){
       text("swim to school before the hurricane comes!\n press right arrow key to start", -100, 70);
     }
  }
 // shark= new Shark(40, 460);
   // shark.swim(); //<>//
   // fill(#C2AFD8);
  }
  
  //if at last buidding
  if(last.getX()<=0){
    PImage img = loadImage("stuy.png");
    image(img, 70, -130, 200, 200);
    won=true;
    text("WIN", 0, 0);
    System.out.println("WIN");
    hur.stay();
  }
  //System.out.println(curBuild);
 if (curBuild>=20){
   //fill(#C2B280);
    //System.out.println(sandX);
    //rect(200, -50, 200, 300);
   sand.drawSandBank();
   System.out.println("sand"+sand.getSandX());
   if (sand.getSandX()<=0){
     inSand=true;
   }
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
  if (shark.checkInside()){
    supplies.getClicked(mouseX-width/2, mouseY-height/2);
    System.out.println(mouseX-width/2);
    System.out.println(mouseY-height/2);
  }
}
void mouseReleased(){
  if(shark.checkInside()){
    supplies.move(mouseX-width/2, mouseY-height/2);
    System.out.println(mouseX-width/2);
    System.out.println(mouseY-height/2);
    openMore=false;
  }
}
  
