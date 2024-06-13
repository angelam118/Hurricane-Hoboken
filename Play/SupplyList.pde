public class SupplyList{
  ArrayList <Supply> supplies=new ArrayList<Supply>();
  int selected=-1;
  int openness=0;
  int stackedY;//supply at top of stack
  SupplyList(){
    //System.out.println(width);//width should be 500, why is it 100?
    for(int i=0;i<10;i++){
     //will change these back to beign based on width when fixed
    supplies.add(new Supply((int)(random(-250, 250)), (int)(random(20, 500/2-30)), (int)(Math.random()*50+50), (int)(Math.random()*50+50)));
  }
  }
  void drawList(){
    for(Supply i:supplies){
    i.drawSup();
  }
  }
  void getClicked(int x, int y){//check if clicked spot is in rect
  int inx=0;
    for(Supply i: supplies){//make sure to reset select index
      if(x<=i.getW()+i.getX() && x>=i.getX() && y<=i.getH()+i.getY() && y>=i.getY()){
        selected=inx;
        //System.out.println("inx"+inx);
      }else{
              inx++;
      }
    }
    
  }
  int openMouth(){
    openness=-stackedY;
    return openness;
  }
  void move(int x, int y){
    //System.out.println(selected);
    if (selected>=0){
      supplies.get(selected).move(x, y);
      stackedY=supplies.get(selected).getY();
      selected=-1;
    }
    selected=-1;
  }
}
