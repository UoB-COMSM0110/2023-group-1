final static float MOVE_SPEED = 8;
final static float JUMP_SPEED = 19;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;
final static float GRAVITY = 1.5;

final static float MAGRINRIGHT = 800;
final static float MAGRINLEFT = 200;
final static float MAGRINVERTICAL = 60;

final static int MIDDLE_FACING = 0;
final static int RIGHT_FACING = 1;
final static int LEFT_FACING = 2;

final static float WIDTH = CHARACTER_SIZE * 30;
final static float HEIGHT = CHARACTER_SIZE * 16;
final static float GROUND_LEVEL = HEIGHT - CHARACTER_SIZE;

// Character c;
// CharacterAnimate player;
CharacterAnimate c;
PImage bg, float_brick, grass, mushroom, button1, button2, mario, sun, gold, zombie, p, flag;
ArrayList<Character> platforms;
ArrayList<Character> coins;
Enemy enemy;

int scoreNum = 0;
boolean isGameOver;
int pageNum;
Page page;
float screenX;
float screenY;

void setup(){
  size(1500,800);
  page = new Page();
  pageNum = 1;
  //bg = loadImage("../map.png");
  //bg = new Character("../map.png",1.0,0,0);
  
  imageMode(CENTER);
  //c = new Character("../maleAdventurer.png", 1.0, 100, 570);
  // c = new Character("../Character/maleAdventurer_standright.png", 0.8, 900, 100);
  // //c.characterX = 100;
  // //c.characterY = 200;
  // c.moveX = 0;
  // c.moveY = 0;
  p = loadImage("../Character/maleAdventurer_standright.png");
  c = new CharacterAnimate(p, 0.8);
  c.characterX = 100;
  c.moveY = GROUND_LEVEL;
  // c.setBottomBoundary(GROUND_LEVEL - 5);
  // c.characterX = 300;
  // c.characterY = 200;
  // player = new CharacterAnimate(p, 0.8);
  // player.setBottomBoundary(GROUND_LEVEL);
  // player.characterX = 100;
  platforms = new ArrayList<Character>();
  coins = new ArrayList<Character>();
  scoreNum = 0;
  isGameOver = false;
  
  float_brick = loadImage("../ground_grass_small.png");
  mushroom = loadImage("../mushroom_red.png");
  grass = loadImage("../grass_brown2.png");
  sun = loadImage("../sun1.png");
  bg = loadImage("../download1.jpg");
  flag = loadImage("../flag.png");
  gold = loadImage("../bronze_1.png");
  zombie = loadImage("../Zombie/zombie_walkl0.png");
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
    background(98, 150, 255, 255);

    displayAll();
    if(!isGameOver){
      updateAll();
      collectCoins();
      checkDeath();
    }
    // // c.updateAnimation();
    // solveCollisions(c,platforms);
    // enemy.update();
    // enemy.updateAnimation();
    
    // //TODO
    // // collectCoins();
    // // checkDeath();
  


    // player.display();
    // solveCollisions(c,platforms);
    //c.update();
    // player.updateAnimation();
    // solveCollisions(player,platforms);

  }

}

void displayAll(){
  for(Character a: platforms){
    a.display();
  }
  for(Character c: coins){
    c.display();
    // ((Animate)c).updateAnimation();
  }
  c.display();
  enemy.display();
  fill(255,0,0);
  textSize(32);
  text("Score:" + scoreNum, screenX + 50, screenY + 50);
  text("Lives:" + c.lives, screenX + 50, screenY + 100);

  if(isGameOver){
    fill(0,0,255);
    text("game over!", screenX + width/2 - 100, screenY + height/2);
  }
}

void updateAll(){
  // c.updateAnimation();
    solveCollisions(c,platforms);
    enemy.update();
    enemy.updateAnimation();
    
  for(Character c: coins){
    // c.display();
    ((Animate)c).updateAnimation();
  }

    //TODO
    // collectCoins();
    // checkDeath();
}

void collectCoins(){
  ArrayList<Character> coinList = collisionListTest(c, coins);
  if(coinList.size() > 0){
    for(Character coin: coinList){
      scoreNum++;
      coins.remove(coin);
    }
  }

  //win,get all the coins
  if(coins.size() == 0){
    isGameOver = true;
  }
}

void checkDeath(){
  boolean collideEnemy = collisionTest(c, enemy);
  boolean fallOffCliff = c.getBottomBoundary() > GROUND_LEVEL;
  if(collideEnemy || fallOffCliff){
    c.lives--;
    if(c.lives == 0){
      isGameOver = true;
    }else{
      c.characterX = 100;
      c.setBottomBoundary(GROUND_LEVEL);
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
  // float right = screenX + width - MAGRINRIGHT;
  // if(player.getRightBoundary() > right){
  //   screenX += player.getRightBoundary() - right;
  // }
  // float left = screenX + MAGRINLEFT;
  // if(player.getLeftBoundary() < left){
  //   screenX -= left - player.getLeftBoundary();
  // }
  // float bottom = screenY + height - MAGRINVERTICAL;
  // if(player.getBottomBoundary() > bottom){
  //   screenY += player.getBottomBoundary() - bottom;
  // }
  // float top = screenY + MAGRINVERTICAL;
  // if(player.getTopBoundary() < top){
  //   screenY -= top - player.getTopBoundary();
  // }
  // translate(-screenX, -screenY);
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

//test whether on the ground to jump
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
        Character s = new Character(flag, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("5")){
        Gold s = new Gold(gold, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        coins.add(s);
      }
      else if(values[col].equals("6")){
        float bLeft = col * CHARACTER_SIZE;
        float bRight = bLeft + 7 * CHARACTER_SIZE;
        enemy = new Enemy(zombie, 0.25, bLeft, bRight);
        enemy.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        enemy.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
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
  else if (isGameOver && key == ' ') {
    setup();
  }
  // if(keyCode == RIGHT){
  //   player.moveX = MOVE_SPEED;
  // }
  // else if(keyCode == LEFT){
  //   player.moveX = -MOVE_SPEED;
  // }
  // else if(keyCode == UP && isOnGround(player,platforms)){
  //   player.moveY = -JUMP_SPEED;
  // }
  // else if(keyCode == DOWN){
  //   player.moveY = MOVE_SPEED;
  // }
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
  // if(keyCode == RIGHT){
  //   player.moveX = 0;
  // }
  // else if(keyCode == LEFT){
  //   player.moveX = 0;
  // }
  // else if(keyCode == UP && isOnGround(player,platforms)){
  //   player.moveY = 0;
  // }
  // else if(keyCode == DOWN){
  //   player.moveY = 0;
  // }
}

void score() {
  textAlign(LEFT,TOP);
  textSize(32);
  fill(255, 0, 0);
  text("Score: " + scoreNum, width-20, 40);
}
