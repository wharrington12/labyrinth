/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package labyrinthgame;

/**
 *
 * @author Stephen
 */
//public class LabyrinthGame {

    /**
     * @param args the command line arguments
     */
    //public static void main(String[] args) {
        // TODO code application logic here
       /* Level lev = new Level(1);
        Square[][] map = lev.getMap();
        Player player1 = new Player();
        Player player2 = new Player();
        Npc minotaur = new Npc();
        
        player1.setPosition(lev.getStart(1));
        player2.setPosition(lev.getStart(2));
        minotaur.setPosition(lev.getStart(3));
        
        player1.setGoal(lev.getGoal(1));
        player2.setGoal(lev.getGoal(2));
        
        player1.setChar('A');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
        player2.setChar('B');
        minotaur.setChar('M');
        
        player1.setColour(new int[] {255,0,0});
        player2.setColour(new int[]{0,0,255});
        minotaur.setColour(new int[] {0,0,0});
        
        MoveThing[] characters = {player1, player2, minotaur};
        GameState gs = new GameState(map, characters);
        
        draw(gs);
        
        int n = 0;  //Temporary
        
        while ((!player1.getWon()&&!player2.getWon())&&(n<2 && !minotaur.getWon())){   //n part is temporary
            
            //Refers to characters by their index in 'characters' in GameState
            
            gs = takeTurn(0, gs);
            if (player1.getWon()){
                break;
            }
            gs = takeTurn(1, gs);
            if (player2.getWon()){
                break;
            }
            gs = takeTurn(2, gs);
            gs = takeTurn(2, gs);
            gs.setMap(move(gs.getMap()));
            
            n++;        //Temporary
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
    
    public static GameState takeTurn(int mover, GameState gs){
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
	}

        boolean keep_going = true;
        while(keep_going) {
            if (gs.getMoveThings()[mover].getIsAlive()){
                try{
                    gs.characters[mover].move();
                    keep_going = false;
                }catch(InvalidMoveException e){}
            }
            else {
                keep_going = false;
            }
        }

	if(mover == 2) {
	    for(int i = 0; i < gs.characters.length - 1; i++) {
		if(gs.characters[mover].didKill(gs.characters[i])) {
		    gs.characters[i].setAlive(false);
		}
	    }
	}
        draw(gs);
        if (gs.getMoveThings()[mover].getWon()){
            return gs;
        }
        if (mover==0||mover==1){
            gs = setSquare(mover, gs);
        }
        return gs;
    }
    
    public static void draw(GameState gs){
        Square[][] map = gs.getMap();
        char[][] printout = new char[3*map.length][3*map[0].length];
        for (int i=0; i<map.length; i++){
            for (int j=0; j<map[0].length; j++){
                int[] walls = map[i][j].getWalls();
                int sV = map[i][j].getSpecialValue();
                printout[3*i][3*j] = ' ';
                printout[3*i+1][3*j] = (walls[0]==1)? '|' :' ';
                printout[3*i+2][3*j] = ' ';
                printout[3*i][3*j+1] = (walls[3]==1)?'-':' ';
                printout[3*i+1][3*j+1] = (sV!=0)?(char) (sV+48):' ';
                printout[3*i+2][3*j+1] = (walls[1]==1)?'-':' ';
                printout[3*i][3*j+2] = ' ';
                printout[3*i+1][3*j+2] = (walls[2]==1)? '|':' ';
                printout[3*i+2][3*j+2] = ' ';
            }
        }
        MoveThing[] characters = gs.getMoveThings();
        for (int i=0; i<characters.length; i++){
            int[] pos = characters[i].getPosition();
            printout[3*pos[0]+1][3*pos[1]+1] = characters[i].getChar();
        }
        for (int i=0; i<printout.length; i++){
            for (int j=0; j<printout[0].length; j++){
                System.out.print(printout[i][j]);
            }
            System.out.println();
        }
        System.out.println("___________________________");
    }
    
    public static GameState setSquare(int mover, GameState gs){
        int[] position = gs.characters[mover].position;
        Square s = gs.map[position[0]][ position[1]];
        int[] chosen;
        if (s.getSpecialValue() > 0) {
            for( int i = 0; i < s.getSpecialValue(); i++) {
                chosen = chooseSquare();
                gs.map[chosen[0]][chosen[1]].setLocked();
                gs.map[chosen[0]][chosen[1]].resetSpecialValue();
                gs.map[chosen[0]][chosen[1]].setColour(new int[]{128,128,128});
                draw(gs);
            }
            return gs;           
        }
        else { 
            return gs;
        }
    }
    
    //Needs input
    private static int[] chooseSquare (){
        return new int[] {0,0};
    }

}*/