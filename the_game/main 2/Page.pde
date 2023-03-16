public class Page {

//page1
  public void gameStart(){
    int playerNum = 1;
    bg = loadImage("../map.png");
    image(bg,0,0,1500,800);
    textSize(100);
    text("M A R I O",590,200);
    mario = loadImage("../mario.png");
    image(mario,700,260,150,200);
    button1 = loadImage("../platformPack_tile001.png");
    button2 = loadImage("../platformPack_tile004.png");
    image(button1,550,450,400,110);//start
    image(button2,590,600,130,50);//1 player
    image(button2,760,600,130,50);//2 player
    textSize(60);
    text("GAME START",590,535);
    textSize(30);
    text("1 Player",605,635);
    text("2 Player",775,635);
    fill(240,210,200);
  
    //1 player
    if(mouseX>590 && mouseX<720 && mouseY>600 && mouseY<650){
      if(mouseButton == LEFT){
          playerNum = 1;
          //triangle(18, 18, 18, 360, 81, 360);
          println("Player Number is : " + playerNum);
       }
    }
    //2 player
    if(mouseX>760 && mouseX<890 && mouseY>600 && mouseY<650){
      if(mouseButton == LEFT){
          playerNum = 2;
          println("Player Number is : " + playerNum);
      }
    } 
    //game start
    if(mouseX>550 && mouseX<950 && mouseY>450 && mouseY<560){
      if(mouseButton == LEFT){
        if(playerNum == 1){
          pageNum = 3;
        }else if(playerNum == 2){
          pageNum = 4;
        }
      }
    }
  }

  //page2
  public void gameWin(){
    bg = loadImage("../map.png");
    image(bg,0,0,1500,800);
    textSize(100);
    text("YOU WIN !",530,130);
    button1 = loadImage("../platformPack_tile001.png");
    button2 = loadImage("../platformPack_tile004.png");
    image(button2,450,170,600,400);
    image(button1,500,595,210,70);//restart
    image(button1,780,595,210,70);//end
    textSize(45);
    text("RESTART",520,650);
    text("END GAME",790,650);
    fill(240,210,200);
    if(mouseX>500 && mouseX<710 && mouseY>595 && mouseY<665){
      if(mouseButton == LEFT){
          pageNum = 1;
      }
    }
    if(mouseX>780 && mouseX<990 && mouseY>595 && mouseY<665){
      if(mouseButton == LEFT){
          exit();
      }
    }
  }
   public void gameFail(){
    bg = loadImage("../map.png");
    image(bg,0,0,1500,800);
    textSize(100);
    text("YOU Fail !",530,130);
    button1 = loadImage("../platformPack_tile001.png");
    button2 = loadImage("../platformPack_tile004.png");
    image(button2,450,170,600,400);
    image(button1,500,595,210,70);//restart
    image(button1,780,595,210,70);//end
    textSize(45);
    text("RESTART",520,650);
    text("END GAME",790,650);
    fill(240,210,200);
    if(mouseX>500 && mouseX<710 && mouseY>595 && mouseY<665){
      if(mouseButton == LEFT){
          pageNum = 1;
      }
    }
    if(mouseX>780 && mouseX<990 && mouseY>595 && mouseY<665){
      if(mouseButton == LEFT){
          exit();
      }
    }
   }
  
    
  }

 
  
