
Game game;

void setup(){
  size(1500,750);
  game = new Game();
  
}

void draw(){
  background(255);
  game.drawGame();
}


void keyPressed(){
  game.moveGame();
}

