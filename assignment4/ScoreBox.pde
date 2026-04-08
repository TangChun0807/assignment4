class ScoreBox{
  //Stores the score value 
  int count;
  //define which types of score for the box represents
  int type;
  
  //constructor for the ScoreBox 
  ScoreBox(int a, int b){
    
    count = a;
    type = b;
 
}
  
  //update the function based on the score type 
  void update(){
   // if the type equals to 1 the bullet will subtract 1 during shooting 
   if(type == 1){
     count--;
     
   }
   
   // if the type equals to 2 the bird killed will increase if the player sucess to shoot the bird
   if(type == 2){
     
     count++;
   }
   
   // if the type equlas to 3 the bird fly away will increas 1 if the bird doesn't get killed in 5 seconds 
   if(type == 3){
     
     count++;
   }
   
    
  }
  
  
  
  void display(){
  
    
   
      
   if(type == 1){
    noStroke();
    fill(125);
    rect(0,310,190,30);
    for(int i = 0; i < count; i++){
    noStroke();
    fill(255, 215, 0);
    rect(0 + i * 20 ,320,10,10);
    
   }
   }
   
   if(type == 2){
     noStroke();
     fill(255,255,0);
     rect(0,340,190,30);
    for(int i = 0; i < count; i++){
    noStroke();
    fill(255, 0, 0);
    rect(0 + i * 20 ,350,10,10);
    
    }
    
   }
   
   
     if(type == 3){
     noStroke();
     fill(0);
     rect(0,370,190,30);
    for(int i = 0; i < count; i++){
    noStroke();
    fill(0,255,0);
    rect(0 + i * 20 ,380,10,10);
    
    }
    
   }

  }
  
}
