package labyrinthgame;

public class Npc extends MoveThing{
    
    private MoveThing[] players;
    private GameState game;
    
    public Npc(){
        super();
	this.players = new MoveThing[2];
    }
    
    //Needs to be changed
    @Override
    public void move() {
	int index_closest = 0;
	int smallest_dist = 99999999;
	for(int i = 0; i < this.players.length; i++) {
		if(players[i].getIsAlive()) {
	    int dist_x = Math.abs(this.players[i].position[0] - this.position[0]);
	    int dist_y = Math.abs(this.players[i].position[1] - this.position[1]);
	    int dist = dist_x + dist_y;
	    if(dist < smallest_dist) {
		smallest_dist = dist;
		index_closest = i;
	    }
		}
	}
	int closest_dim = 0;
	int x_dist = this.position[0] - this.players[index_closest].position[0];
	int y_dist = this.position[1] - this.players[index_closest].position[1];
	if(Math.abs(y_dist) < Math.abs(x_dist) && y_dist != 0) {
	    closest_dim = 1;
	}
	else if(Math.abs(x_dist) < Math.abs(y_dist) && x_dist != 0) {
	    closest_dim = 0;
	}
	else if(x_dist == 0) {
	    closest_dim = 1;
	}
	else if(y_dist == 0) {
	    closest_dim = 0;
	}

        int new_x = this.position[0]; 
	int new_y = this.position[1];
	
	if(closest_dim == 0) {
		if(x_dist == 0) {
			new_x = this.position[0];
		}
		else {
			new_x = this.position[0] - x_dist/Math.abs(x_dist);
		}
	}
	else if(closest_dim == 1) {
		if(y_dist == 0) {
			new_y = this.position[1];
		}
		else {
			new_y = this.position[1] - y_dist/Math.abs(y_dist);
		}
	}

	Square dest = this.game.map[new_x][new_y];
	
	if(this.isValidMove(dest)) {
	    this.position[0] = new_x;
	    this.position[1] = new_y;
	}

	boolean has_won = true;
	for(int i = 0; i < this.players.length; i++) {
	    if(this.players[i].getIsAlive()) {
		has_won = false;
	    }
	}

	if(has_won) {
	    this.won = true;
	    System.out.println("Arrgh I won");
	}
	
    }

    private boolean isValidMove(Square s) {

	boolean valid = false;

	Square c = this.game.map[this.position[0]][this.position[1]];

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
            if(s.getWalls()[1] == 0 && c.getWalls()[3] == 0) {
                valid = true;
            }
        }
        else if(this.position[0] == s.position[0] && this.position[1] > s.position[1]) {
            if(s.getWalls()[3] == 0 && c.getWalls()[1] == 0) {
                valid = true;
            }
        }
	
	

        return valid;
    }
    @Override
    public boolean didKill(MoveThing m) {
	 if(this.position[0] == m.position[0] && this.position[1] == m.position[1]) {
	     return true;
	 }
	 return false;
    }

    @Override
    public void setPlayers(MoveThing[] p) {
	this.players = p;
    }

    @Override
    public void setGameState(GameState g) {
	this.game = g;
    }
}
