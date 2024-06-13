public class Boat{
  int boatX;
  PImage boat;
  Boat(){
    boatX=250;
    boat= loadImage("boat.png");
  }
  void drawBoat(){
    image(boat, boatX, -130, 200, 200);  
  }
   void addX(int x){
     boatX+=x;
   }
   int getX(){
     return boatX;
   }
}
