package labyrinthgame;

import java.awt.Color;
import java.awt.Component;
import java.awt.Container;
import java.awt.Graphics;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class GameState extends JFrame{
    public Square[][] map;
    public MoveThing[] characters;
    

    public GameState() {
   	 super("Labyrinth");

   	 //Set default close operation for JFrame
   	 setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   	 

   	 //Set JFrame size
   	 setSize(740, 760);

   	 //Make JFrame visible
   	 setVisible(true);
    }
    
    
    public Square[][] getMap(){
        return map;
    }
    
   public void setMap(Square[][] m){
        map = m;
    }
   
   	public void setCharacters(MoveThing[] m) {
   		this.characters = m;
   	}
   	
    
    public MoveThing[] getMoveThings(){
        return characters;
    }
    
    
    
    public void paint(Graphics g) {
	 	super.paint(g);
	 
	  
	 for (int i=0; i < this.map.length; i++){
            for (int j=0; j< this.map[0].length; j++){
                int[] walls = this.map[i][j].getWalls();
                if (walls[0] == 1) {
                    g.fillRect(j*100 + 20,i*100 + 40, 98, 9);
                }
            
                if (walls[1] == 1) {
                    g.fillRect(j*100 + 110 ,i*100 + 40, 9, 98);
                }
            
                if (walls[2] == 1) {
                    g.fillRect(j*100 + 20,i*100 + 130, 98, 9);
                }
            
                if (walls[3] == 1) {
                    g.fillRect(j*100 + 20,i*100 + 40, 9, 98);
                }
            }
	 }
	 
	 Color[] colors;
	 colors = new Color[3];
	 colors[0] = Color.cyan;
	 colors[1] = Color.MAGENTA;
	 colors[2] = Color.red;
	 
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
}