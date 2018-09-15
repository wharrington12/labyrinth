
    private static final long serialVersionUID = 123456789;

    /**
     * @param args the command line arguments
     */
     
void settings() {
  size (700, 700);
}
    
void setup() {
  background(255);
}
   
   void draw() {
        Level lev = new Level(2);
        Square[][] map = lev.getMap();
        
        GameState gs = new GameState();

        //drawGs(gs);
        
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

        drawGs(gs);
     
    /*    while (!gs.characters[0].getWon()&&!gs.characters[1].getWon()&&!gs.characters[2].getWon()){ 
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
                    drawGs(gs);
                    JLabel winner = new JLabel("");
                    if(gs.getGameMode().equals("Normal")){
                        winner = new JLabel(gs.characters[0].owner + " is the Champion!", SwingConstants.CENTER);
                    }if(gs.getGameMode().equals("Collab")){
                        winner = new JLabel("Players have won!", SwingConstants.CENTER);
                    }
                    Container contentPane = gs.getContentPane();
                    contentPane.add(winner);
                    gs.setVisible(true);
                    //drawGs(gs);
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
                drawGs(gs);
              JLabel winner = new JLabel(gs.characters[1].owner + " is the Champion!", SwingConstants.CENTER);
              Container contentPane = gs.getContentPane();
              contentPane.add(winner);
              gs.setVisible(true);
              //drawGs(gs);
            }
            TimeUnit.MILLISECONDS.sleep(500);
            gs = takeTurn(2, gs, pos);
            TimeUnit.MILLISECONDS.sleep(500);
            gs = takeTurn(2, gs, pos);
            TimeUnit.MILLISECONDS.sleep(500);
            gs.setMap(move(gs.getMap()));
            drawGs(gs);
            if(gs.characters[2].getWon()) {
                drawGs(gs);
              JLabel winner = new JLabel(gs.characters[2].owner + " is the Champion!", SwingConstants.CENTER);
              Container contentPane = gs.getContentPane();
              contentPane.add(winner);
              gs.setVisible(true);
              //drawGs(gs);
            }
        }*/
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
        //drawGs(gs);
        if (gs.getMoveThings()[mover].getWon()){
            return gs;
        }
        return gs;
    }
    
    void drawGs(GameState gs){
     
      fill(0);
      
      //Draws anything inherent to the spaces
      for (int i=0; i < gs.gMap.length; i++){
        for (int j=0; j< gs.gMap[0].length; j++){
          //Draws the walls
          int[] walls = gs.gMap[i][j].getWalls();
          if (walls[0] == 1) {
            rect(j*100 + 0, i*100 + 0, 98, 9);
          }
          if (walls[1] == 1) {
            rect(j*100 + 90 ,i*100 + 0, 9, 98);
          }
          if (walls[2] == 1) {
            rect(j*100 + 0,i*100 + 90, 98, 9);
          }
          if (walls[3] == 1) {
            rect(j*100 + 0,i*100 + 0, 9, 98);
          }
          //Draws the treasure for coop
          if (gs.gMap[i][j].getHasTreasure()&&gs.gameMode.equals("Collab")){
            fill(255,255,0);
            ellipse(100*j + 40, 100*i + 40, 50, 50);
            fill(0);
          }
        }
      }
      
      //Sets colors for the characters
      //REPLACE with color property for the characters
      int[][] colors;
      colors = new int[3][3];
        
      //Cyan
      colors[0][0] = 0;
      colors[0][1] = 255;
      colors[0][2] = 255;
        
      //Magenta
      colors[1][0] = 255;
      colors[1][1] = 0;
      colors[1][2] = 255;
        
      //Red
      colors[2][0] = 255;
      colors[2][1] = 0;
      colors[2][2] = 0;
            
      for(int i = 0; i < gs.characters.length; i++) {
                
        if(i != 2) {
          fill(colors[i][0], colors[i][1], colors[i][2]);
          rect(100*gs.characters[i].goal[1] + 10, 100*gs.characters[i].goal[0] + 10, 80, 80);
        }
      }
        
      for (int i=0; i< gs.characters.length; i++){
        int[] pos = gs.characters[i].getPosition();
        if(!gs.characters[i].getIsAlive()) {}
        else {
          fill(colors[i][0], colors[i][1], colors[i][2]);
          ellipse(100*pos[1] + 50, 100*pos[0] + 50, 50, 50);
        }
      }
    }
