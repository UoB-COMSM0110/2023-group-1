import processing.sound.*;
Sound s;



void setup() {
  size(500, 500);
  
 
  // Play two sine oscillators with slightly different frequencies for a nice "beat".
  SinOsc sin = new SinOsc(this);
  sin.play(200, 0.2);
  sin = new SinOsc(this);
  sin.play(205, 0.2);

  // Create a Sound object for globally controlling the output volume.
  s = new Sound(this);
}

void draw() {
    //fill(value);
    
  rect(25, 25, 50, 50);
}






void keyPressed() {
  // Set the volume of the sound file based on the key pressed
  s.volume(0.5);
 
  if (key == '0') {
    s.volume(0.0);
    textSize(50);
    text("size: "+key,250,250);
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
  
