import java.util.*;
int start=0;
boolean key;

SupplyList supplies=new SupplyList();

int openness=0;
boolean openMore=false;
Character pete;
boolean insideBoat=false;
boolean swim=false;
boolean won = false;
boolean inSand=false;
boolean first =true;
boolean firstSand=true;
boolean firstBoat=true;
int curBuild=0;
Shark shark;
Hurricane hur;
Boat boat;
Sand sand;// = new Sand(pete);
ArrayList<Building> builds;
Building last ;
Water water;
void setup(){
  size(500,500);
  frameRate(100);
  builds = new ArrayList<Building>();//create list of buildings
  for (int i =0; i< 1000;i++){
    int h = (int)(Math.random()*-170)-70;
    Building b = new Building(i*20-250, h);
    builds.add(b);
    if(i==400){//select last building so you can win
      last=builds.get(i);
    }
      pete=new Character("pete");
    sand=new Sand(pete);
     water=new Water(pete);

  }
  hur=new Hurricane();
  shark = new Shark(0, 0);
  boat=new Boat();
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
    println("inSand"+pete.x);
    if(firstSand){
         sand.start();
         firstSand=false;
    }
    //pushMatrix();
    //translate(-250, -250);
    sand.update();
    if(swim){
      pete.swim();
    }else{
      pete.stopSwim();
    }
    //pete.display();
    //popMatrix();
    fill(0);
    text("you are stuck in a sand bank, dig yourself to the other side", -100, 200);
    //System.out.println(pete.x);
    //inSand=false;
    if(pete.x>=200){
      println("should be out");
      inSand=false;
      pete.x=0;
      pete.y=0;

  }
  }else if(insideBoat){
    if(firstBoat){
     water.start();
     firstBoat=false;
    }
    //pushMatrix();
    //translate(-250, -250);
    if (water.active){
    water.update();
        fill(0);
    text("you are stuck under a boat! evade the propellers to get to the other side", -130, 200);
    if (swim){
      pete.swim();
    }
    else{
      pete.stopSwim();
    }
    //popMatrix();
    
    }
    if(pete.x>=250){
      insideBoat=false;
      pete.x=0;
      pete.y=0;
    }
  }
  else{
    //println("OUT SAND");
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
    if(curBuild>=300){
    sand.setSandX(sand.getSandX()-1);
    }

  }else {
    pete.stopSwim();
    if(!won){
    hur.approach();
    }
     if(first && pete.alive){
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
    //System.out.println("WIN");
    hur.stay();
  }
  //BOAT DO NOT DELETE    
  if (curBuild>=800){
    boat.addX(-1);
    if(!insideBoat){
    boat.drawBoat();
    }
    if(boat.getX()==0){
      insideBoat=true;
      //text("you are trapped under a boat! Careful not to get hit by propellers", -30, 0);
      boat.addX(boat.getX()-1);
    }
  }
   if (curBuild>=20){
 //System.out.println(curBuild);
    shark.addX();
    if(!shark.checkInside()){
      shark.drawShark();
    }
    if(shark.getX()==0){
      shark.setInside();
    }
  }
  //SAND BANK DO NOT DELETE
 if (curBuild>=300&&!inSand){
   //fill(#C2B280);
    //System.out.println(sand.getSandX());
    //rect(200, -50, 200, 300);
   sand.drawSandBank();
   //System.out.println("sand"+sand.getSandX());
   if (sand.getSandX()==0){
     inSand=true;
     sand.setSandX(sand.getSandX()-30);
     //sand.update();
   }}
 


}
void building(int h, int start){
  fill(#969FA5);
 PShape rec = createShape(RECT, start, h, 20, 200-h); 
 shape(rec);
}
void keyPressed(){
   if(inSand){
     if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN){
       swim=true;
     pete.move(keyCode, sand);
  }
   }else if(insideBoat){
     if ((keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN)){
    swim = true;
    //System.out.println("shld b swimming");
    pete.move(keyCode, water);
  }
   }else if(keyCode==RIGHT){
     swim=true;
     //pete.drawChar();
    for(Building i:builds){
      i.move();
      i.addX(10);
  }
  }
}

void keyReleased(){
    if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP || keyCode == DOWN){
    swim=false;
  }
 }
 void mousePressed(){
  if (shark.checkInside()){
    supplies.getClicked(mouseX-width/2, mouseY-height/2);
    //System.out.println(mouseX-width/2);
    //System.out.println(mouseY-height/2);
  }
  //}else if(inSand){
  //    sand.dig(mouseX, mouseY);
  //}
}
void mouseReleased(){
  if(shark.checkInside()){
    supplies.move(mouseX-width/2, mouseY-height/2);
    //System.out.println(mouseX-width/2);
    //System.out.println(mouseY-height/2);
    openMore=false;
  }
}
void mouseDragged(){
  sand.dig(mouseX, mouseY);
}
  
