import processing.sound.*;

final static float MOVE_SPEED = 15;
final static float CHARACTER_SCALE = 50.0/128;
final static float CHARACTER_SIZE = 50;
Sound soundVolume;
SoundFile play;
SoundFile win;
SoundFile fail;

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
  pageNum = 5;
    if(pageNum == 1){
    play = new SoundFile(this, "play.mp3");
    play.play();
  }
  if(pageNum == 2){
    win = new SoundFile(this, "win.mp3");
    win.play();
  }
  if(pageNum == 3){
    play = new SoundFile(this, "play.mp3");
    play.play();
  }
  /*
  if(page == 4){
    game_2p();
  }
  */
  if(pageNum == 5){
    fail = new SoundFile(this, "fail.mp3");
    fail.play();
  }
 
  soundVolume = new Sound(this);
}

void draw(){
  background(255);
  if(pageNum == 1){
    page.gameStart();
  }
  if(pageNum == 2){
    page.gameWin();
  }
  if(pageNum == 3){
    game.drawGame();
  }
  //if(page == 4){
  //  game_2p();
  //}
  if(pageNum == 5){
   page.gameFail();
  }
}

void keyPressed() {
   if (pageNum == 3) {
     game.moveGame();
   }
  // Set the volume of the sound file based on the key pressed
  soundVolume.volume(0.5);
 
  if (key == '0') {
  soundVolume.volume(0.0);
  }
  if (key == '1') {
    soundVolume.volume(0.1);
  } 
  if (key == '2') {
    soundVolume.volume(0.2);
  } 
  if (key == '3') {
    soundVolume.volume(0.3);
  } 
  if (key == '4') {
    soundVolume.volume(0.4);
  } 
  if (key == '5') {
    soundVolume.volume(0.5);
  } 
  if (key == '6') {
    soundVolume.volume(0.6);
  } 
  if (key == '7') {
    soundVolume.volume(0.7);
  } 
  if (key == '8') {
    soundVolume.volume(0.8);
  } 
  if (key == '9') {
    soundVolume.volume(0.9);
  } 
 }
