import processing.sound.*;

final static float MOVE_SPEED = 15;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;
Sound s;

Character c;
PImage bg, float_brick, grass, mushroom, button1, button2, mario;
ArrayList<Character> platforms;
int pageNum;
Game game;
Page page;

void setup(){
  size(1500,800);
  game = new Game();
  page = new Page();
  pageNum = 2;
     // Play two sine oscillators with slightly different frequencies for a nice "beat".
  SinOsc sin = new SinOsc(this);
  sin.play(200, 0.2);
  sin = new SinOsc(this);
  sin.play(205, 0.2);

  // Create a Sound object for globally controlling the output volume.
  s = new Sound(this);
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
    game.drawGame();
  }
  //if(page == 4){
  //  game_2p();
  //}
}

void keyPressed() {
   if (pageNum == 3) {
     game.moveGame();
   }
  // Set the volume of the sound file based on the key pressed
  s.volume(0.5);
 
  if (key == '0') {
    s.volume(0.0);
    //textSize(50);
    //text("size: "+key,250,250);
  } 
  if (key == '1') {
    s.volume(0.1);
  } 
  if (key == '2') {
    s.volume(0.2);
  } 
  if (key == '3') {
    s.volume(0.3);
  } 
  if (key == '4') {
    s.volume(0.4);
  } 
  if (key == '5') {
    s.volume(0.5);
  } 
  if (key == '6') {
    s.volume(0.6);
  } 
  if (key == '7') {
    s.volume(0.7);
  } 
  if (key == '8') {
    s.volume(0.8);
  } 
  if (key == '9') {
    s.volume(0.9);
  } 
 }
