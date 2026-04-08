class ScoreBox{
  int count;
  int type;
  
  
  ScoreBox(int a, int b){
    
    count = a;
    type = b;
 
}
  
  void update(){
   if(type == 1){
     count--;
     
   }
   
   if(type == 2){
     
     count++;
   }
   
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
