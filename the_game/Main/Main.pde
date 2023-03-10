final static float MOVE_SPEED = 8;
final static float JUMP_SPEED = 19;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;
final static float GRAVITY = 1.5;

final static float MAGRINRIGHT = 800;
final static float MAGRINLEFT = 200;
final static float MAGRINVERTICAL = 60;

Character c;
PImage bg, float_brick, grass, mushroom, button1, button2, mario, sun;
ArrayList<Character> platforms;
int pageNum;
Page page;
float screenX = 0;
float screenY = 0;

void setup(){
  size(1500,800);
  page = new Page();
  pageNum = 1;
  bg = loadImage("../map.png");
  //bg = new Character("../map.png",1.0,0,0);
  
  imageMode(CENTER);
  //c = new Character("../maleAdventurer.png", 1.0, 100, 570);
  c = new Character("../maleAdventurer.png", 0.8, 900, 100);
  //c.characterX = 100;
  //c.characterY = 200;
  c.moveX = 0;
  c.moveY = 0;
  platforms = new ArrayList<Character>();
  
  
  float_brick = loadImage("../ground_grass_small.png");
  mushroom = loadImage("../mushroom_red.png");
  grass = loadImage("../grass_brown2.png");
  sun = loadImage("../sun1.png");
  createPlatforms("map.csv");
}

void draw(){
  background(255);
  if(pageNum == 1){
    page.gameStart();
  }
  if(pageNum == 2){
    page.gameOver();
  }
  if(pageNum == 3){
    //game.drawGame();
      scroll();//////////////
  c.display();
  solveCollisions(c,platforms);
  //c.update();
  
  for(Character a: platforms){
    a.display();
  }
  }

}

void scroll(){
  float right = screenX + width - MAGRINRIGHT;
  if(c.getRightBoundary() > right){
    screenX += c.getRightBoundary() - right;
  }
  float left = screenX + MAGRINLEFT;
  if(c.getLeftBoundary() < left){
    screenX -= left - c.getLeftBoundary();
  }
  float bottom = screenY + height - MAGRINVERTICAL;
  if(c.getBottomBoundary() > bottom){
    screenY += c.getBottomBoundary() - bottom;
  }
  float top = screenY + MAGRINVERTICAL;
  if(c.getTopBoundary() < top){
    screenY -= top - c.getTopBoundary();
  }
  translate(-screenX, -screenY);
}


public void solveCollisions(Character c, ArrayList<Character> walls){
  c.moveY += GRAVITY;
  c.characterY += c.moveY;
  ArrayList<Character> list = collisionListTest(c, walls);
  if(list.size() > 0){
    Character collided = list.get(0);
    if(c.moveY > 0){
      c.setBottomBoundary(collided.getTopBoundary());
    }
    else if(c.moveY < 0){
      c.setTopBoundary(collided.getBottomBoundary());
    }
    c.moveY = 0;
  }
  
  c.characterX += c.moveX;
  list = collisionListTest(c, walls);
  if(list.size() > 0){
    Character collided = list.get(0);
    if(c.moveX > 0){
      c.setRightBoundary(collided.getLeftBoundary());
    }
    else if(c.moveX < 0){
      c.setLeftBoundary(collided.getRightBoundary());
    }
  }
}

boolean collisionTest(Character c1, Character c2){
  boolean checkX1 = c1.getLeftBoundary() >= c2.getRightBoundary();
  boolean checkX2 = c1.getRightBoundary() <= c2.getLeftBoundary();
  boolean checkY1 = c1.getBottomBoundary() <= c2.getTopBoundary();
  boolean checkY2 = c1.getTopBoundary() >= c2.getBottomBoundary();
  if(checkX1 || checkX2 || checkY1 || checkY2){
    return false;
  }else{
    return true;
  }
  //return checkX1 || checkX2 || checkY1 || checkY2;
}

public ArrayList<Character> collisionListTest(Character c, ArrayList<Character> list){
  ArrayList<Character> listCollision = new ArrayList<Character>();
  for(Character element: list){
    if(collisionTest(c,element)){
      listCollision.add(element);
    }
  }
  return listCollision;
}

public boolean isOnGround(Character c, ArrayList<Character> walls){
  c.characterY += 5;
  ArrayList<Character> list = collisionListTest(c, walls);
  c.characterY -= 5;
  if(list.size()>0){
    return true;
  }else {
    return false;
  }
}

void createPlatforms(String filename){
  String[] lines = loadStrings(filename);
  for(int row = 0; row <lines.length; row++){
    String[] values = split(lines[row], ",");
    for(int col = 0; col < values.length; col++){
      if(values[col].equals("1")){
        Character s = new Character(float_brick, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("2")){
        Character s = new Character(grass, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("3")){
        Character s = new Character(mushroom, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("4")){
        Character s = new Character(sun, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
    }
  }
}

void keyPressed(){
  if(keyCode == RIGHT){
    c.moveX = MOVE_SPEED;
  }
  else if(keyCode == LEFT){
    c.moveX = -MOVE_SPEED;
  }
  else if(keyCode == UP && isOnGround(c,platforms)){
    c.moveY = -JUMP_SPEED;
  }
  else if(keyCode == DOWN){
    c.moveY = MOVE_SPEED;
  }
}

void keyReleased(){
  if(keyCode == RIGHT){
    c.moveX = 0;
  }
  else if(keyCode == LEFT){
    c.moveX = 0;
  }
  else if(keyCode == UP && isOnGround(c,platforms)){
    c.moveY = 0;
  }
  else if(keyCode == DOWN){
    c.moveY = 0;
  }
}
