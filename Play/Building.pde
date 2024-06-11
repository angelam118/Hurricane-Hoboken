public class Building{
  int x, y;
Building(int xStart, int yStart){
  x=xStart;
  y=yStart;
}
void display(){
  fill(#969FA5);
 PShape rec = createShape(RECT, x, y, 20, -50-y); 
 shape(rec);
}
void addX(int toAdd){
  x=x-toAdd;
}
int getX(){
  return x;
}
void move(){
  addX(10);
}
}
