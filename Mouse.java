package labyrinthgame;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JComponent;

public class Mouse extends JComponent implements MouseListener{

	public int[] position = new int[2];
	public boolean clicked = false;
	@Override
	public void mouseClicked(MouseEvent e) {
		this.position[0] = e.getXOnScreen();
		this.position[1] = e.getYOnScreen();

		this.clicked = true;
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	
}
