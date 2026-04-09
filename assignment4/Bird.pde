class Bird{
  //the bird state (0 = bird is ready, 1 = 
  int state;
  //positon of the bird on the screen
  PVector position;
  //Speed of the bird in x and y direction 
  PVector velocity;
  //
  PVector acceleration;
  //Spawn time of the bird
  int spawnTime;
  //How long the bird will stay on the screen before fly away 
  int durationTime;
  // // Time when bird enters state 4 or 5
  int endTime;
 
  
  Bird( ){
    //bird start at state 1 
    state = 1;
    //Random x position, fixed y position at 220 due to the bounce line 
    position = new PVector(random(0, 400), 220);
    //Random x speed, random upward y speed
    velocity = new PVector(random(-5,5), random(-10, -5));
    //Start with no accleration during the game start 
    acceleration = new PVector(0, 0);
    //Record the current time when the bird spawn 
    spawnTime = millis();
    //Bird can stay on the screen for 5 sceonds before fly away 
    durationTime = 5000;
    //store the ending timer
    endTime = millis();
    
    
  }
  
  // control the birds movement and the state change
  // State 1 = starting state
  // Decide which direction bird should face
  void update(){
     if(state == 1){
      if(velocity.x < 0){
        //if velocity x smaller than zero, bird will go left 
        state = 2; 
      }
      
      //if velocity x bigger than zero, bird will go right 
      if(velocity.x > 0){
        state = 3;
      }
      
      }
      
      //state 2  equals birds will fly to left 
        if( state == 2){
     
        // if the birds goes to the left wall, bird will bounce back and change the direction to right
        if(position.x < 0){
          //reverse the velocity x direction
          velocity.x = -velocity.x;
          //change to face right 
          state = 3;
        }
    }
    
    
      //state 3 equals birds will fly to right 
      if ( state == 3){
        //// if the birds goes to the right wall, bird will bounce back and change the direction to left
        if (position.x > 400){
          //reverse  velocity x direction 
          velocity.x = -velocity.x;
          //change to face left 
          state = 2;
        }
      }
      
      //state 4 equals bird equals bird fly away
      if(state == 4){
        //Stop the horizontal movement 
        velocity.x = 0;
        //move upward slowy 
        velocity.y = -1;
        
        //After 2 second the bird will disappears 
         if(millis() - endTime >  2000){
          state = 0;
         
        }
      
        
        
      }
      
      
      //state 5 equals bird got shooted and fall down 
      if(state == 5){
        //stop  the horizontal movement
        velocity.x = 0;
        //Remove the horizontal acceleration
        acceleration.x = 0;
        //Add the downward gravity
        acceleration.y = 0.2;
        
        //after 3 seconds, bird disappears
        if(millis() - endTime >  3000){
          state = 0;
      }
      }
      
      //if the state equlas 2 or 3, check the fly away when the bird is alive or flying 
      if(state == 2 || state == 3){
        //If mouse is pressed and corsshair hits the bird, 
        if(mousePressed && ((position.x - mouseX) * (position.x - mouseX) + (position.y - mouseY) * (position.y - mouseY)) < 15 * 15){
          
          // chaneg the state to 5 
           state = 5;
           // Stop vertical movement before falling
           velocity.y = 0;
            // Add 1 to bird kill score
           birdKillBox.update();
             // Save the time when bird was shot
           endTime = millis();
        }
        
        
         // If bird stays too long without being shot
        if(millis() - spawnTime > durationTime){
          //bird will fly away due to the state 4
          state = 4;
          //add 1 to the bird fly away box
          birdFlyAwayBox.update();
          // Save the time when bird escaped
          endTime = millis();
        }
        
         // Bounce if the bird goes below bottom limit
        if(position.y > 220){
          velocity.y = -velocity.y;
          
        }
        
        // Bounce if  the bird goes above top limit
        if(position.y < 0){
          velocity.y = -velocity.y;
        }
        
        
      }
      // Update bird position using velocity
      position.x = position.x + velocity.x;
      position.y = position.y + velocity.y;
      
       // Update velocity using acceleration
      velocity.x = velocity.x + acceleration.x;
      velocity.y = velocity.y + acceleration.y;
      
    }
   
    
  
  
  // draw bird different icons during different states 
  void display() {
    
    //bird facing left icon during state 2 
    if(state == 2){
   //set color to yellow
   fill(255, 255, 0);
   //draw the head of the bird facing left
   rect(position.x , position.y - 10 ,-10,10);
   //draw the body of the bird but facing keft
   rect(position.x  + 10 , position.y, -20, 10);
   //set color to red for the beak
   fill(255,0,0);
   //draw the beak facing left 
   triangle(-10 + position.x, position.y - 10 , -10 + position.x, position.y  , -20 + position.x, position.y );
   // set the green color to wings
   fill(0,255,0);
   //draw the wings
   triangle( position.x, position.y, position.x + 10, 5 + position.y, position.x, 10 + position.y);
   //set color to black for eye
   fill(0);
   //draw the eye
   ellipse(-5 + position.x, position.y - 5 , 5, 5);
    
  }
    
     //bird facing right  icon during state 3
    if(state == 3){
    //set color to yellow   
   fill(255, 255, 0);
   //draw the head of the bird facing right 
   rect(position.x , position.y - 10 ,10,10);
   //draw the boy of the bird
   rect(position.x - 10 , position.y, 20, 10);
   //set red to the beak
   fill(255,0,0);
   //draw the beak facing right 
   triangle(10 + position.x, position.y - 10 , 10 + position.x, position.y  , 20 + position.x, position.y );
   //set the wings to green
   fill(0,255,0);
   //draw the wing
   triangle( position.x, position.y, position.x - 10, 5 + position.y, position.x, 10 + position.y);
   //set color to black to the eys
   fill(0);
   //draw the eye
   ellipse(5 + position.x, position.y - 5 , 5, 5);
     
      
      
    }
    
    //state 4 will draw the bird fly away 
    if(state == 4){
      //set tje body and head color to yellow 
    fill(255, 255, 0);
    //draw the head 
   rect(0 + position.x - 10 ,10 + position.y - 10,10,10);
   // set color to the beak
   fill(255,0,0);
   // draw the beak
   triangle(0 + position.x -10 ,10  + position.y - 10 ,5 + position.x -10 ,0+ position.y - 10 ,10 + position.x - 10 ,10 + position.y - 10);
   //set color to the eye
   fill(0);
   //draw the eye
   ellipse(5 + position.x - 10 ,15 + position.y - 10 ,5,5);
   //set color to wing
   fill(0,255,0);
   //draw the wings
   triangle(10  + position.x - 10,10  + position.y - 10 ,10 + position.x - 10,20 + position.y - 10,20  + position.x - 10,20 + position.y - 10 );  
   triangle(-10  + position.x - 10 + 10 , 10  + position.y - 10 , -10 + position.x - 10 + 10 ,20 + position.y - 10, -20  + position.x - 10 + 10,20 + position.y - 10 );  
      
      
    }
    
    // State 5 will draw the bird falling down
    if(state == 5){
      //set yellow to the head
   fill(255, 255, 0);
   //draw the head
   rect(0 + position.x - 10 ,10 + position.y - 10,10,10);
   //set color to the beak
   fill(255,0,0);
   //draw the beak
   triangle(0 + position.x -10 ,20 + position.y - 10 ,5 + position.x -10 ,25 + position.y, 10 + position.x -10, 20 + position.y - 10);
   //set color to the eye
   fill(0);
   //draw the eye
   ellipse(5 + position.x -10 ,15 + position.y - 10, 5, 5);

      
    }
 
    
    
    
  
   
   
 }
    
    
  
  
  
}
    
    
  
  
  

   
  

    
    
    
  
   
   
