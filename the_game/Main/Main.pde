import java.util.Collections;
import java.lang.Math;

final static float MOVE_SPEED = 8;
final static float JUMP_SPEED = 19;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;
final static float GRAVITY = 1.5;

final static float MAGRINRIGHT = 800;
final static float MAGRINLEFT = 200;
final static float MAGRINVERTICAL = 160;

final static int MIDDLE_FACING = 0;
final static int RIGHT_FACING = 1;
final static int LEFT_FACING = 2;

final static float WIDTH = CHARACTER_SIZE * 30;
final static float HEIGHT = CHARACTER_SIZE * 16;
final static float GROUND_LEVEL = HEIGHT - CHARACTER_SIZE;

CharacterAnimate playerA, playerB;

Thing flagCharacter;

PImage bg, float_brick, grass, mushroom, button1, button2, mario, sun, gold, zombie, p1, p2, flag, wKey, aKey, sKey, dKey, emptyKey, arrow;

ArrayList<Thing> platforms;
ArrayList<Thing> coins;
ArrayList<ScoreTuple> highScores;
ArrayList<Character> name;

Page page;

ScoreTuple currentScore;

Enemy enemy;

float currentGravity;
float screenX;
float screenY;
float bottomPlatform = 0;
float gravityHandPosition;

int timeTillGravityChanges;
int scoreNum;
int pageNum;
int loreNum;

boolean twoPlayers;
boolean hardMode;
boolean isWon;

void setup() {
  size(1500,800);
  page = new Page();
  pageNum = 1;
  
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  bg = loadImage("../map.png");
  p1 = loadImage("../CharacterTwo/femaleAdventurer_idle.png");
  p2 = loadImage("../Character/maleAdventurer_standright.png");
  float_brick = loadImage("../ground_grass_small.png");
  mushroom = loadImage("../mushroom_red.png");
  grass = loadImage("../grass_brown2.png");
  sun = loadImage("../sun1.png");
  flag = loadImage("../flag.png");
  gold = loadImage("../bronze_1.png");
  zombie = loadImage("../Zombie/zombie_walkl0.png");
  button1 = loadImage("../pic/platformPack_tile001.png");
  button2 = loadImage("../pic/platformPack_tile004.png");
  wKey = loadImage("../assets/w-key.png");
  aKey = loadImage("../assets/a-key.png");
  sKey = loadImage("../assets/s-key.png");
  dKey = loadImage("../assets/d-key.png");
  emptyKey = loadImage("../assets/empty-key.png");
  arrow = loadImage("../assets/arrow.png");

  platforms = new ArrayList<Thing>();
  coins = new ArrayList<Thing>();
  highScores = new ArrayList<ScoreTuple>();
  name = new ArrayList<Character>();

  twoPlayers = false;
  hardMode = true;
}

void draw() {
  background(255);
  if (pageNum == 1) { // Welcome screen
    page.gameStart();
  } else if (pageNum == 2) { // game over screen
    page.gameOver();
  } else if (pageNum == 3) { // game screen
    scroll();
    background(98, 150, 255, 255);

    displayAll();
    if (hardMode) {
      handleGravity();
    }
    updateAll();
    collectCoins();
    checkDeath();
    if (!(loreNum == 4)) {
      page.lore();
    }
  } else if (pageNum == 4) { // game won screen
    page.gameWon();
  } else if (pageNum == 5) { // enter name for high score
    page.enterName();
  } else if (pageNum == 6) { // show leaderboard
    page.leaderboard();
  }
}

void displayAll() {
  // Display the map
  for (Thing a: platforms) {
    a.display();
  }

  // Display the remaining coins
  for (Thing c: coins) {
    c.display();
  }

  // Display the player sprites
  playerA.display();
  if (twoPlayers) {
    playerB.display();
  }

  flagCharacter.display();
  
  // Display the enemy
  enemy.display();

  // Display the score and remaining lives
  fill(255,0,0);
  textSize(32);
  text("Score: " + scoreNum, 50 - screenX, 50 - screenY);
  text("Lives: " + playerA.lives, 50 - screenX, 100 - screenY);
}

void updateAll() {
  solveCollisions(playerA, platforms);
  if (twoPlayers) {
    solveCollisions(playerB, platforms);
  }
  enemy.update();
  enemy.updateAnimation();
      
  for(Thing c: coins){
    ((Animate)c).updateAnimation();
  }
}

void collectCoins() {
  ArrayList<Thing> coinListA = collisionListTest(playerA, coins);
  if (coinListA.size() > 0) {
    for (Thing coin: coinListA) {
      scoreNum++;
      coins.remove(coin);
    }
  }

  if (twoPlayers) {
    ArrayList<Thing> coinListB = collisionListTest(playerB, coins);

    if (coinListB.size() > 0) {
      for (Thing coin: coinListB) {
        scoreNum++;
        coins.remove(coin);
      }
    }  
  }

  // win, got all the coins
  if (collisionTest(playerA, flagCharacter) || 
      twoPlayers && collisionTest(playerB, flagCharacter)) {
    isWon = true;
    pageNum = 4;
  }
}

void checkDeath() {
  // If there are two players, then need to check for both collisions.
  // Otherwise, just check for player 1 colliding
  boolean collideEnemy = (twoPlayers) ? (collisionTest(playerA, enemy) || collisionTest(playerB, enemy)) : collisionTest(playerA, enemy);
  boolean fallOffCliff = (twoPlayers) ? (playerA.getBottomBoundary() > GROUND_LEVEL || playerB.getBottomBoundary() > GROUND_LEVEL) : (playerA.getBottomBoundary() > GROUND_LEVEL);
  if (collideEnemy || fallOffCliff) {
    // We are storing all of the lives data in the player 1 object.  this means that if player 2 dies, then it also kills player 1.  #teamwork
    playerA.lives--;
    if (playerA.lives == 0) {
      pageNum = 2;
    } else {
      playerA.characterX = 100;
      playerA.setBottomBoundary(GROUND_LEVEL);
      if (twoPlayers) {
        playerB.characterX = 150;
        playerB.setBottomBoundary(GROUND_LEVEL);
      }
    }
  }

}

void scroll() {
  float right = width - (MAGRINRIGHT + screenX);
  if (playerA.getRightBoundary() > right) {
    screenX -= playerA.getRightBoundary() - right;
  }
  float left = MAGRINLEFT - screenX;
  if (playerA.getLeftBoundary() < left) {
    screenX = min(screenY + (left - playerA.getLeftBoundary()), 0);
  }
  float bottom = height - (MAGRINVERTICAL + screenY);
  if (playerA.getBottomBoundary() > bottom) {
    screenY = max(screenY - (playerA.getBottomBoundary() - bottom), bottomPlatform);
  }
  float top = MAGRINVERTICAL - screenY;
  if (playerA.getTopBoundary() < top) {
    screenY = min(screenY + (top - playerA.getTopBoundary()), 250);
  }
  translate(screenX, screenY);
}


public void solveCollisions(Thing c, ArrayList<Thing> walls) {
  c.moveY += currentGravity;
  c.characterY += c.moveY;
  ArrayList<Thing> list = collisionListTest(c, walls);
  if (list.size() > 0) {
    Thing collided = list.get(0);
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
    Thing collided = list.get(0);
    if (c.moveX > 0) {
      c.setRightBoundary(collided.getLeftBoundary());
    }
    else if (c.moveX < 0) {
      c.setLeftBoundary(collided.getRightBoundary());
    }
  }
}

boolean collisionTest(Thing c1, Thing c2) {
  boolean checkX1 = c1.getLeftBoundary() >= c2.getRightBoundary();
  boolean checkX2 = c1.getRightBoundary() <= c2.getLeftBoundary();
  boolean checkY1 = c1.getBottomBoundary() <= c2.getTopBoundary();
  boolean checkY2 = c1.getTopBoundary() >= c2.getBottomBoundary();
  if (checkX1 || checkX2 || checkY1 || checkY2) {
    return false;
  } else {
    return true;
  }
}

public ArrayList<Thing> collisionListTest(Thing c, ArrayList<Thing> list) {
  ArrayList<Thing> listCollision = new ArrayList<Thing>();
  for (Thing element: list) {
    if (collisionTest(c, element)) {
      listCollision.add(element);
    }
  }
  return listCollision;
}

//test whether on the ground to jump
public boolean isOnGround(Thing c, ArrayList<Thing> walls) {
  c.characterY += 5;
  ArrayList<Thing> list = collisionListTest(c, walls);
  c.characterY -= 5;
  if (list.size() > 0) {
    return true;
  } else {
    return false;
  }
}

void createPlatforms(String filename) {
  String[] lines = loadStrings(filename);
  for (int row = 0; row <lines.length; row++) {
    String[] values = split(lines[row], ",");
    for (int col = 0; col < values.length; col++) {
      if (values[col].equals("1")) {
        Thing s = new Thing(float_brick, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
        bottomPlatform = min(s.characterX - CHARACTER_SIZE/2, bottomPlatform); // This is needed to ensure that we know where to stop the vertical camera scrolling
      } else if (values[col].equals("2")) {
        Thing s = new Thing(grass, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      } else if(values[col].equals("3")) {
        Thing s = new Thing(mushroom, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      } else if(values[col].equals("4")) {
        flagCharacter = new Thing(flag, CHARACTER_SCALE);
        flagCharacter.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        flagCharacter.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
      } else if(values[col].equals("5")) {
        Gold s = new Gold(gold, CHARACTER_SCALE);
        s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        coins.add(s);
      } else if(values[col].equals("6")) {
        float bLeft = col * CHARACTER_SIZE;
        float bRight = bLeft + (7 * CHARACTER_SIZE);
        enemy = new Enemy(zombie, 0.25, bLeft, bRight);
        enemy.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        enemy.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
      }
    }
  }
}

void keyPressed() {
  if (pageNum == 3 && loreNum == 4) { // In game
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
    
    // Player 2 controls -- not mutually exclusive, so need to do seperate if statements
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

  if (pageNum == 5) {
    if ((name.size() < 3) && Character.isLetter(key)) { 
      // Allow addition of letters to name
      name.add(Character.toUpperCase(key));
    } else if (name.size() == 3 && keyCode == ENTER) {
      saveScore();
    }

    if ((name.size() > 0) && keyCode == BACKSPACE) {
      name.remove(name.size() - 1);
    }
  }

}

void keyReleased() {
  if (pageNum == 3) {
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

  if (pageNum == 3 && loreNum < 4) {
    if (keyCode == ENTER) {
      loreNum++;
    }
  }

  if (pageNum == 1 || pageNum == 2 || pageNum == 4) {
    // Start the game on pressing enter
    if (keyCode == ENTER) {
      startGame();
      
    }
  }

}

void mousePressed() {
  if (pageNum == 1 || pageNum == 2 || pageNum == 4) {
    //1 player
    if (mouseX > 590 && mouseX < 720 && mouseY > 600 && mouseY < 650) {
      if (mouseButton == LEFT) {
        twoPlayers = false;
      }
    }
    //2 player
    if (mouseX > 760 && mouseX < 890 && mouseY > 600 && mouseY < 650) {
      if (mouseButton == LEFT) {
        twoPlayers = true;
      }
    } 
    // Hard mode
    if (mouseX > ((WIDTH / 2) + 265) && mouseX < ((WIDTH / 2) + 385) && mouseY > 475 && mouseY < 525) {
      if (mouseButton == LEFT) {
        hardMode = !hardMode;
      }
    } 
    //game start
    if (mouseX > 550 && mouseX < 950 && mouseY > 450 && mouseY < 560) {
      if (mouseButton == LEFT) {
        startGame(); 
      }
    }
  }

  if (pageNum == 2 || pageNum == 4) {
    if (mouseX > (WIDTH / 2) - 125 && mouseX < (WIDTH / 2) + 125 && mouseY > 280 && mouseY < 400) {
      if (mouseButton == LEFT) {
          pageNum = 5;
       }
    }
  }

  if (pageNum == 6) {
    if ((mouseX > 50 && mouseX < 150) && (mouseY > 25 && mouseY < 755)) {
      if (mouseButton == LEFT) {
        pageNum = 1;
      }
    }
  }

  if (pageNum == 3 && loreNum < 4) {
    if ((mouseX > WIDTH - 340 && mouseX < WIDTH - 120) && (mouseY > HEIGHT - 200 && mouseY < HEIGHT - 120)) {
      if (mouseButton == LEFT) {
        loreNum++;
      }
    }
  }
}

void score() {
  textAlign(LEFT, TOP);
  textSize(32);
  fill(255, 0, 0);
  text("Score: " + scoreNum, width-20, 40);
}


void saveScore() {
  if (name.size() != 3) {
    println("ERROR - tried to submit name of length other than 3");
  } else {
    String nameString = "".concat(String.valueOf(name.get(0))).concat(String.valueOf(name.get(1))).concat(String.valueOf(name.get(2)));
    currentScore = new ScoreTuple(nameString, scoreNum, isWon);
    highScores.add(currentScore);
    Collections.sort(highScores, (a, b) -> {
      if (a.isWon() == b.isWon()) {
        return b.getScore() - a.getScore(); 
      } else {
        return (a.isWon()) ? -1 : 1;
      }
    });
    pageNum = 6;
  }
}

void startGame() {
// Reset the board
  playerA = new CharacterAnimate(p1, 0.8);
  playerA.characterX = 100;
  playerA.moveY = GROUND_LEVEL;
  playerB = new CharacterAnimate(p2, 0.8);
  playerB.characterX = 150;
  playerB.moveY = GROUND_LEVEL;
  platforms = new ArrayList<Thing>();

  // Reset metadata
  currentScore = null;
  name.clear();
  isWon = false; 
  scoreNum = 0;
  currentGravity = GRAVITY;
  gravityHandPosition = 0.0;
  createPlatforms("map.csv");
  resetGravityTimer();
  
  // Start the game and prepare instructional pop-up
  loreNum = 1;
  pageNum = 3;
}

void handleGravity() {
  // Handle gravity timer etc., if the difficulty mode is 'hard'
  if (loreNum == 4) {
    timeTillGravityChanges -= 1;
    if (timeTillGravityChanges > 120) {
      currentGravity = GRAVITY;
      displayGravometer(0.0);
    } else if (timeTillGravityChanges > 50) {
      currentGravity = 0.6 * GRAVITY;
      displayGravometer(0.3);
    } else if (timeTillGravityChanges == 50) {
      if ((int)random(0, 100) > 50) {
        resetGravityTimer(); 
      }
      displayGravometer(0.3);
    } else if (timeTillGravityChanges > 0) {
      currentGravity = -GRAVITY;
      displayGravometer(1.0);
    } else {
      displayGravometer(1.0);
      resetGravityTimer(); // It is important that this function is called AFTER gravity has been flipped!
    }
  }
}

void resetGravityTimer() {
  timeTillGravityChanges = (int)random(200, 800);
}

void displayGravometer(float position) {
  if (position != gravityHandPosition) {
    gravityHandPosition += 0.05 * (position - gravityHandPosition);
  }

  // Drawing the static clockface
  fill(#D4AF37);
  textSize(30);
  text("DISRUPTION", WIDTH - (120 + screenX), 248 - screenY);
  circle(WIDTH - (120 + screenX), 120 - screenY, 200);
  fill(#FFFFFF);
  circle(WIDTH - (120 + screenX), 120 - screenY, 184);
  fill(#D4AF37);
  circle(WIDTH - (38 + screenX), 120 - screenY, 20);
  stroke(#000000);
  strokeWeight(4);
  strokeCap(SQUARE);
  line(WIDTH - (210 + screenX), 120 - screenY, WIDTH - (200 + screenX), 120 - screenY);
  line(WIDTH - (147 + screenX), 195 - screenY, WIDTH - (151 + screenX), 204 - screenY);
  stroke(#FF0000);
  line(WIDTH - (147 + screenX), 45 - screenY, WIDTH - (151 + screenX), 36 - screenY);

  // Drawing dynamic dial - requires some gnarly trigonometry
  float dialX = (float)(WIDTH - 38 - screenX - (130 * Math.sin((double)((1.21 * (1 - gravityHandPosition)) + 0.97))));
  float dialY = (float)(120 - screenY - (130 * Math.cos((double)((1.21 * (1 - gravityHandPosition)) + 0.97))));

  stroke(#D4AF37);
  line(dialX, dialY, (WIDTH - (38 + screenX)), 120 - screenY);

  // reset stroke to stop everything else looking bad
  strokeWeight(0);
}