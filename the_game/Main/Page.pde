public class Page {

//page1
  public void gameStart() {
    image(bg, WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    textSize(180);
    text("T O P S Y   T U R V Y", (WIDTH / 2), 200);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button1, (WIDTH / 2), 500, 400, 110); //start
    image(button2, ((WIDTH / 2) - 100), (600 + (50/2)), 130, 50); // 1 player
    image(button2, ((WIDTH / 2) + 100), (600 + (50/2)), 130, 50); // 2 player
    image(button2, (WIDTH / 2) + 320, 500, 130, 50); // Hard Mode
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle(((WIDTH / 2) + 100), 650, ((WIDTH / 2) + 90), 670, ((WIDTH / 2) + 110), 670);
    } else {
      triangle(((WIDTH / 2) - 100), 650, ((WIDTH / 2) - 90), 670, ((WIDTH / 2) -110), 670);
    }

    // Set up the colour for the hard mode indicator box
    if (hardMode) {
      noFill();
      stroke(#FFFF00);
      strokeWeight(10);
      rect((WIDTH / 2) + 250, 470, 140, 60);
    }  

    // reset the colour so that the text is not messed up
    fill(#FFFFFF);
    strokeWeight(4);


    textSize(60);
    text("GAME START", (WIDTH / 2), 525);
    textSize(30);
    text("1 Player", ((WIDTH / 2) - 100), 635);
    text("2 Player", ((WIDTH / 2) + 100), 635);
    text("Hard", (WIDTH / 2) + 320, 510);
    fill(240, 210, 200);
  }

  //page2
  public void gameOver() {
    image(bg, WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    textSize(100);
    text("UNLUCKY, YOU LOST", (WIDTH / 2), 120);
    textSize(80);
    text("YOUR SCORE WAS: " + scoreNum, (WIDTH / 2), 240);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button2, (WIDTH / 2), 320, 250, 80); // save score
    image(button1, (WIDTH / 2), 500, 400, 110); //start
    image(button2, ((WIDTH / 2) - 100), (600 + (50/2)), 130, 50); //1 player
    image(button2, ((WIDTH / 2) + 100), (600 + (50/2)), 130, 50); //2 player
    image(button2, (WIDTH / 2) + 320, 500, 130, 50); // Hard Mode
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle(((WIDTH / 2) + 100), 650, ((WIDTH / 2) + 90), 670, ((WIDTH / 2) + 110), 670);
    } else {
      triangle(((WIDTH / 2) - 100), 650, ((WIDTH / 2) - 90), 670, ((WIDTH / 2) -110), 670);
    }

    // Set up the colour for the hard mode indicator box
    if (hardMode) {
      noFill();
      stroke(#FFFF00);
      strokeWeight(10);
      rect((WIDTH / 2) + 250, 470, 140, 60);
    }  

    // reset the colour so that the text is not messed up
    fill(#FFFFFF);
    strokeWeight(4);

    textSize(50);
    text("save score", (WIDTH / 2), 330);
    textSize(60);
    text("GAME START", (WIDTH / 2), 525);
    textSize(30);
    text("1 Player", ((WIDTH / 2) - 100), 635);
    text("2 Player", ((WIDTH / 2) + 100), 635);
    text("Hard", (WIDTH / 2) + 320, 510);
    fill(240, 210, 200);

    // Save score
    if (mouseX > (WIDTH / 2) - 125 && mouseX < (WIDTH / 2) + 125 && mouseY > 280 && mouseY < 400) {
      if (mousePressed && mouseButton == LEFT) {
          pageNum = 5;
       }
    }
  }

  // Page 4
  public void gameWon() {
    image(bg, WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    textSize(100);
    text("CONGRATULATIONS", (WIDTH / 2), 120);
    textSize(80);
    text("YOUR SCORE WAS: " + scoreNum, (WIDTH / 2), 240);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button2, (WIDTH / 2), 320, 250, 80); // save score
    image(button1, (WIDTH / 2), 500, 400, 110); //start
    image(button2, ((WIDTH / 2) - 100), (600 + (50/2)), 130, 50); //1 player
    image(button2, ((WIDTH / 2) + 100), (600 + (50/2)), 130, 50); //2 player
    image(button2, (WIDTH / 2) + 320, 500, 130, 50); // Hard Mode
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle(((WIDTH / 2) + 100), 650, ((WIDTH / 2) + 90), 670, ((WIDTH / 2) + 110), 670);
    } else {
      triangle(((WIDTH / 2) - 100), 650, ((WIDTH / 2) - 90), 670, ((WIDTH / 2) -110), 670);
    }

    // Set up the colour for the hard mode indicator box
    if (hardMode) {
      noFill();
      stroke(#FFFF00);
      strokeWeight(10);
      rect((WIDTH / 2) + 250, 470, 140, 60);
    }  

    // reset the colour so that the text is not messed up
    fill(#FFFFFF);
    strokeWeight(4);

    textSize(50);
    text("save score", (WIDTH / 2), 330);
    textSize(60);
    text("GAME START", (WIDTH / 2), 525);
    textSize(30);
    text("1 Player", ((WIDTH / 2) - 100), 635);
    text("2 Player", ((WIDTH / 2) + 100), 635);
    text("Hard", (WIDTH / 2) + 320, 510);
    fill(240, 210, 200);
  }

  // Page 5
  public void enterName() {
    image(bg, WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    textSize(180);
    text("Enter Name", (WIDTH / 2), 160);

    String letter1 = String.valueOf((name.size() < 1) ? '_' : name.get(0));
    String letter2 = String.valueOf((name.size() < 2) ? '_' : name.get(1));
    String letter3 = String.valueOf((name.size() < 3) ? '_' : name.get(2));

    String nameString = "".concat(letter1).concat(letter2).concat(letter3);
    textSize(300);
    text(nameString, (WIDTH / 2), 500);
  }

  // Page 6
  public void leaderboard() {
    image(bg, WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    textSize(180);
    text("LEADER BOARD", (WIDTH / 2), 130);
    int scoreHeight = 320;
    textSize(100);
    for (int i = 0; i < min(5, highScores.size()); i++) {
      if (i < highScores.size()) {
        text(highScores.get(i).toString(), (WIDTH / 2), scoreHeight);
        scoreHeight += 150;
      }
    }
    if (highScores.size() > 5) {
      if (currentScore != null && (highScores.indexOf(currentScore)) < 5) {
        text(highScores.get(5).toString(), (WIDTH / 2), scoreHeight);
      } else {
        text(currentScore.toString(), (WIDTH / 2), scoreHeight);
      }
    }
  }
}
  
