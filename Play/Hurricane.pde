public class Hurricane{
  int hur=0;
  //int timeLeft;
  void approach(){
    fill(0, 200);
    if (hur<=250){
        rect(-250, -250, hur, 500);
        hur++;
     }
     else{
       background(#8B1414);
       fill(#F53614);
       textSize(100);
       text("YOLO", -80, 0);
       pete.alive=false;
        textSize(20);
       text("you have been gotten by the hurricane", -100, 100);

     }
     delay(10);
}
  void stay(){//keep still while swimming
     fill(0, 200);
     rect(-250, -250, hur, 500);

  }
}
