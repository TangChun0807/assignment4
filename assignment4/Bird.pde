class Bird{
  //The bird current state (0 = disapper (nothing happened), 1 = decide the direction of the bird, 2 = flying left side
  //, 3 = flying right side, 4 = fly away to the top screen, 5 = bird going down to the screen)
  int state;
  PVector position;
  PVector velocity;
  PVector acceleration;
  int spawnTime;
  int durationTime;
 
  
  Bird( ){
    state = 1;
    position = new PVector(random(0, 400), 220);
    velocity = new PVector(random(-5,5), random(-10, -5));
    acceleration = new PVector(0, 0);
    spawnTime = millis();
    durationTime = 5000;
    
    
  }
  
  void update(){
     if(state == 1){
      if(velocity.x < 0){
        state = 2; 
      }
      
      if(velocity.x > 0){
        state = 3;
      }
      
      }
      
        if( state == 2){
        
        if(position.x < 0){
          velocity.x = -velocity.x;
          state = 3;
        }
        
     
       }
      
      if ( state == 3){
        
        if (position.x > 400){
          velocity.x = -velocity.x;
          state = 2;
        }
      }
      
      
      if(state == 4){
        velocity.x = 0;
        velocity.y = -1;
        
      }
      
      
      
      if(state == 5){
         velocity.x = 0;
        acceleration.x = 0;
        acceleration.y = 0.2;
      }
      
      
      position.x = position.x + velocity.x;
      position.y = position.y + velocity.y;
      velocity.x = velocity.x + acceleration.x;
      velocity.y = velocity.y + acceleration.y;
      
    }
   
    
  
  
  
  void display() {
    fill(0);
    text(state,position.x , position.y);
    
  }
  
  
  
  
}
