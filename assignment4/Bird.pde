class Bird{
  int state;
  PVector position;
  PVector velocity;
  PVector acceleration;
  int spawnTime;
  int durationTime;
  int endTime;
 
  
  Bird( ){
    state = 1;
    position = new PVector(random(0, 400), 220);
    velocity = new PVector(random(-5,5), random(-10, -5));
    acceleration = new PVector(0, 0);
    spawnTime = millis();
    durationTime = 5000;
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
        
         if(millis() - endTime >  2000){
          state = 0;
         
        }
      
        
        
      }
      
      if(state == 5){
         
        velocity.x = 0;
        acceleration.x = 0;
        acceleration.y = 0.2;
        
        if(millis() - endTime >  3000){
          state = 0;
      }
      }
      
      if(state == 2 || state == 3){
        if(mousePressed && ((position.x - mouseX) * (position.x - mouseX) + (position.y - mouseY) * (position.y - mouseY)) < 15 * 15){
          
           state = 5;
           velocity.y = 0;
           birdKillBox.update();
           endTime = millis();
        }
        
        if(millis() - spawnTime > durationTime){
          state = 4;
          birdFlyAwayBox.update();
          endTime = millis();
        }
        
        if(position.y > 220){
          velocity.y = -velocity.y;
          
        }
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
    
    if(state == 2){
  
   fill(255, 255, 0);
   rect(position.x , position.y - 10 ,-10,10);
   rect(position.x  + 10 , position.y, -20, 10);
   fill(255,0,0);
   triangle(-10 + position.x, position.y - 10 , -10 + position.x, position.y  , -20 + position.x, position.y );
   fill(0,255,0);
   triangle( position.x, position.y, position.x + 10, 5 + position.y, position.x, 10 + position.y);
   fill(0);
   ellipse(-5 + position.x, position.y - 5 , 5, 5);
    
  }
    
    
    if(state == 3){
      
  fill(255, 255, 0);
   rect(position.x , position.y - 10 ,10,10);
   rect(position.x - 10 , position.y, 20, 10);
   fill(255,0,0);
   triangle(10 + position.x, position.y - 10 , 10 + position.x, position.y  , 20 + position.x, position.y );
   fill(0,255,0);
   triangle( position.x, position.y, position.x - 10, 5 + position.y, position.x, 10 + position.y);
   fill(0);
   ellipse(5 + position.x, position.y - 5 , 5, 5);
     
      
      
    }
    
    
    if(state == 4){
    fill(255, 255, 0);
   rect(0 + position.x - 10 ,10 + position.y - 10,10,10);
   fill(255,0,0);
   triangle(0 + position.x -10 ,10  + position.y - 10 ,5 + position.x -10 ,0+ position.y - 10 ,10 + position.x - 10 ,10 + position.y - 10);
   fill(0);
   ellipse(5 + position.x - 10 ,15 + position.y - 10 ,5,5);
   fill(0,255,0);
   triangle(10  + position.x - 10,10  + position.y - 10 ,10 + position.x - 10,20 + position.y - 10,20  + position.x - 10,20 + position.y - 10 );  
   triangle(-10  + position.x - 10 + 10 , 10  + position.y - 10 , -10 + position.x - 10 + 10 ,20 + position.y - 10, -20  + position.x - 10 + 10,20 + position.y - 10 );  
      
      
    }
    
    if(state == 5){
   fill(255, 255, 0);
   rect(0 + position.x - 10 ,10 + position.y - 10,10,10);
   fill(255,0,0);
   triangle(0 + position.x -10 ,20 + position.y - 10 ,5 + position.x -10 ,25 + position.y, 10 + position.x -10, 20 + position.y - 10);
   fill(0);
   ellipse(5 + position.x -10 ,15 + position.y - 10, 5, 5);

      
    }
 
    
    
    
  
   
   
 }
    
    
  
  
  
}
    
    
  
  
  

   
  

    
    
    
  
   
   
