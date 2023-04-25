public class Enemy extends Animate {
    float leftBoundary, rightBoundary;
    public Enemy(PImage img, float scale, float bLeft, float bRight) {
        super(img, scale);
        moveLeft = new PImage[8];
        moveLeft[0] = loadImage("../Zombie/zombie_walkr7.png");
        moveLeft[1] = loadImage("../Zombie/zombie_walkr6.png");
        moveLeft[2] = loadImage("../Zombie/zombie_walkr5.png");
        moveLeft[3] = loadImage("../Zombie/zombie_walkr4.png");
        moveLeft[4] = loadImage("../Zombie/zombie_walkr3.png");
        moveLeft[5] = loadImage("../Zombie/zombie_walkr2.png");
        moveLeft[6] = loadImage("../Zombie/zombie_walkr1.png");
        moveLeft[7] = loadImage("../Zombie/zombie_walkr0.png");
        moveRight = new PImage[8];
        moveRight[0] = loadImage("../Zombie/zombie_walkl0.png");
        moveRight[1] = loadImage("../Zombie/zombie_walkl1.png");
        moveRight[2] = loadImage("../Zombie/zombie_walkl2.png");
        moveRight[3] = loadImage("../Zombie/zombie_walkl3.png");
        moveRight[4] = loadImage("../Zombie/zombie_walkl4.png");
        moveRight[5] = loadImage("../Zombie/zombie_walkl5.png");
        moveRight[6] = loadImage("../Zombie/zombie_walkl6.png");
        moveRight[7] = loadImage("../Zombie/zombie_walkl7.png");

        currentImg = moveRight;
        facing = RIGHT_FACING;
        leftBoundary = bLeft;
        rightBoundary = bRight;
        moveX = 1.5;
    }

    void update() {
        super.update();
        if(getLeftBoundary() <= leftBoundary){
            setLeftBoundary(leftBoundary);
            moveX *= -1;
        }
        else if (getRightBoundary() >= rightBoundary) {
            setRightBoundary(rightBoundary);
            moveX *= -1;
        }
    }
}