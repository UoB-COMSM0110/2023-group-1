public class CharacterAnimate extends Animate {

    int lives;
    boolean onGround, inPlace;
    PImage[] standLeft; 
    PImage[] standRight; 
    PImage[] jumpLeft;
    PImage[] jumpRight;
    public CharacterAnimate (PImage img, float scale) {
        super(img, scale);
        lives = 3;
        facing = RIGHT_FACING;
        onGround = true;
        inPlace = true;
        standLeft = new PImage[1];
        standLeft[0] = loadImage("../Character/maleAdventurer_standleft.png");
        standRight = new PImage[1];
        standRight[0] = loadImage("../Character/maleAdventurer_standright.png");
        jumpLeft = new PImage[1];
        // jumpLeft[0] = loadImage("../Character/maleAdventurer_jumpleft0.png");
        jumpLeft[0] = loadImage("../Character/maleAdventurer_jumpleft1.png");
        // jumpLeft[2] = loadImage("../Character/maleAdventurer_jumpleft0.png");
        jumpRight = new PImage[1];
        // jumpRight[0] = loadImage("../Character/maleAdventurer_jumpright0.png");
        jumpRight[0] = loadImage("../Character/maleAdventurer_jumpright1.png");
        // jumpRight[2] = loadImage("../Character/maleAdventurer_jumpright0.png");
        moveLeft = new PImage[2];
        moveLeft[0] = loadImage("../Character/maleAdventurer_walkl1.png");
        moveLeft[1] = loadImage("../Character/maleAdventurer_walkl2.png");
        // moveLeft[2] = loadImage("../Character/maleAdventurer_walkl3.png");
        // moveLeft[3] = loadImage("../Character/maleAdventurer_walkl4.png");

        moveRight = new PImage[2];
        moveRight[0] = loadImage("../Character/maleAdventurer_walkr1.png");
        moveRight[1] = loadImage("../Character/maleAdventurer_walkr2.png");
        // moveRight[2] = loadImage("../Character/maleAdventurer_walkr3.png");
        // moveRight[3] = loadImage("../Character/maleAdventurer_walkr4.png");
        currentImg = standRight;
    }

    @Override
    public void updateAnimation(){
        onGround = isOnGround(this, platforms);
        if(moveX == 0 && moveY == 0){
            inPlace = true;
        }else{
            inPlace = false;
        }
        // inPlace = (moveX == 0 && moveY == 0);
        super.updateAnimation();
    }

    @Override
    public void selectFacing(){
        if(moveX > 0){
            facing = RIGHT_FACING;
        }
        else if (moveX < 0) {
            facing = LEFT_FACING;
        }
    }

    @Override
    public void selectImg(){
        if(facing == RIGHT_FACING){
            if(inPlace){
                currentImg = standRight;
            }
            else if (!onGround) {
                currentImg = jumpRight;
            }
            else{
                currentImg = moveRight;
            }
        }
        else if(facing == LEFT_FACING){
            if(inPlace){
                currentImg = standLeft;
            }
            else if (!onGround) {
                currentImg = jumpLeft;
            }
            else {
                currentImg = moveLeft;
            }
        }   
    }
}
