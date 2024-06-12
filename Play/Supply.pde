public class Supply{
  int x, y, w, h;
  Supply(int xV, int yV, int wV, int hV){
    x=xV;
    y=yV;
    w=wV;
    h=hV;
  }
  void drawSup(){
    rect(x, y, w, h);
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getH(){
    return h;
  }
  int getW(){
    return w;
  }
  void move(int xM, int yM){
    x=xM;
    y=yM;
  }
}
