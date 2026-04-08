class Bird{
  //The bird current state (0 = disapper , 1 = decide the direction of the bird, 2 = flying left side
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
  
  //defined a update function to control the bird's state, animation, and the movement
  void update(){
    
     // decide the direction of the bird
     if(state == 1){
      // check the velortiy, if velocity x < 0 it will go left,  otherways velocity x > 0 it will go right
      if(velocity.x < 0){
        state = 2; 
      }
      
      if(velocity.x > 0){
        state = 3;
      }
      
      }
      
      //Bird will flying to left direction based on the state = 2 
        if( state == 2){
        
        // Here is checking when bird hit left wall to bounce to other direction and switch to right direction 
        if(position.x < 0){
          velocity.x = -velocity.x;
          state = 3;
        }
        
     
       }
       
     
      //Bird will flying to right direction based on the state = 3 
      if ( state == 3){
        // Here is checking when brid hit right wall to bounce to other direction and switch to left direction 
        if (position.x > 400){
          velocity.x = -velocity.x;
          state = 2;
        }
      }
      
      //Birds will slowly goes up based on the state = 4 
      if(state == 4){
        velocity.x = 0;
        velocity.y = -1;
        
        //After 2 seconds the bird will disapper (state 0 )
        if(millis() - endTime >  2000){
          state = 0;
         
      }
      }
      
      
      //The brid will fall down with the gravity based on state = 5 
      if(state == 5){
         velocity.x = 0;
        acceleration.x = 0;
        acceleration.y = 0.2;
        //after 3 seconds the bird will fall down and disappear 
         if(millis() - endTime >  3000){
          state = 0;
      }
      }
      
      // if state 2 or state 3 will run this part, I made this part like this because they have similar function. Also I don't write two times 
      //for state 2 and state 3
       if(state == 2 || state == 3){
        //during mouse pressed and the mouse is close enough to the bird ( bird's hitbox)
        if(mousePressed && ((position.x - mouseX) * (position.x - mouseX) + (position.y - mouseY) * (position.y - mouseY)) < 15 * 15){
          
          //it will change the bird's state to 5 
           state = 5;
           //stop any vertical movment immediately after getting shot by the players 
           velocity.y = 0;
           
           //store the current time to control how long the bird's dead animation stay 
           endTime = millis();
           
           
        }
        
        // check if the bird has existed longer than the allowed duration
        if(millis() - spawnTime > durationTime){
          
          //make the bird state to four and let the bird fly away
          state = 4;
          
          //store the current time to control the flyaway animation
          endTime = millis();
        }
        
        //check if the birds hit the bounce line 
        if(position.y > 220){
          velocity.y = -velocity.y;
          
        }
        
        //check the birds hit the top of the screen 
        if(position.y < 0){
          velocity.y = -velocity.y;
        }
        
        
      }
      
      
      position.x = position.x + velocity.x;
      position.y = position.y + velocity.y;
      velocity.x = velocity.x + acceleration.x;
      velocity.y = velocity.y + acceleration.y;
      
    }
   
     void display() {
    
    //State 2 the bird will fly to left
    if(state == 2){
   // draw the bird to left position
   //set color to yellow
   fill(255, 255, 0);
   //draw the main head facing right
   rect(position.x , position.y - 10 ,-10,10);
   //draw the body facing left
   rect(position.x  + 10 , position.y, -20, 10);
   //set color to red
   fill(255,0,0);
   //draw the beak pointing left
   triangle(-10 + position.x, position.y - 10 , -10 + position.x, position.y  , -20 + position.x, position.y );
   //set color to the green
   fill(0,255,0);
   //draw the  wing
   triangle( position.x, position.y, position.x + 10, 5 + position.y, position.x, 10 + position.y);
   //set color to black
   fill(0);
   //draw the eyes 
   ellipse(-5 + position.x, position.y - 5 , 5, 5);
    
  }
    
    
    //State 3 the bird will fly to right
    if(state == 3){
   //set color to yellow
  fill(255, 255, 0);
  //draw the main head facing right 
   rect(position.x , position.y - 10 ,10,10);
    //draw the body facing to right 
   rect(position.x - 10 , position.y, 20, 10);
   //set color to red
   fill(255,0,0);
   //draw the beak pointing to right
   triangle(10 + position.x, position.y - 10 , 10 + position.x, position.y  , 20 + position.x, position.y );
   //set to green 
   fill(0,255,0);
   //draw the wing
   triangle( position.x, position.y, position.x - 10, 5 + position.y, position.x, 10 + position.y);
   //set to black 
   fill(0);
   //set the eye
   ellipse(5 + position.x, position.y - 5 , 5, 5);
     
      
      
    }
    
    // state 4 the bird fly away
    if(state == 4){
    //set to yellow 
    fill(255, 255, 0);
   //draw the head
   rect(0 + position.x - 10 ,10 + position.y - 10,10,10);
   //set to red
   fill(255,0,0);
   //draw the break
   triangle(0 + position.x -10 ,10  + position.y - 10 ,5 + position.x -10 ,0+ position.y - 10 ,10 + position.x - 10 ,10 + position.y - 10);
   //set to black 
   fill(0);
   //draw the eye
   ellipse(5 + position.x - 10 ,15 + position.y - 10 ,5,5);
   //set to green
   fill(0,255,0);
   //draw the wings 
   triangle(10  + position.x - 10,10  + position.y - 10 ,10 + position.x - 10,20 + position.y - 10,20  + position.x - 10,20 + position.y - 10 );  
   triangle(-10  + position.x - 10 + 10 , 10  + position.y - 10 , -10 + position.x - 10 + 10 ,20 + position.y - 10, -20  + position.x - 10 + 10,20 + position.y - 10 );  
      
      
    }
    
    //state 5 the bird falling down 
    if(state == 5){
    //set to yellow
   fill(255, 255, 0);
   //draw the head
   rect(0 + position.x - 10 ,10 + position.y - 10,10,10);
   //set color to red
   fill(255,0,0);
   // draw the beak 
   triangle(0 + position.x -10 ,20 + position.y - 10 ,5 + position.x -10 ,25 + position.y, 10 + position.x -10, 20 + position.y - 10);
   //set to black
   fill(0);
   // draw the eyes 
   ellipse(5 + position.x -10 ,15 + position.y - 10, 5, 5);

      
    }
 
    
    
    
  
   
   
 }
    
    
  
  
  

   
  

    
    
    
  
   
   
