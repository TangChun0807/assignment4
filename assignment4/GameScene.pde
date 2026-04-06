class GameScene{
  void display(){
    // the dust ground 
    noStroke();
    fill(158,145,92);
    rect(0,280,400,120);
    
    //the left Tree
    fill(160,126,113);
    rect(40,190,40,90);
    fill(46,111,64);
    quad(0,190,40,120,80,120,120,190);
    quad(10,120,50,70,70,70,110,120);
    triangle(30,70,60,20,90,70);
    
    //the right tree
    fill(160,126,113);
    rect(360,190,50,90);
    fill(46,111,64);
    quad(320,190,360,120,400,120,400,190);
    
   
   
    
    
    //the grass
    fill(65,152,10);
    triangle(0,280,30,220,60,280);
    triangle(60,280,90,220,120,280);
    triangle(120,280,150,220,180,280);
    triangle(180,280,210,220,240,280);
    triangle(240,280,270,220,300,280);
    triangle(300,280,330,220,360,280);
    triangle(360,280,390,220,420,280);
    
    
  }

}
