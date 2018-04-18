//package labyrinthgame;

import java.awt.Color;
import java.awt.Component;
import java.awt.Container;
import java.awt.Graphics;
import java.awt.event.MouseListener;
import java.util.concurrent.TimeUnit;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

public class Main extends JFrame{

    private static final long serialVersionUID = 123456789;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws InterruptedException {
        Level lev = new Level(2);
        Square[][] map = lev.getMap();
        
        GameState gs = new GameState();
        
        Mouse mouseUser = new Mouse();
        gs.addMouseListener((MouseListener) mouseUser);
        
        //gs.repaint();
        
        gs.setMap(lev.getMap());
        gs.setGameMode("Normal");
        gs.setNumTreasure(lev.getNumTreasure());
        
        Player player1 = new Player();
        Player player2 = new Player();
        Npc minotaur = new Npc();

        player1.setPosition(lev.getStart(1));
        player2.setPosition(lev.getStart(2));
        minotaur.setPosition(lev.getStart(3));
      
        player1.setGoal(lev.getGoal(2));
        player2.setGoal(lev.getGoal(1));
      
        player1.setChar('A');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
        player2.setChar('B');
        minotaur.setChar('M');
      
        player1.owner = "Cyan";
        player2.owner = "Purple";
        minotaur.owner = "Minotaur";
      
        MoveThing[] m = new MoveThing[3];
        m[0] = player1;
        m[1] = player2;
        m[2] = minotaur;
        gs.setCharacters(m);

        gs.repaint();
     
        while (!gs.characters[0].getWon()&&!gs.characters[1].getWon()&&!gs.characters[2].getWon()){ 
            boolean keep_going = true;
            int[] pos = new int[2];
        	if(gs.characters[0].getIsAlive()) {
                    while(keep_going) {
        		try {
                            pos = new int[2];
                            mouseUser.clicked = false;
                            while(!mouseUser.clicked) {
        			System.out.print("");
                            }
                            mouseUser.clicked = false;
                            pos = mouseUser.position;
                            gs = takeTurn(0, gs, pos);
                            keep_going = false;
        		} catch(InvalidMoveException e) {}
                    }
        	}
        	keep_going = true;
        	if(gs.characters[0].getWon() ) {
                    gs.repaint();
                    JLabel winner = new JLabel("");
                    if(gs.getGameMode().equals("Normal")){
                        winner = new JLabel(gs.characters[0].owner + " is the Champion!", SwingConstants.CENTER);
                    }if(gs.getGameMode().equals("Collab")){
                        winner = new JLabel("Players have won!", SwingConstants.CENTER);
                    }
                    Container contentPane = gs.getContentPane();
                    contentPane.add(winner);
                    gs.setVisible(true);
                    //gs.repaint();
        	}
            if(gs.characters[1].getIsAlive()) {
                while(keep_going) {
                    try {
                        pos = new int[2];
                        mouseUser.clicked = false;
                        while(!mouseUser.clicked) {
                            System.out.print("");
                        }
                        mouseUser.clicked = false;
                        pos = mouseUser.position;
                        gs = takeTurn(1, gs, pos);
                        keep_going = false;
                    } catch(InvalidMoveException e) {}
                }	
            }
            if(gs.characters[1].getWon()) {
                gs.repaint();
            	JLabel winner = new JLabel(gs.characters[1].owner + " is the Champion!", SwingConstants.CENTER);
            	Container contentPane = gs.getContentPane();
            	contentPane.add(winner);
            	gs.setVisible(true);
            	//gs.repaint();
            }
            TimeUnit.MILLISECONDS.sleep(500);
            gs = takeTurn(2, gs, pos);
            TimeUnit.MILLISECONDS.sleep(500);
            gs = takeTurn(2, gs, pos);
            TimeUnit.MILLISECONDS.sleep(500);
            gs.setMap(move(gs.getMap()));
            gs.repaint();
            if(gs.characters[2].getWon()) {
                gs.repaint();
            	JLabel winner = new JLabel(gs.characters[2].owner + " is the Champion!", SwingConstants.CENTER);
            	Container contentPane = gs.getContentPane();
            	contentPane.add(winner);
            	gs.setVisible(true);
            	//gs.repaint();
            }
        }
    }
    
    public static Square[][] move(Square[][] map){
        for (int i=0; i<map.length; i++){
            for (int j=0; j<map[0].length; j++){
                map[i][j].move();
            }
        }
        return map;
    }
    
    public static GameState takeTurn(int mover, GameState gs, int[] pos){
        if (mover==2){
   
            MoveThing[] players = new MoveThing[2];
            for(int i = 0; i < gs.characters.length - 1; i++) {
                players[i] = gs.characters[i];
            }
            gs.characters[mover].setPlayers(players);
            gs.characters[mover].setGameState(gs);
        }
	if (mover != 2) {
	
	    MoveThing[] players = new MoveThing[2];
	    int diff = 0;

	    for(int i = 0; i < gs.characters.length; i++) {
		if(i != mover) {
		    players[i-diff] = gs.characters[i];
		}
		else {
		    diff++;
		}
	    }
	    gs.characters[mover].setPlayers(players);
	    gs.characters[mover].setGameState(gs);
	    gs.characters[mover].setMousePos(pos);
	}

        if (gs.getMoveThings()[mover].getIsAlive()){

                gs.characters[mover].move();
               
         }
	if(mover == 2) {
	    for(int i = 0; i < gs.characters.length - 1; i++) {
		if(gs.characters[mover].didKill(gs.characters[i])) {
		   gs.characters[i].setAlive(false);
		}
	    }
	}
        gs.repaint();
        if (gs.getMoveThings()[mover].getWon()){
            return gs;
        }
        return gs;
    }
}
