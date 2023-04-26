public class Page {

//page1
  public void gameStart() {
    image(bg, WIDTH / 2, HEIGHT / 2, WIDTH, HEIGHT);
    textSize(180);
    text("T O P S Y   T U R V Y", (WIDTH / 2), 260);
    image(button2, WIDTH - 70, 70, 100, 100); // leaderboard
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
      rect((WIDTH / 2) + 320, 500, 140, 60);
    }  

    // reset the colour so that the text is not messed up
    fill(#FFFFFF);
    strokeWeight(0);

    image(trophy, WIDTH - 70, 70, 100, 100);
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
      rect((WIDTH / 2) + 320, 500, 140, 60);
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
      rect((WIDTH / 2) + 320, 500, 140, 60);
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
    textSize(150);
    text("LEADER BOARD", (WIDTH / 2), 130);
    int scoreHeight = 320;
    textSize(100);
    for (int i = 0; i < min(5, highScores.size()); i++) {
      if (i < highScores.size()) {
        highScores.get(i).print(scoreHeight);
        scoreHeight += 70;
      }
    }
    if (highScores.size() > 5) {
      if (currentScore != null && (highScores.indexOf(currentScore)) < 5) {
        highScores.get(5).print(scoreHeight);
      } else {
        currentScore.print(scoreHeight);
      }
    }

    textSize(40);
    image(button1, 100, 50, 100, 50);
    text("Back", 100, 60);
  }

  public void lore() {
    fill(#DCDCDC);
    rect(WIDTH / 2, HEIGHT / 2, WIDTH - 200, HEIGHT - 200, 28);

    textSize(40);
    textLeading(50);
    fill(#000000);

    switch (loreNum) {
      case 1:
        text("The world you inhabit has been on the brink of an energy crisis for the\npast decade.  In order to save your people, the great alchemist Elphaba\nwas tasked with finding a new source of energy.  Miraculously, they\nmanaged to identified a well of interdimensional energy on the\nplanet and planned to draw energy from it.  Unfortunately, in their\nhubris, they drilled too far into this well and tore a hole between\ndimensions.  Through this hole, monsters have passed and the very\nfabric of our reality is fraying!", WIDTH / 2, 200);
        break;
      case 2:
        text((twoPlayers) ? 
          "Fortunately, two heros have emerged who have the power to cross the\ndimensional divide, and save the world.  In order to do so, you must collect\nas much gold as you can (it is the only element that can plug the\nhole), and make your way to the rupture between worlds.  Be\ncareful, though.  There are monsters in your way that will destroy you\non contact.  Also, the interdimensional energy is changing\nthe way that gravity behaves." :
          "Fortunately, a hero has emerged who has the power to cross the\ndimensional divide, and save the world.  In order to do so, you must collect\nas much gold as you can (it is the only element that can plug the\nhole), and make your way to the rupture between worlds.  Be\ncareful, though.  There are monsters in your way that will destroy you\non contact.  Also, the interdimensional energy is changing\nthe way that gravity behaves.", WIDTH / 2, 200);
        break;
      case 3:
        text("Try to make your way to the interdimensional rupture\n\nKeep an eye on the gravity disruption guage", WIDTH / 2, 200);

        if (twoPlayers) {
          text("Player 2 moves with WASD, Player 1 moves with the arrow keys", WIDTH / 2, 300);
          // Player 2 keys
          image(wKey, 400, 350, 60, 60);
          image(aKey, 360, 410, 60, 60);
          image(sKey, 420, 410, 60, 60);
          image(dKey, 480, 410, 60, 60);

          // Player 1 keys
          image(emptyKey, 1050, 350, 60, 60);
          image(emptyKey, 990, 410, 60, 60);
          image(emptyKey, 1050, 410, 60, 60);
          image(emptyKey, 1110, 410, 60, 60);        
          image(arrow, 1110, 410, 30, 30);
          rotate(PI / 2);
          image(arrow, 410, -1050, 30, 30);
          rotate(PI / 2);
          image(arrow, -990, -410, 30, 30);
          rotate(PI / 2);
          image(arrow, -350, 1050, 30, 30);
          rotate(PI / 2);

          // Character images
          image(p1, 1050, 550, p1.width * 1.8, p1.height * 1.8);
          image(p2, 420, 550, p2.width * 1.8, p2.height * 1.8);
        } else {
          text("Use the arrow keys to move", WIDTH / 2, 400);
          image(emptyKey, WIDTH / 2, 450, 60, 60);
          image(emptyKey, (WIDTH / 2) - 60, 510, 60, 60);
          image(emptyKey, WIDTH / 2, 510, 60, 60);
          image(emptyKey, (WIDTH / 2) + 60, 510, 60, 60);          
          image(arrow, (WIDTH / 2) + 60, 510, 30, 30);
          rotate(PI / 2);
          image(arrow, 510, -(WIDTH / 2), 30, 30);
          rotate(PI / 2);
          image(arrow, -((WIDTH / 2) - 60), -510, 30, 30);
          rotate(PI / 2);
          image(arrow, -450, WIDTH / 2, 30, 30);
          rotate(PI / 2);
        }
        break;
      default:
        break;
    }
    fill(#DCDCDC);
    rect(WIDTH - 230, HEIGHT - 160, 220, 80, 20);
    fill(#0F0F0F);
    text((loreNum == 3) ? "START" : "continue...", WIDTH - 230, HEIGHT - 148);
  }
}
  
