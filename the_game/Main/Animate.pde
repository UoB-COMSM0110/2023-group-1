public class Animate extends Thing {
    PImage[] currentImg;
    PImage[] standMiddle;
    PImage[] moveLeft;
    PImage[] moveRight;
    int facing;
    int index;
    int frame;
    public Animate (PImage image, float scale) {
        super(image, scale);
        facing = MIDDLE_FACING;
        index = 0;
        frame = 0;
    }
    public void updateAnimation() {
        frame++;
        if (frame % 8 == 0) {
            selectFacing();
            selectImg();
            moveToNextImg();
        }
    }

    public void selectFacing() {
        if (moveX > 0) {
            facing = RIGHT_FACING;
        }
        else if (moveX < 0) {
            facing = LEFT_FACING;
        }
        else {
            facing = MIDDLE_FACING;
        }
    }
    public void selectImg() {
        if (facing == RIGHT_FACING) {
            currentImg = moveRight;
        }
        else if (facing == LEFT_FACING) {
            currentImg = moveLeft;
        }
        else {
            currentImg = standMiddle;
        }
    }

    public void moveToNextImg() {
        index = (index + 1) % currentImg.length;
        image = currentImg[index];
    }


}
