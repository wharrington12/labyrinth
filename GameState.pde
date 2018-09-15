public Square[][] map;
    public MoveThing[] characters;
    public int numTreasure;
    public String gameMode;
    
    
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
    
    
    public void paint(Graphics g) {
     super.paint(g);
   
    
   for (int i=0; i < this.map.length; i++){
            for (int j=0; j< this.map[0].length; j++){
                int[] walls = this.map[i][j].getWalls();
                if (walls[0] == 1) {
                    g.fillRect(j*100 + 21,i*100 + 41, 98, 9);
                }
            
                if (walls[1] == 1) {
                    g.fillRect(j*100 + 111 ,i*100 + 41, 9, 98);
                }
            
                if (walls[2] == 1) {
                    g.fillRect(j*100 + 21,i*100 + 130, 98, 9);
                }
            
                if (walls[3] == 1) {
                    g.fillRect(j*100 + 21,i*100 + 41, 9, 98);
                }
                if (this.map[i][j].getHasTreasure()&&this.gameMode.equals("Collab")){
                    g.setColor(Color.yellow);
                    g.fillOval(100*j + 40, 100*i + 60, 50, 50);
                    g.setColor(Color.black);
                }
            }
   }
   
   Color[] colors;
   colors = new Color[3];
   colors[0] = Color.cyan;
   colors[1] = Color.MAGENTA;
   colors[2] = Color.red;
         
         for(int i = 0; i < this.characters.length; i++) {
             
             if(i != 2) {
                 g.setColor(colors[i]);
                 g.fillRect(100*characters[i].goal[1] + 30, 100*characters[i].goal[0] + 50, 80, 80);
             }
         }
   
   for (int i=0; i< this.characters.length; i++){
     int[] pos = characters[i].getPosition();
     if(!characters[i].getIsAlive()) {
      
     }
     else {
       g.setColor(colors[i]);
       g.fillOval(100*pos[1] + 40, 100*pos[0] + 60, 50, 50);
     }
  }
    } 