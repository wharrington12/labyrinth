public class Level {
    
    private Square[][] map;
    private int[][] start;
    private int[][] goal;
    private int numTreasure;
    
    public Level(int i){
        switch (i){
            case 0:
                this.start = new int[][] {{0,0},{2,2},{1,1}};
                this.goal = new int[][] {{2,2},{0,0}};
                this.map = new Square[3][3];
                this.map[0][0] = new Square(new int[]{0,0}, new int[]{0,1,0,1}, 0);
                this.map[1][0] = new Square(new int[]{1,0}, new int[]{1,0,0,1}, 0);
                this.map[2][0] = new Square(new int[]{2,0}, new int[]{1,1,0,1}, 1);
                this.map[0][1] = new Square(new int[]{0,1}, new int[]{0,1,1,1}, 0);
                this.map[1][1] = new Square(new int[]{1,1}, new int[]{0,1,1,0}, 2);
                this.map[2][1] = new Square(new int[]{2,1}, new int[]{1,1,0,0}, 2);
                this.map[0][2] = new Square(new int[]{0,2}, new int[]{0,1,0,1}, 1);
                this.map[1][2] = new Square(new int[]{1,2}, new int[]{0,0,1,1}, 0);
                this.map[2][2] = new Square(new int[]{2,2}, new int[]{0,0,1,0}, 0);
                this.map[0][1].setHasTreasure(true);
                this.numTreasure = 1;
                break;
            case 1:
                this.start = new int[][] {{6,0},{0,6},{3,3}};
                this.goal = new int[][] {{0,6},{6,0}};
                this.map = new Square[7][7];
                this.map[0][0] = new Square(new int[]{0,0}, new int[]{1,0,0,1}, 1);
                this.map[1][0] = new Square(new int[]{1,0}, new int[]{0,0,0,0}, 0);
                this.map[2][0] = new Square(new int[]{2,0}, new int[]{0,0,0,1}, 1);
                this.map[3][0] = new Square(new int[]{3,0}, new int[]{0,0,0,0}, 0);
                this.map[4][0] = new Square(new int[]{4,0}, new int[]{0,0,0,1}, 1);
                this.map[5][0] = new Square(new int[]{5,0}, new int[]{0,0,0,0}, 0);
                this.map[6][0] = new Square(new int[]{6,0}, new int[]{0,0,1,1}, 0);
                this.map[0][1] = new Square(new int[]{0,1}, new int[]{0,0,0,0}, 0);
                this.map[1][1] = new Square(new int[]{1,1}, new int[]{1,0,0,1}, 0);
                this.map[2][1] = new Square(new int[]{2,1}, new int[]{1,1,0,0}, 0);
                this.map[3][1] = new Square(new int[]{3,1}, new int[]{0,1,0,1}, 0);
                this.map[4][1] = new Square(new int[]{4,1}, new int[]{0,1,1,0}, 0);
                this.map[5][1] = new Square(new int[]{5,1}, new int[]{0,0,1,1}, 0);
                this.map[6][1] = new Square(new int[]{6,1}, new int[]{0,0,0,0}, 0);
                this.map[0][2] = new Square(new int[]{0,2}, new int[]{1,0,0,0}, 1);
                this.map[1][2] = new Square(new int[]{1,2}, new int[]{0,0,1,1}, 0);
                this.map[2][2] = new Square(new int[]{2,2}, new int[]{0,1,1,0}, 3);
                this.map[3][2] = new Square(new int[]{3,2}, new int[]{1,0,1,0}, 0);
                this.map[4][2] = new Square(new int[]{4,2}, new int[]{1,1,0,0}, 3);
                this.map[5][2] = new Square(new int[]{5,2}, new int[]{1,0,0,1}, 0);
                this.map[6][2] = new Square(new int[]{6,2}, new int[]{0,0,1,0}, 1);
                this.map[0][3] = new Square(new int[]{0,3}, new int[]{0,0,0,0}, 0);
                this.map[1][3] = new Square(new int[]{1,3}, new int[]{1,0,1,0}, 0);
                this.map[2][3] = new Square(new int[]{2,3}, new int[]{1,0,1,0}, 0);
                this.map[3][3] = new Square(new int[]{3,3}, new int[]{0,0,0,0}, 0);
                this.map[4][3] = new Square(new int[]{4,3}, new int[]{1,0,1,0}, 0);
                this.map[5][3] = new Square(new int[]{5,3}, new int[]{1,0,1,0}, 0);
                this.map[6][3] = new Square(new int[]{6,3}, new int[]{0,0,0,0}, 0);
                this.map[0][4] = new Square(new int[]{0,4}, new int[]{1,0,0,0}, 1);
                this.map[1][4] = new Square(new int[]{1,4}, new int[]{0,1,1,0}, 0);
                this.map[2][4] = new Square(new int[]{2,4}, new int[]{0,0,1,1}, 3);
                this.map[3][4] = new Square(new int[]{3,4}, new int[]{1,0,1,0}, 0);
                this.map[4][4] = new Square(new int[]{4,4}, new int[]{1,0,0,1}, 3);
                this.map[5][4] = new Square(new int[]{5,4}, new int[]{1,1,0,0}, 0);
                this.map[6][4] = new Square(new int[]{6,4}, new int[]{0,0,1,0}, 1);
                this.map[0][5] = new Square(new int[]{0,5}, new int[]{0,0,0,0}, 0);
                this.map[1][5] = new Square(new int[]{1,5}, new int[]{1,1,0,0}, 0);
                this.map[2][5] = new Square(new int[]{2,5}, new int[]{1,0,0,1}, 0);
                this.map[3][5] = new Square(new int[]{3,5}, new int[]{0,1,0,1}, 0);
                this.map[4][5] = new Square(new int[]{4,5}, new int[]{0,0,1,1}, 0);
                this.map[5][5] = new Square(new int[]{5,5}, new int[]{0,1,1,0}, 0);
                this.map[6][5] = new Square(new int[]{6,5}, new int[]{0,0,0,0}, 0);
                this.map[0][6] = new Square(new int[]{0,6}, new int[]{1,1,0,0}, 0);
                this.map[1][6] = new Square(new int[]{1,6}, new int[]{0,0,0,0}, 0);
                this.map[2][6] = new Square(new int[]{2,6}, new int[]{0,1,0,0}, 1);
                this.map[3][6] = new Square(new int[]{3,6}, new int[]{0,0,0,0}, 0);
                this.map[4][6] = new Square(new int[]{4,6}, new int[]{0,1,0,0}, 1);
                this.map[5][6] = new Square(new int[]{5,6}, new int[]{0,0,0,0}, 0);
                this.map[6][6] = new Square(new int[]{6,6}, new int[]{0,1,1,0}, 1);
                this.map[0][0].setHasTreasure(true);
                this.map[6][6].setHasTreasure(true);
                this.numTreasure = 2;
                break;
            case -1:
                this.start = new int[][] {{4,0},{0,4},{2,2}};
                this.goal = new int[][] {{0,4},{4,0}};
                this.map = new Square[5][5];
                this.map[0][0] = new Square(new int[]{0,0}, new int[]{1,0,0,1}, 1);
                this.map[1][0] = new Square(new int[]{1,0}, new int[]{0,0,0,0}, 0);
                this.map[2][0] = new Square(new int[]{2,0}, new int[]{0,0,0,1}, 1);
                this.map[3][0] = new Square(new int[]{3,0}, new int[]{0,0,0,0}, 0);
                this.map[4][0] = new Square(new int[]{4,0}, new int[]{0,0,0,0}, 1);
                this.map[0][1] = new Square(new int[]{0,1}, new int[]{0,0,0,0}, 0);
                this.map[1][1] = new Square(new int[]{1,1}, new int[]{1,0,0,1}, 0);
                this.map[2][1] = new Square(new int[]{2,1}, new int[]{1,0,0,0}, 0);
                this.map[3][1] = new Square(new int[]{3,1}, new int[]{0,0,0,1}, 0);
                this.map[4][1] = new Square(new int[]{4,1}, new int[]{0,0,1,0}, 0);
                this.map[0][2] = new Square(new int[]{0,2}, new int[]{1,0,0,0}, 1);
                this.map[1][2] = new Square(new int[]{1,2}, new int[]{0,0,1,0}, 0);
                this.map[2][2] = new Square(new int[]{2,2}, new int[]{0,0,0,0}, 3);
                this.map[3][2] = new Square(new int[]{3,2}, new int[]{0,0,0,0}, 0);
                this.map[4][2] = new Square(new int[]{4,2}, new int[]{0,0,0,0}, 3);
                this.map[0][3] = new Square(new int[]{0,3}, new int[]{0,0,0,0}, 0);
                this.map[1][3] = new Square(new int[]{1,3}, new int[]{0,0,1,0}, 0);
                this.map[2][3] = new Square(new int[]{2,3}, new int[]{0,0,0,0}, 0);
                this.map[3][3] = new Square(new int[]{3,3}, new int[]{0,0,0,0}, 0);
                this.map[4][3] = new Square(new int[]{4,3}, new int[]{0,0,0,0}, 0);
                this.map[0][4] = new Square(new int[]{0,4}, new int[]{1,0,0,0}, 1);
                this.map[1][4] = new Square(new int[]{1,4}, new int[]{0,0,1,0}, 0);
                this.map[2][4] = new Square(new int[]{2,4}, new int[]{0,0,0,0}, 3);
                this.map[3][4] = new Square(new int[]{3,4}, new int[]{0,0,0,0}, 0);
                this.map[4][4] = new Square(new int[]{4,4}, new int[]{0,0,0,0}, 3);
                break;
            case 2:
                this.start = new int[][] {{6,0},{0,6},{3,3}};
                this.goal = new int[][] {{0,6},{6,0}};
                this.map = new Square[7][7];
                this.map[0][0] = new Square(new int[]{0,0}, new int[]{1,0,0,1}, 1);
                this.map[1][0] = new Square(new int[]{1,0}, new int[]{0,0,0,0}, 0);
                this.map[2][0] = new Square(new int[]{2,0}, new int[]{0,0,0,1}, 1);
                this.map[3][0] = new Square(new int[]{3,0}, new int[]{0,0,0,0}, 0);
                this.map[4][0] = new Square(new int[]{4,0}, new int[]{0,0,0,1}, 1);
                this.map[5][0] = new Square(new int[]{5,0}, new int[]{0,0,0,0}, 0);
                this.map[6][0] = new Square(new int[]{6,0}, new int[]{0,0,1,1}, 0);
                this.map[0][1] = new Square(new int[]{0,1}, new int[]{0,0,0,0}, 0);
                this.map[1][1] = new Square(new int[]{1,1}, new int[]{1,0,0,1}, 0);
                this.map[2][1] = new Square(new int[]{2,1}, new int[]{0,0,0,0}, 0);
                this.map[3][1] = new Square(new int[]{3,1}, new int[]{0,0,0,1}, 0);
                this.map[4][1] = new Square(new int[]{4,1}, new int[]{0,0,0,0}, 0);
                this.map[5][1] = new Square(new int[]{5,1}, new int[]{0,0,1,1}, 0);
                this.map[6][1] = new Square(new int[]{6,1}, new int[]{0,0,0,0}, 0);
                this.map[0][2] = new Square(new int[]{0,2}, new int[]{1,0,0,0}, 1);
                this.map[1][2] = new Square(new int[]{1,2}, new int[]{0,0,0,0}, 0);
                this.map[2][2] = new Square(new int[]{2,2}, new int[]{1,0,0,1}, 3);
                this.map[3][2] = new Square(new int[]{3,2}, new int[]{0,0,0,0}, 0);
                this.map[4][2] = new Square(new int[]{4,2}, new int[]{0,0,1,1}, 3);
                this.map[5][2] = new Square(new int[]{5,2}, new int[]{0,0,0,0}, 0);
                this.map[6][2] = new Square(new int[]{6,2}, new int[]{0,0,1,0}, 1);
                this.map[0][3] = new Square(new int[]{0,3}, new int[]{0,0,0,0}, 0);
                this.map[1][3] = new Square(new int[]{1,3}, new int[]{1,0,0,0}, 0);
                this.map[2][3] = new Square(new int[]{2,3}, new int[]{0,0,0,0}, 0);
                this.map[3][3] = new Square(new int[]{3,3}, new int[]{0,0,0,0}, 0);
                this.map[4][3] = new Square(new int[]{4,3}, new int[]{0,0,0,0}, 0);
                this.map[5][3] = new Square(new int[]{5,3}, new int[]{0,0,1,0}, 0);
                this.map[6][3] = new Square(new int[]{6,3}, new int[]{0,0,0,0}, 0);
                this.map[0][4] = new Square(new int[]{0,4}, new int[]{1,0,0,0}, 1);
                this.map[1][4] = new Square(new int[]{1,4}, new int[]{0,0,0,0}, 0);
                this.map[2][4] = new Square(new int[]{2,4}, new int[]{1,1,0,0}, 3);
                this.map[3][4] = new Square(new int[]{3,4}, new int[]{0,0,0,0}, 0);
                this.map[4][4] = new Square(new int[]{4,4}, new int[]{0,1,1,0}, 3);
                this.map[5][4] = new Square(new int[]{5,4}, new int[]{0,0,0,0}, 0);
                this.map[6][4] = new Square(new int[]{6,4}, new int[]{0,0,1,0}, 1);
                this.map[0][5] = new Square(new int[]{0,5}, new int[]{0,0,0,0}, 0);
                this.map[1][5] = new Square(new int[]{1,5}, new int[]{1,1,0,0}, 0);
                this.map[2][5] = new Square(new int[]{2,5}, new int[]{0,0,0,0}, 0);
                this.map[3][5] = new Square(new int[]{3,5}, new int[]{0,1,0,0}, 0);
                this.map[4][5] = new Square(new int[]{4,5}, new int[]{0,0,0,0}, 0);
                this.map[5][5] = new Square(new int[]{5,5}, new int[]{0,1,1,0}, 0);
                this.map[6][5] = new Square(new int[]{6,5}, new int[]{0,0,0,0}, 0);
                this.map[0][6] = new Square(new int[]{0,6}, new int[]{1,1,0,0}, 0);
                this.map[1][6] = new Square(new int[]{1,6}, new int[]{0,0,0,0}, 0);
                this.map[2][6] = new Square(new int[]{2,6}, new int[]{0,1,0,0}, 1);
                this.map[3][6] = new Square(new int[]{3,6}, new int[]{0,0,0,0}, 0);
                this.map[4][6] = new Square(new int[]{4,6}, new int[]{0,1,0,0}, 1);
                this.map[5][6] = new Square(new int[]{5,6}, new int[]{0,0,0,0}, 0);
                this.map[6][6] = new Square(new int[]{6,6}, new int[]{0,1,1,0}, 1);
                this.map[0][0].setHasTreasure(true);
                this.map[3][3].setHasTreasure(true);
                this.map[6][6].setHasTreasure(true);
                this.numTreasure = 3;
                break;
            default:
                this.map = new Square[0][0];
                this.start = new int[0][0];
                this.goal = new int[0][0];
                break;
        }
    }
    
    public int[] getStart(int n){
        return this.start[n-1];
    }
    
    public int[] getGoal(int n){
        return this.start[n-1];
    }
    
    public Square[][] getMap(){
        return this.map;
    }
    
    public int getNumTreasure(){
        return this.numTreasure;
    }
}