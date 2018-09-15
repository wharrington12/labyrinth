import java.awt.Color;
import java.awt.Graphics;

import javax.swing.JFrame;

public class Maze extends JFrame{
	int[][] square = new int[7][7];
	public Maze() {
	
	
	//to  Set JFrame title
	 super("Labyrinth");

	 //Set default close operation for JFrame
	 setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	 //Set JFrame size
	 setSize(700,700);

	 //Make JFrame visible
	 setVisible(true);
	}
	
	

	public void paint(Graphics g)
	{
	 super.paint(g);

	 //draw rectangle outline
	 g.drawRect(0,0,300,150);

	 //set color to Green
	 g.setColor(Color.GREEN);

	 //fill rectangle with GREEN color
	 //g.fillRect(50,50,300,100);
	}
	
	public void drawWalls() {
		
		
	}

}