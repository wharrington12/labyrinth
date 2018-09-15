public class Player extends MoveThing{
    
    //private int[] goal;
    //private int[] mp = new int[2];
    private MoveThing[] players;
    private GameState game;
    private int maxX;
    private int maxY;
    
    public Player(){
        super();
        this.goal = new int[2];
    }
    
    //Obviously needs to be changed
    @Override
    public void move(String s) throws InvalidMoveException {
      this.maxX = this.game.gMap[0].length - 1;
      this.maxY = this.game.gMap.length - 1;
      Square dest = this.getDestination(s);
      boolean valid = this.isValidMove(dest);
      if(!valid) {
          throw new InvalidMoveException(); 
      }

  this.position = dest.position;
        if (dest.getHasTreasure()){
            dest.setHasTreasure(false);
            game.decreaseNumTreasure();
        }
  if(game.getGameMode().equals("Normal")&&(this.position[0] == this.goal[0] && this.position[1] == this.goal[1])) {
      this.won = true;
      System.out.println("Yay i won");
  }
        if(game.getGameMode().equals("Collab")&&(this.position[0] == this.goal[0] && this.position[1] == this.goal[1])&&game.getNumTreasure()==0) {
      this.won = true;
      System.out.println("Yay we won");
  }
    }
    
    /*public void setDirection(String dir) {
        this.mp[0] = pos[0];
        this.mp[1] = pos[1];
    }*/
    
    /*private int[] convertCoord(int[] x)   {
        int[] new_c = new int[2];
        new_c[0] = (x[1]-40)/100;
        new_c[1] = (x[0])/100;
    return new_c;
      
    }*/

    private Square getDestination(String dir) {
        int ind = 0;
        int change = 0;
        if(dir.equals("up")) {
            ind = 0;
            change = -1;
        } else if(dir.equals("down")) {
            ind = 0;
            change = 1;
        } else if(dir.equals("left")) {
            ind = 1;
            change = -1;
        } else if(dir.equals("right")) {
            ind = 1;
            change = 1;
        }
        if (this.position[ind] + change < 0) {
            throw new InvalidMoveException();
        }
        if (ind == 0 && this.position[ind] + change > maxX) {
           throw new InvalidMoveException(); 
        }
        if (ind == 1 && this.position[ind] + change > maxY) {
           throw new InvalidMoveException(); 
        }
        
        int[] tempPos = {0, 0};
        tempPos[ind] = position[ind] + change;
        tempPos[1-ind] = position[1-ind];
      
        Square s = this.game.gMap[tempPos[0]][tempPos[1]];

        return s;
    }
    
    private boolean isValidMove(Square s) {

        boolean valid = false;

        Square c = this.game.gMap[this.position[0]][this.position[1]];

        if(this.position[0] < s.position[0] && this.position[1] == s.position[1]) {
            if(s.getWalls()[0] == 0 && c.getWalls()[2] == 0) {
                valid = true;
            }
  }
        else if(this.position[0] > s.position[0] && this.position[1] == s.position[1]) {
            if(s.getWalls()[2] == 0 && c.getWalls()[0] == 0) {
                valid = true;
            }
        }
        else if(this.position[0] == s.position[0] && this.position[1] < s.position[1]) {
            if(s.getWalls()[3] == 0 && c.getWalls()[1] == 0) {
                valid = true;
            }
        }
        else if(this.position[0] == s.position[0] && this.position[1] > s.position[1]) {
            if(s.getWalls()[1] == 0 && c.getWalls()[3] == 0) {
                valid = true;
            }
        }
        else if(this.position[0] == s.position[0] && this.position[1] == this.position[1]) {
            valid = true;
        }

        for(int i = 0; i < this.players.length; i++) {
            if(s.position[0] == this.players[i].position[0] && s.position[1] == this.players[i].position[1]) {
                if(this.players[i].getIsAlive()) {
                    valid = false;
                }
            }
        }
        
        if(Math.abs(s.position[0] - c.position[0]) + Math.abs(s.position[1] - c.position[1]) > 1) {
            valid = false;
        }

        

        return valid;
    }

        
    
    public void setGoal(int[] g){
        this.goal = g;
    }

    @Override
    public void setPlayers(MoveThing[] m) {
  this.players = m;
    }

    @Override
    public void setGameState(GameState g) {
  this.game = g;
    }
}