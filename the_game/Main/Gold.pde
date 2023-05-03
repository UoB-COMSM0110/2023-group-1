public class Gold extends Animate {
    public Gold(PImage img, float scale) {
        super(img, scale);
        standMiddle = new PImage[6];
        standMiddle[0] = loadImage("../assets/bronze_1.png");
        standMiddle[1] = loadImage("../assets/bronze_2.png");
        standMiddle[2] = loadImage("../assets/bronze_3.png");
        standMiddle[3] = loadImage("../assets/bronze_4.png");
        standMiddle[4] = loadImage("../assets/bronze_5.png");
        standMiddle[5] = loadImage("../assets/bronze_6.png");
        currentImg = standMiddle;
    }
}
