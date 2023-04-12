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

CharacterAnimate playerA, playerB;
PImage bg, float_brick, grass, mushroom, button1, button2, mario, sun, gold, zombie, p1, p2, flag;
ArrayList<Character> platforms;
ArrayList<Character> coins;
Enemy enemy;

int scoreNum = 0;
boolean twoPlayers;
int pageNum;
Page page;
float screenX;
float screenY;

void setup(){
  size(1500,800);
  page = new Page();
  pageNum = 1;
  
  imageMode(CENTER);
  p1 = loadImage("../Character/maleAdventurer_standright.png");
  p2 = loadImage("../CharacterTwo/femaleAdventurer_idle.png");
  playerA = new CharacterAnimate(p1, 0.8);
  playerA.characterX = 100;
  playerA.moveY = GROUND_LEVEL;
  playerB = new CharacterAnimate(p2, 0.8);
  playerB.characterX = 150;
  playerB.moveY = GROUND_LEVEL;
  twoPlayers = false;
  platforms = new ArrayList<Character>();
  coins = new ArrayList<Character>();
  scoreNum = 0;
  
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
  if (pageNum == 1) { // Welcome screen
    page.gameStart();
  } else if (pageNum == 2) { // game over screen
    page.gameOver();
  } else if (pageNum == 3) { // game screen
    scroll();
    background(98, 150, 255, 255);

    displayAll();
    if (pageNum == 3) {
      updateAll();
      collectCoins();
      checkDeath();
    }
  } else if (pageNum == 4) { // game won screen
    page.gameWon();
  }

}

void displayAll(){
  for (Character a: platforms) {
    a.display();
  }
  for (Character c: coins) {
    c.display();
  }
  playerA.display();
  if (twoPlayers) {
    playerB.display();
  }
  enemy.display();
  fill(255,0,0);
  textSize(32);
  text("Score:" + scoreNum, screenX + 50, screenY + 50);
  text("Lives:" + playerA.lives, screenX + 50, screenY + 100);

  if (pageNum == 2) {
    fill(0,0,255);
    text("game over!", screenX + width/2 - 100, screenY + height/2);
  }
}

void updateAll(){
    solveCollisions(playerA, platforms);
    if (twoPlayers) {
      solveCollisions(playerB, platforms);
    }
    enemy.update();
    enemy.updateAnimation();
    
  for(Character c: coins){
    ((Animate)c).updateAnimation();
  }
}

void collectCoins() {
  ArrayList<Character> coinListA = collisionListTest(playerA, coins);
  if (coinListA.size() > 0) {
    for (Character coin: coinListA) {
      scoreNum++;
      coins.remove(coin);
    }
  }

  if (twoPlayers) {
    ArrayList<Character> coinListB = collisionListTest(playerB, coins);

    if (coinListB.size() > 0) {
      for (Character coin: coinListB) {
        scoreNum++;
        coins.remove(coin);
      }
    }  
  }

  // win, got all the coins
  if (coins.size() == 0) {
    pageNum = 4;
  }
}

void checkDeath(){
  // If there are two players, then need to check for both collisions.
  // Otherwise, just check for player 1 colliding
  boolean collideEnemy = (twoPlayers) ? (collisionTest(playerA, enemy) || collisionTest(playerB, enemy)) : collisionTest(playerA, enemy);
  boolean fallOffCliff = (twoPlayers) ? (playerA.getBottomBoundary() > GROUND_LEVEL && playerB.getBottomBoundary() > GROUND_LEVEL) : (playerA.getBottomBoundary() > GROUND_LEVEL);
  if (collideEnemy || fallOffCliff) {
    // We are storing all of the lives data in the player 1 object.  this means that if player 2 dies, then it also kills player 1.  #teamwork
    playerA.lives--;
    if (playerA.lives == 0) {
      pageNum = 2;
    } else {
      playerA.characterX = 100;
      playerA.setBottomBoundary(GROUND_LEVEL);
      if (twoPlayers) {
        playerB.characterX = 110;
        playerB.setBottomBoundary(GROUND_LEVEL);
      }
    }
  }

}

void scroll(){
  float right = screenX + width - MAGRINRIGHT;
  if (playerA.getRightBoundary() > right) {
    screenX += playerA.getRightBoundary() - right;
  }
  float left = screenX + MAGRINLEFT;
  if (playerA.getLeftBoundary() < left) {
    screenX -= left - playerA.getLeftBoundary();
  }
  float bottom = screenY + height - MAGRINVERTICAL;
  if (playerA.getBottomBoundary() > bottom) {
    screenY += playerA.getBottomBoundary() - bottom;
  }
  float top = screenY + MAGRINVERTICAL;
  if (playerA.getTopBoundary() < top) {
    screenY -= top - playerA.getTopBoundary();
  }
  translate(-screenX, -screenY);
}


public void solveCollisions(Character c, ArrayList<Character> walls){
  c.moveY += GRAVITY;
  c.characterY += c.moveY;
  ArrayList<Character> list = collisionListTest(c, walls);
  if (list.size() > 0) {
    Character collided = list.get(0);
    if (c.moveY > 0) {
      c.setBottomBoundary(collided.getTopBoundary());
    }
    else if (c.moveY < 0) {
      c.setTopBoundary(collided.getBottomBoundary());
    }
    c.moveY = 0;
  }
  
  c.characterX += c.moveX;
  list = collisionListTest(c, walls);
  if (list.size() > 0) {
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
  if (checkX1 || checkX2 || checkY1 || checkY2) {
    return false;
  }else{
    return true;
  }
}

public ArrayList<Character> collisionListTest(Character c, ArrayList<Character> list){
  ArrayList<Character> listCollision = new ArrayList<Character>();
  for (Character element: list){
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
  // Player 1 controls
  if (keyCode == RIGHT){
    playerA.moveX = MOVE_SPEED;
  } else if (keyCode == LEFT){
    playerA.moveX = -MOVE_SPEED;
  } else if (keyCode == UP && isOnGround(playerA, platforms)){
    playerA.moveY = -JUMP_SPEED;
  } else if (keyCode == DOWN){
    playerA.moveY = MOVE_SPEED;
  } 
  
  // Player 2 controls -- not mutually exclusive, so need to do seperate it statements
  if (twoPlayers) {
    if (key == 'd') {
      playerB.moveX = MOVE_SPEED;
    } else if (key == 'a') {
      playerB.moveX = -MOVE_SPEED;
    } else if (key == 'w' && isOnGround(playerB, platforms)) {
      playerB.moveY = -JUMP_SPEED;
    } else if (key == 's') {
      playerB.moveY = JUMP_SPEED;
    }
  }
}

void keyReleased() {
  // Player 1 controls
  if (keyCode == RIGHT || keyCode == LEFT) {
    playerA.moveX = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    playerA.moveY = 0;
  }

  // Player 2 controls
  if (twoPlayers) {
    if (key == 'w' || key == 's') {
      playerB.moveY = 0;
    } else if (key == 'd' || key == 'a') {
      playerB.moveX = 0;
    }
  }
}

void score() {
  textAlign(LEFT,TOP);
  textSize(32);
  fill(255, 0, 0);
  text("Score: " + scoreNum, width-20, 40);
}
