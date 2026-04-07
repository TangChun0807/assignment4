class Bird{
  int state;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Bird( ){
    state = 1;
    position = new PVector(random(0, 400), 220);
    velocity = new PVector(random(-5, 5), random(10, -5));
    acceleration = new PVector(0, 0);
    
  }
  
  void update(){
     if(state == 1){
      if(velocity.x < 0){
        state = 2; 
      }else{
      if(velocity.x < 0){
        state = 3;
      }
      }
    }
    
  }
  
  
  void display() {
    fill(0);
    text(state, position.x , position.y);
    
  }
  
  
  
  
}
