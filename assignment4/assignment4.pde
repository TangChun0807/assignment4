
//hello world
GameScene scene;
Bird bird;

void setup(){
  size(400,400);
  background(135,206,250);
  scene = new GameScene();
  bird = new Bird();
  
  
  
}

void draw(){
  scene.display();
  bird.update();
  bird.display();
}
