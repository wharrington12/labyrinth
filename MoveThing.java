package labyrinthgame;

public class MoveThing {
    
    protected int[] position;
    public int[] goal = new int[2];
    protected int[] colour;
    protected char character;
    protected boolean alive;
    protected boolean won;
    String owner = "DEFAULT";
    
    public MoveThing(){
        this.position = new int[2];
        this.colour = new int[] {0,0,0};
        this.character = ' ';
        this.alive = true;
        this.won = false;
    }
    
    public MoveThing(int x, int y, int[] c) {
	this.position = new int[2];
	this.position[0] = x;
	this.position[1] = y;
	this.colour = c;
	this.alive = true;
	this.won = false;
    }
    
    //Should be overridden in all children
    public void move(){}
    
    public void setMousePos(int[] pos) {
    	
    }
    
    public boolean getIsAlive(){
        return this.alive;
    }
    
    public boolean getWon(){
        return this.won;
    }
    
    public int[] getPosition(){
        return this.position;
    }
    
    public char getChar(){
        return this.character;
    }
    
    public int[] getColour(){
        return this.colour;
    }
    
    public void setPosition(int[] pos){
        this.position = pos;
    }
    
    public void setChar(char c){
        this.character = c;
    }
    
    public void setColour(int[] col){
        this.colour = col;
    }

    public void setAlive(boolean b) {
	this.alive = b;
    }
    
    public void setPlayers(MoveThing[] p){}
    public void setGameState(GameState g){}
    public boolean didKill(MoveThing m) {
	return false;
    }
       
}