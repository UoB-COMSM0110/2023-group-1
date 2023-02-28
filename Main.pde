final static float MOVE_SPEED = 15;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;

Character c;
PImage bg, float_brick, grass, mushroom;
ArrayList<Character> platforms;

void setup(){
  size(1500,800);
  bg = loadImage("../map.png");
  c = new Character("../maleAdventurer.png", 1.0, 100, 570);
  c.move_x = 0;
  c.move_y = 0;
  platforms = new ArrayList<Character>();
  float_brick = loadImage("../ground_grass_small.png");
  mushroom = loadImage("../mushroom_red.png");
  grass = loadImage("../grass_brown2.png");
  createPlatforms("map.csv");
}

void draw(){
  background(255);
  image(bg,0,0,1500,800);
  c.display();
  c.update();
  
  for(Character s: platforms){
    s.display();
  }
}

void createPlatforms(String filename){
  String[] lines = loadStrings(filename);
  for(int row = 0; row <lines.length; row++){
    String[] values = split(lines[row], ",");
    for(int col = 0; col < values.length; col++){
      if(values[col].equals("1")){
        Character s = new Character(float_brick, CHARACTER_SCALE);
        s.character_x = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.character_y = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("2")){
        Character s = new Character(grass, CHARACTER_SCALE);
        s.character_x = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.character_y = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("3")){
        Character s = new Character(mushroom, CHARACTER_SCALE);
        s.character_x = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
        s.character_y = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
        platforms.add(s);
      }
      //else if(values[col].equals("4")){
      //  Character s = new Character(float_brick, CHARACTER_SCALE);
      //  s.character_x = CHARACTER_SIZE/2 + col * CHARACTER_SIZE;
      //  s.character_y = CHARACTER_SIZE/2 + row * CHARACTER_SIZE;
      //  platforms.add(s);
      //}
    }
  }
}

void keyPressed(){
  if(keyCode == RIGHT){
    c.move_x = MOVE_SPEED;
  }
  else if(keyCode == LEFT){
    c.move_x = -MOVE_SPEED;
  }
  else if(keyCode == UP){
    c.move_y = -MOVE_SPEED;
  }
  else if(keyCode == DOWN){
    c.move_y = MOVE_SPEED;
  }
}

void keyReleased(){
  if(keyCode == RIGHT){
    c.move_x = 0;
  }
  else if(keyCode == LEFT){
    c.move_x = 0;
  }
  else if(keyCode == UP){
    c.move_y = 0;
  }
  else if(keyCode == DOWN){
    c.move_y = 0;
  }
}
