public class Page {

//page1
  public void gameStart(){
    int playerNum = 1;
    bg = loadImage("../map.png");
    image(bg, 750, 400, 1500, 800);
    textSize(100);
    text("M A R I O", 590, 200);
    mario = loadImage("../mario.png");
    image(mario, 750, 350, 150, 200);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button1, (550 + (400/2)), (450 + (110 / 2)), 400, 110);//start
    image(button2, (590 + (130/2)), (600 + (50/2)), 130, 50);//1 player
    image(button2, (760 + (130/2)), (600 + (50/2)), 130, 50);//2 player
    
    // Set up the colour for the number of player indicator
    fill(#FFFF00);
    noStroke();
    if (twoPlayers) {
      triangle((760 + (130/2)), 650, (760 + (130/2) - 10), 670, (760 + (130/2) + 10), 670);
    } else {
      triangle((590 + (130/2)), 650, (590 + (130/2) - 10), 670, (590 + (130/2) + 10), 670);
    }
    // reset the colour so that the text is not messed up
    fill(#FFFFFF);

    textSize(60);
    text("GAME START", 590, 535);
    textSize(30);
    text("1 Player", 605, 635);
    text("2 Player", 775, 635);
    fill(240, 210, 200);
  
    //1 player
    if (mouseX > 590 && mouseX < 720 && mouseY > 600 && mouseY < 650) {
      if (mouseButton == LEFT) {
          playerNum = 1;
          println("Player Number is : " + playerNum);
          twoPlayers = false;
       }
    }
    //2 player
    if (mouseX > 760 && mouseX < 890 && mouseY > 600 && mouseY < 650) {
      if (mouseButton == LEFT) {
          playerNum = 2;
          println("Player Number is : " + playerNum);
          twoPlayers = true;
      }
    } 
    //game start
    if(mouseX > 550 && mouseX < 950 && mouseY > 450 && mouseY < 560){
      if(mouseButton == LEFT){
        pageNum = 3;
      }
    }
  }

  //page2
  public void gameOver(){
    bg = loadImage("../map.png");
    image(bg, 0, 0, 1500, 800);
    textSize(100);
    text("YOU WIN !", 530, 130);
    button1 = loadImage("../pic/platformPack_tile001.png");
    button2 = loadImage("../pic/platformPack_tile004.png");
    image(button2, 450, 170, 600, 400);
    image(button1, 500, 595, 210, 70);//restart
    image(button1, 780, 595, 210, 70);//end
    textSize(45);
    text("RESTART", 520, 650);
    text("END GAME", 790, 650);
    fill(240, 210, 200);
    if(mouseX > 500 && mouseX < 710 && mouseY > 595 && mouseY < 665){
      if(mouseButton == LEFT){
          pageNum = 1;
      }
    }
  
    if(mouseX > 780 && mouseX < 990 && mouseY > 595 && mouseY < 665){
      if(mouseButton == LEFT){
        exit();
      }
    }
  }

 }
  
