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
}