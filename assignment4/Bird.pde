class Bird{
  //The bird current state (0 = disapper (nothing happened), 1 = decide the direction of the bird, 2 = flying left side
  //, 3 = flying right side, 4 = fly away to the top screen, 5 = bird going down to the screen)
  int state;
  //The position of the bird
  PVector position;
  //The speed of Bird flying 
  PVector velocity;
  //The bird acceleration
  PVector acceleration;
  // The time bird spawn on the screen
  int spawnTime;
  // How long does bird stays on the screen before fly away to the top 
  int durationTime;
 
  //The constructor of the bird 
  Bird( ){
    //during the bird spawn with a decided direction
    state = 1;
    // the position of the bird will start with a random number between 0 and 400, and a fixed y on 220 because the bouncing line 
    position = new PVector(random(0, 400), 220);
    // Birds will go to random left or right based on the random number between -5 and 5  (X), and birds will always go up based 
    //on the random number -10 and -5 (Y)
    velocity = new PVector(random(-5,5), random(-10, -5));
    // no accleration during the game start 
    acceleration = new PVector(0, 0);
    // Save the current time for the bird
    spawnTime = millis();
    //bird will lives 5 seconds 
    durationTime = 5000;
    //store the current time for bird when change to a new state (4 and 5)
    endTime = millis();
    
    
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
