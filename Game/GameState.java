public Square[][] map;
    public MoveThing[] characters;
    public int numTreasure;
    public String gameMode;
    /*
    //Constructor I think
    public GameState(){
      PApplet.runSketch(new String[]{"GameState"}, this);
    }*/
    
    public void settings() {
      size (740, 760);
    }
    
    public void setup() {
      background(255);
    }
    
    public void draw() {
      
      fill(0);
      
      //Draws anything inherent to the spaces
      for (int i=0; i < this.map.length; i++){
            for (int j=0; j< this.map[0].length; j++){
              //Draws the walls
                int[] walls = this.map[i][j].getWalls();
                if (walls[0] == 1) {
                    rect(j*100 + 21,i*100 + 41, 98, 9);
                }
                if (walls[1] == 1) {
                    rect(j*100 + 111 ,i*100 + 41, 9, 98);
                }
                if (walls[2] == 1) {
                    rect(j*100 + 21,i*100 + 130, 98, 9);
                }
                if (walls[3] == 1) {
                    rect(j*100 + 21,i*100 + 41, 9, 98);
                }
                //Draws the treasure for coop
                if (this.map[i][j].getHasTreasure()&&this.gameMode.equals("Collab")){
                   fill(255,255,0);
                   ellipse(100*j + 40, 100*i + 60, 50, 50);
                   fill(0);
                }
            }
      }
      
      //Sets colors for the characters
      //REPLACE with color property for the characters
      int[][] colors;
        colors = new int[3][3];
        
        //Cyan
        colors[0][0] = 0;
        colors[0][1] = 255;
        colors[0][2] = 255;
        
        //Magenta
        colors[1][0] = 255;
        colors[1][1] = 0;
        colors[1][2] = 255;
        
        //Red
        colors[2][0] = 255;
        colors[2][1] = 0;
        colors[2][2] = 0;
            
        for(int i = 0; i < this.characters.length; i++) {
                
          if(i != 2) {
            fill(colors[i][0], colors[i][1], colors[i][2]);
            rect(100*characters[i].goal[1] + 30, 100*characters[i].goal[0] + 50, 80, 80);
          }
        }
        
        for (int i=0; i< this.characters.length; i++){
        int[] pos = characters[i].getPosition();
        if(!characters[i].getIsAlive()) {
         
        }
        else {
          fill(colors[i][0], colors[i][1], colors[i][2]);
          ellipse(100*pos[1] + 40, 100*pos[0] + 60, 50, 50);
        }
     }
      
      //Up to here
    }
    
    /*
    public void paint(Graphics g) {
     super.paint(g);
   
    
   
   
   
   
   
    } */
    
    public Square[][] getMap(){
        return map;
    }
    
   public void setMap(Square[][] m){
        map = m;
    }
   
    public void setCharacters(MoveThing[] m) {
     this.characters = m;
    }
    
    public void setNumTreasure(int n){
        this.numTreasure = n;
    }
    
    public void decreaseNumTreasure(){
        this.numTreasure--;
    }
    
    public void setGameMode(String s){
        gameMode = s;
    }
    
    public MoveThing[] getMoveThings(){
        return characters;
    }
    
    public int getNumTreasure(){
        return this.numTreasure;
    }
    
    public String getGameMode(){
        return this.gameMode;
    }
    
    
