public class Character{
  String name;
  boolean alive;
  int points;
  Character(String chName){
    name=chName;
    alive=true;
    points=0;
    fill(#C2AFD8);
      noStroke();

    circle(300, 300, 30);
    ellipse(220, 295, 60, 10);//left leg
    ellipse(220, 310, 60, 10);   //right leg 
    ellipse(260, 300, 60, 35);// body
    ellipse(280, 300, 60, 10);

  }
  void swim(){
    
  }
}
