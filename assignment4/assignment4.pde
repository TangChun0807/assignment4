//Create the game scene for the game 
GameScene scene;
//Set up the array list to stroe the bird
ArrayList<Bird> birds;
//to set up the bullet box
ScoreBox bulletBox;
//set up the bird killed box 
ScoreBox birdKillBox;
//set up the bird flay away box
ScoreBox birdFlyAwayBox;
//Prevents holding the mouse from counting as many clicks like the penguins killer
boolean clickLock = false;
//Set the bird count varaible to keep track of which bird in the list is currently flying on the screen
int birdCount = 0;
//The bird current flying on the screen
Bird currentBird;
//Checks the game is that over 
boolean gameIsOver = false;




void setup(){
  //set the canvas size to 400 x 400 
  size(400,400);
  //Create the game scene
  scene = new GameScene();
  //set up the bullet box starte from 10 bullets and set to type 1 
   bulletBox = new ScoreBox(10,1);
  //set up the bird kill start from 0 kills and set to type 2 
  birdKillBox = new ScoreBox(0,2);
  //set yp the bird fly away box start from 0 fly away and set to type 3 
  birdFlyAwayBox = new ScoreBox(0,3);
  //Creadte the bird list 
  birds = new ArrayList<Bird>();
  //Hide the mouse cursor from the game screen 
  noCursor();
  
  //Create 10 birds 
  Bird a = new Bird();
  Bird b = new Bird();
  Bird c = new Bird();
  Bird d = new Bird();
  Bird e = new Bird();
  Bird f = new Bird();
  Bird g = new Bird();
  Bird h = new Bird();
  Bird i = new Bird();
  Bird j = new Bird();
  
  //add the 10 birds to the array list 
  birds.add(a);
  birds.add(b);
  birds.add(c);
  birds.add(d);
  birds.add(e);
  birds.add(f);
  birds.add(g);
  birds.add(h);
  birds.add(i);
  birds.add(j);
  
  //set the currentbird starts with the first bird in the list 
  currentBird = birds.get(birdCount);
  
  
}


void draw(){

// if the game is over, shows the game over screen below 
if(gameIsOver == true){
  //set the background to the sky blue color for gameover screen 
  background(135,206,250);
//draw the happy face on center of the gameover screen 
  drawHappyFace(width/2, height/2 - 20, 60);

  //draw the restart test on the center of the gameover screen 
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Click to Restart", width/2, height/2 + 40);

  //Stop the rest of draw function from running 
  return;
}
  
  
  //if the game is not nover will run the below
  else{
  

 
  // draw the game UI screen
  //draw the scene
  scene.display();
  //draw the bullet box
  bulletBox.display();
  //draw the bird killed box
  birdKillBox.display();
  //draw the bird fly away box
  birdFlyAwayBox.display();
  

 
 
   
   //if the current bird finished the animation and the state is zero 
   if(currentBird.state == 0){
     //if player kill six bird, the game will over 
     if(birdKillBox.count >= 6){
         gameIsOver = true;
       
     }
     
      
     // If there still more birds in the list 
     if(birdCount < birds.size()-1){
     //Move to the next bird, then bird count + 1 
     birdCount++;
     //Set the next bird as the cureent bird
     currentBird = birds.get(birdCount);
     //Reset the spawn time 
     currentBird.spawnTime = millis();
     
   //if there has no birds left game over 
   }else{
     gameIsOver = true;
   }
   }
   
   //if bullets ran out gamer over 
   if(bulletBox.count <= 0){
       gameIsOver = true;
     }
  
   
   
   //update the current bird movement 
   currentBird.update();
   //update the bird display animation 
   currentBird.display();
 

 

 
 
  //if the mouse is pressed and clicklock is false
  if(mousePressed && clickLock == false){
    //use one bullet
    bulletBox.update();
    //lock the bullet only -1 each time 
    clickLock = true;
}


 // When mouse is released, unlock clicking
 if(!mousePressed){
  
  clickLock = false;
}

// Draw crosshair based on the mouseX and mouseY
 drawCrosshair(mouseX, mouseY);
 
 
 
}
 


} //else


//draw the corsshair 
void drawCrosshair(float x, float y) {
  stroke(255,0,0);
  strokeWeight(2);
  noFill();

  // draw circle
  ellipse(x, y, 30, 30);

  // draw horizontal line for the corsshair
  line(x - 15, y, x + 15, y);

  // draw the vertical line for the corsshair 
  line(x, y - 15, x, y + 15);
}

//Reset everything for a new game 
void restartGame(){
  //reset the bird count to zero
  birdCount = 0;
  //Make the game is over off
  gameIsOver = false;
  // reset the clicklock 
  clickLock = false;
  
  //reset all the score box 
  bulletBox = new ScoreBox(10,1);
  birdKillBox = new ScoreBox(0,2);
  birdFlyAwayBox = new ScoreBox(0,3);

  //clear all the old birds from the array list 
  birds.clear();

  
  //create new 10 birds and add them to the list 
  for(int i = 0; i < 10; i++){
    birds.add(new Bird());
  }
  
  //set first bird as the current bird
  currentBird = birds.get(0);
}


//when mousePressed will restart the game
void mousePressed(){
  if(gameIsOver){
    restartGame();
    return;
  }
}


//draw the happy face for game over screen
void drawHappyFace(float x, float y, float s){
  fill(255, 220, 0);
  ellipse(x, y, s, s); // face

  fill(0);
  ellipse(x - 10, y - 10, 8, 8); // left eye
  ellipse(x + 10, y - 10, 8, 8); // right eye

  noFill();
  arc(x, y + 5, 20, 15, 0, PI); // smile
}
