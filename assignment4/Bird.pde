class Bird{
  int state;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Bird( ){
    state = 1;
    position = new PVector(random(0, 400), 220);
    velocity = new PVector(random(-5, 5), random(-10, -5));
    acceleration = new PVector(0, 0);
    
  }
  
  void update(){
     if(state == 1){
      if(velocity.x < 0){
        state = 2; 
      }else{
        state = 3;
      }
      }
      
      if( state == 2){
        if(position.y > 220){
          velocity.y = -velocity.y;
        }
        
        if(position.x < 0){
          velocity.x = -velocity.x;
          state = 3;
        }
        
      }
      
      if ( state == 3){
        if(position.y > 220){
          velocity.y = -velocity.y;
          
        }
        if(position.y < 0){
          velocity.y = -velocity.y;
        }
        
        if (position.x > 400){
          velocity.x = -velocity.x;
          state = 2;
        }
      }
      
      
      position.x = position.x + velocity.y;
      position.y = position.y + velocity.y;
      velocity.x = velocity.x + acceleration.x;
      velocity.y = velocity.y + acceleration.y;
      
    }
   
    
  
  
  
  void display() {
    fill(0);
    text(state,position.x , position.y);
    
  }
  
  
  
  
}
