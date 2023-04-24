public class ScoreTuple {
    private String name;
    private int score;
    private boolean won;

    public ScoreTuple(String n, int s) {
        name = n;
        score = s;
        won = true;
    }

    public ScoreTuple(String n, int s, boolean w) {
        name = n;
        score = s;
        won = w;
    }

    public String getName() {
        return name;
    }
    
    public int getScore() {
        return score;
    }

    public boolean isWon() {
        return won;
    }

    public void print(int x) {
        textSize(60);
        textAlign(LEFT);
        fill((won) ? #FFD700 : #DCDCDC);
        text(name, 500, x);
        text(score, 1000, x);
        textAlign(CENTER);
        fill(#DCDCDC);
    }
}