public class Thing {
  PImage image;
  float characterX, characterY;
  float moveX, moveY;
  float w, h;//width and height
  
  public Thing(String filename, float scale, float x, float y) {
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    characterX = x;
    characterY = y;
    moveX = 0;
    moveY = 0;
  }
  public Thing(String filename, float scale) {
    this(filename, scale, 0, 0); 
  }
  public Thing(PImage img, float scale) {
    image = img;
    w = image.width * scale;
    h = image.height * scale;
    characterX = 0;
    characterY = 0;
    moveX = 0;
    moveY = 0;
  }
  
  public void display() {
    image(image, characterX, characterY, w, h);
  }


  public void update() {
    characterX += moveX;
    characterY += moveY;
  }
  
  //get the old boundary
  float getTopBoundary() {
    return characterY - h/2;
  }
  float getBottomBoundary() {
    return characterY + h/2;
  }
  float getLeftBoundary() {
    return characterX - w/2;
  }
  float getRightBoundary() {
    return characterX + w/2;
  }
  
  //update the new boundary
  void setBottomBoundary(float bottom) {
    characterY = bottom - h/2;
  }
  void setTopBoundary(float top) {
    characterY = top + h/2;
  }
  void setLeftBoundary(float left) {
    characterX = left + w/2;
  }
  void setRightBoundary(float right) {
    characterX = right - w/2;
  }

}
