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
  
  currentBird = birds.get(birdCount);
  
  
}

void draw(){
   
if(gameIsOver == true){
  background(135,206,250);

  drawHappyFace(width/2, height/2 - 20, 60);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Click to Restart", width/2, height/2 + 40);

  return;
}
  
  
  else{
  

 
    
  scene.display();
 
  bulletBox.display();
  birdKillBox.display();
  birdFlyAwayBox.display();
  

 
 
   
   
   if(currentBird.state == 0){
     if(birdKillBox.count >= 6){
         gameIsOver = true;
       
     }
     
      
     
     if(birdCount < birds.size()-1){
     birdCount++;
     currentBird = birds.get(birdCount);
     currentBird.spawnTime = millis();
     
     
   }else{
     gameIsOver = true;
   }
   }
   
   
   if(bulletBox.count <= 0){
       gameIsOver = true;
     }
  
   
   
   
   currentBird.update();
   currentBird.display();
 

 

 
 
  
  if(mousePressed && clickLock == false){
    bulletBox.update();
    clickLock = true;
}



 if(!mousePressed){
  
  clickLock = false;
}


 drawCrosshair(mouseX, mouseY);
 
 
 
}
 
drawCrosshair(mouseX, mouseY);

} //else



void drawCrosshair(float x, float y) {
  stroke(255,0,0);
  strokeWeight(2);
  noFill();

  // circle
  ellipse(x, y, 30, 30);

  // vertical line 
  line(x - 15, y, x + 15, y);

  // vertical line
  line(x, y - 15, x, y + 15);
}


void restartGame(){
  birdCount = 0;
  gameIsOver = false;
  clickLock = false;

  bulletBox = new ScoreBox(10,1);
  birdKillBox = new ScoreBox(0,2);
  birdFlyAwayBox = new ScoreBox(0,3);

  birds.clear();

  
  for(int i = 0; i < 10; i++){
    birds.add(new Bird());
  }

  currentBird = birds.get(0);
}


void mousePressed(){
  if(gameIsOver){
    restartGame();
    return;
  }
}


void drawHappyFace(float x, float y, float s){
  fill(255, 220, 0);
  ellipse(x, y, s, s); // face

  fill(0);
  ellipse(x - 10, y - 10, 8, 8); // left eye
  ellipse(x + 10, y - 10, 8, 8); // right eye

  noFill();
  arc(x, y + 5, 20, 15, 0, PI); // smile
}
