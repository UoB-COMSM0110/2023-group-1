final static float MOVE_SPEED = 15;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;
final static float GRAVITY = 1.0;

Character c;
PImage bg, float_brick, grass, mushroom;
ArrayList<Character> platforms;

void setup(){
  size(1500,800);
  bg = loadImage("../map.png");
  //bg = new Character("../map.png",1.0,0,0);
  imageMode(CENTER);
  //c = new Character("../maleAdventurer.png", 1.0, 100, 570);
  c = new Character("../maleAdventurer.png", 1.0, 900, 100);
  c.moveX = 0;
  c.moveY = 0;
  platforms = new ArrayList<Character>();
  float_brick = loadImage("../ground_grass_small.png");
  mushroom = loadImage("../mushroom_red.png");
  grass = loadImage("../grass_brown2.png");
  createPlatforms("map.csv");
}

void draw(){
  background(255);
  //image(bg,width/2,height/2,bg.width*1.2,bg.height*1.2);
  image(bg,0,0,bg.width*1.2,bg.height*1.1);
  c.display();
  solveCollisions(c,platforms);
  //c.update();
  
  for(Character a: platforms){
    a.display();
  }
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
      //else if(values[col].equals("4")){
      //  Character s = new Character(float_brick, CHARACTER_SCALE);
      //  s.characterX = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
      //  s.characterY = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
      //  platforms.add(s);
      //}
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
  else if(keyCode == UP){
    c.moveY = -MOVE_SPEED;
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
  else if(keyCode == UP){
    c.moveY = 0;
  }
  else if(keyCode == DOWN){
    c.moveY = 0;
  }
}
