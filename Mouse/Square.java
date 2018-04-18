package labyrinthgame;

public class Square {
    
    int[] position;
    int[] walls;
    int specialValue;
    boolean locked;
    int[] colour;
    
    public Square() {
	this.position = new int[2];
	this.walls = new int[4];
	this.specialValue = 0;
    }
    
    public Square(int[] p, int[] w, int sV){
        this.position = p;
        this.walls = w;
        this.specialValue = sV;
        this.locked = false;
        this.colour = new int[] {255,255,255};
    }
    
    /** Rotates tile */
    public void move(){
        if (!this.locked){
            boolean spin = ((this.position[0]+this.position[1])%2==0);
            int[] walls2 = new int[4];
            if (spin){
              walls2[0] = this.walls[3];
              for (int i=1; i<4; i++){
                  walls2[i] = this.walls[i-1];
              }
        }else{
              walls2[3] = this.walls[0];
                for (int i=0; i<3; i++){
                   walls2[i] = this.walls[i+1];
               }
        }
        this.walls = walls2;
        }
    }
    
    public int[] getWalls(){
        return this.walls;
    }
    
    public int getSpecialValue(){
        return this.specialValue;
    }
    
    public boolean getLocked(){
        return this.locked;
    }
    
    public int[] getColour(){
        return this.colour;
    }
    
    public void setLocked(){
        this.locked = !this.locked;
    }
    
    public void setPosition(int[] p) {
	this.position = p;
    }

    public void setWalls(int[] w) {
	this.walls = w;
    }

    public void setSpecialValue(int i) {
	this.specialValue = i;
    }
    
    public void resetSpecialValue(){
        this.specialValue = 0;
    }
    
    public void setColour(int[] col){
        this.colour = col;
    }
    
}