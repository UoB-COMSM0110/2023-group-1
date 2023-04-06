public class Gold extends Animate{
    public Gold(PImage img, float scale){
        super(img, scale);
        standMiddle = new PImage[5];
        standMiddle[0] = loadImage("../bronze_1.png");
        //standMiddle[1] = loadImage("../bronze_2.png");
        //standMiddle[2] = loadImage("../bronze_3.png");
        standMiddle[1] = loadImage("../bronze_4.png");
        standMiddle[2] = loadImage("../bronze_5.png");
        standMiddle[3] = loadImage("../bronze_6.png");
        standMiddle[4] = loadImage("../bronze_1.png");
        //standMiddle[2] = loadImage("../bronze_4.png");
        //standMiddle[3] = loadImage("../bronze_5.png");
        //standMiddle[4] = loadImage("../bronze_6.png");
        //standMiddle[5] = loadImage("../bronze_1.png");
        currentImg = standMiddle;
    }
}
