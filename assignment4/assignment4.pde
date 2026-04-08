GameScene scene;
Bird bird;

void setup(){
  size(400,400);
  scene = new GameScene();
  bird = new Bird();
  
  
  
}

void draw(){
  
  scene.display();
  bird.update();
  bird.display();
}
