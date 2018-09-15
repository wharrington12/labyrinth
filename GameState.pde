public class GameState{

    public Square[][] gMap;
    public MoveThing[] characters;
    public int numTreasure;
    public String gameMode;
    
    public GameState(){
      gMap = null;
      characters = null;
      numTreasure = 0;
      gameMode = "Normal";
    }
    
    public Square[][] getMap(){
        return gMap;
    }
    
   public void setMap(Square[][] m){
        gMap = m;
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

} 
