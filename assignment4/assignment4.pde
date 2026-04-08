GameScene scene;
ArrayList<Bird> birds;
ScoreBox bulletBox;
ScoreBox birdKillBox;
ScoreBox birdFlyAwayBox;
boolean clickLock = false;
int birdCount = 0;
Bird currentBird;
boolean gameIsOver = false;




void setup(){
  size(400,400);
  scene = new GameScene();
   bulletBox = new ScoreBox(10,1);
  birdKillBox = new ScoreBox(0,2);
  birdFlyAwayBox = new ScoreBox(0,3);
  birds = new ArrayList<Bird>();
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
