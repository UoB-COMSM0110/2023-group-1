public class Character{
  PImage image;
  float character_x, character_y;
  float move_x, move_y;
  float w, h;
  
  public Character(String filename, float scale, float x, float y){
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    character_x = x;
    character_y = y;
    move_x = 0;
    move_y = 0;
  }

  public Character(String filename, float scale){
    this(filename, scale, 0, 0);
  }

  public Character(PImage img, float scale){
    image = img;
    w = image.width * scale;
    h = image.height * scale;
    character_x = 0;
    character_y = 0;
    move_x = 0;
    move_y = 0;
  }
  
  public void display(){
    image(image,character_x, character_y, w, h);
  }

  public void update(float gravity, float inertia){
    character_x += move_x;
    character_y += move_y;
    move_y += gravity;
    if (move_x > 0) {
      move_x = max(move_x - inertia, 0); 
    } else {
      move_x = min(move_x + inertia, 0);
    }
  }
}
