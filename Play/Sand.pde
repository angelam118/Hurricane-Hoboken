public class Sand{
  boolean inSand=false;
  int sandX=250;
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
    rect(sandX, -50, 500, 300);
  }
}
