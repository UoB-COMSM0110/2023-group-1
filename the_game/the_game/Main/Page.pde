public class Page {

//page1
  public void gameStart() {
    int playerNum = 1;
    bg = loadImage("../map.png");
    image(bg, 750, 400, 1500, 800);
    textSize(180);
    text("T O P S Y   T U R V Y", 50, 200);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button1, (WIDTH / 2), 500, 400, 110); //start
    image(button2, ((WIDTH / 2) - 100), (600 + (50/2)), 130, 50); //1 player
    image(button2, ((WIDTH / 2) + 100), (600 + (50/2)), 130, 50); //2 player
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle(((WIDTH / 2) + 100), 650, ((WIDTH / 2) + 90), 670, ((WIDTH / 2) + 110), 670);
    } else {
      triangle(((WIDTH / 2) - 100), 650, ((WIDTH / 2) - 90), 670, ((WIDTH / 2) -110), 670);
    }
    // reset the colour so that the text is not messed up
    fill(#FFFFFF);


    textSize(60);
    text("GAME START", 590, 535);
    textSize(30);
    text("1 Player", 600, 635);
    text("2 Player", 800, 635);
    fill(240, 210, 200);
  
    //1 player
    if (mouseX > 590 && mouseX < 720 && mouseY > 600 && mouseY < 650) {
      if (mousePressed && mouseButton == LEFT) {
          playerNum = 1;
          println("Player Number is : " + playerNum);
          twoPlayers = false;
       }
    }
    //2 player
    if (mouseX > 760 && mouseX < 890 && mouseY > 600 && mouseY < 650) {
      if (mousePressed && mouseButton == LEFT) {
          playerNum = 2;
          println("Player Number is : " + playerNum);
          twoPlayers = true;
      }
    } 
    //game start
    if (mouseX > 550 && mouseX < 950 && mouseY > 450 && mouseY < 560) {
      if (mousePressed && mouseButton == LEFT) {
        pageNum = 3;
      }
    }
  }

  //page2
  public void gameOver() {
    int playerNum = 1;
    bg = loadImage("../map.png");
    image(bg, 750, 400, 1500, 800);
    textSize(100);
    text("UNLUCKY, YOU LOST", 325, 180);
    textSize(80);
    text("YOUR SCORE WAS: " + scoreNum, 410, 300);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button1, (WIDTH / 2), 500, 400, 110); //start
    image(button2, ((WIDTH / 2) - 100), (600 + (50/2)), 130, 50); //1 player
    image(button2, ((WIDTH / 2) + 100), (600 + (50/2)), 130, 50); //2 player
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle(((WIDTH / 2) + 100), 650, ((WIDTH / 2) + 90), 670, ((WIDTH / 2) + 110), 670);
    } else {
      triangle(((WIDTH / 2) - 100), 650, ((WIDTH / 2) - 90), 670, ((WIDTH / 2) -110), 670);
    }
    // reset the colour so that the text is not messed up
    fill(#FFFFFF);


    textSize(60);
    text("TRY AGAIN", 618, 535);
    textSize(30);
    text("1 Player", 600, 635);
    text("2 Player", 800, 635);
    fill(240, 210, 200);

    //1 player
    if (mouseX > 590 && mouseX < 720 && mouseY > 600 && mouseY < 650) {
      if (mousePressed && mouseButton == LEFT) {
          playerNum = 1;
          println("Player Number is : " + playerNum);
          twoPlayers = false;
       }
    }
    //2 player
    if (mouseX > 760 && mouseX < 890 && mouseY > 600 && mouseY < 650) {
      if (mousePressed && mouseButton == LEFT) {
          playerNum = 2;
          println("Player Number is : " + playerNum);
          twoPlayers = true;
      }
    } 
    //game start
    if (mouseX > 550 && mouseX < 950 && mouseY > 450 && mouseY < 560) {
      if (mousePressed && mouseButton == LEFT) {
        // Reset the board
        playerA = new CharacterAnimate(p1, 0.8);
        playerA.characterX = 100;
        playerA.moveY = GROUND_LEVEL;
        playerB = new CharacterAnimate(p2, 0.8);
        playerB.characterX = 150;
        playerB.moveY = GROUND_LEVEL;
        platforms = new ArrayList<Character>();
        coins = new ArrayList<Character>();
        scoreNum = 0;
        createPlatforms("map.csv");
        // Start the game
        pageNum = 3;
      }
    }
  }

  // Page 4
  public void gameWon() {
    int playerNum = 1;
    bg = loadImage("../map.png");
    image(bg, 750, 400, 1500, 800);
    textSize(100);
    text("CONGRATULATIONS", 340, 180);
    textSize(80);
    text("YOUR SCORE WAS: " + scoreNum, 410, 300);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button1, (WIDTH / 2), 500, 400, 110); //start
    image(button2, ((WIDTH / 2) - 100), (600 + (50/2)), 130, 50); //1 player
    image(button2, ((WIDTH / 2) + 100), (600 + (50/2)), 130, 50); //2 player
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle(((WIDTH / 2) + 100), 650, ((WIDTH / 2) + 90), 670, ((WIDTH / 2) + 110), 670);
    } else {
      triangle(((WIDTH / 2) - 100), 650, ((WIDTH / 2) - 90), 670, ((WIDTH / 2) -110), 670);
    }
    // reset the colour so that the text is not messed up
    fill(#FFFFFF);


    textSize(60);
    text("PLAY AGAIN", 590, 535);
    textSize(30);
    text("1 Player", 600, 635);
    text("2 Player", 800, 635);
    fill(240, 210, 200);

    //1 player
    if (mouseX > 590 && mouseX < 720 && mouseY > 600 && mouseY < 650) {
      if (mousePressed && mouseButton == LEFT) {
          playerNum = 1;
          println("Player Number is : " + playerNum);
          twoPlayers = false;
       }
    }
    //2 player
    if (mouseX > 760 && mouseX < 890 && mouseY > 600 && mouseY < 650) {
      if (mousePressed && mouseButton == LEFT) {
          playerNum = 2;
          println("Player Number is : " + playerNum);
          twoPlayers = true;
      }
    } 
    //game start
    if (mouseX > 550 && mouseX < 950 && mouseY > 450 && mouseY < 560) {
      if (mousePressed && mouseButton == LEFT) {
        // Reset the board
        playerA = new CharacterAnimate(p1, 0.8);
        playerA.characterX = 100;
        playerA.moveY = GROUND_LEVEL;
        playerB = new CharacterAnimate(p2, 0.8);
        playerB.characterX = 150;
        playerB.moveY = GROUND_LEVEL;
        platforms = new ArrayList<Character>();
        coins = new ArrayList<Character>();
        scoreNum = 0;
        createPlatforms("map.csv");
        // Start the game
        pageNum = 3;
      }
    }
  }

 }
  
