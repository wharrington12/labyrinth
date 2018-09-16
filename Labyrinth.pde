Level lev = new Level(2);
Square[][] map = lev.getMap();
        
GameState gs = new GameState();
        
Player player1 = new Player();
Player player2 = new Player();
Npc minotaur = new Npc();
      
MoveThing[] m = new MoveThing[3];

PImage floor;
PImage gameOverText;
PImage[] flags;
PImage[] gameOver;

int mover = -1;
String direction = "";

boolean[] haveMoved = new boolean[3];
boolean  moveTiles = false;

boolean isOver = false;
     
void settings() {
  size (700, 700);
}
    
void setup() {
  background(255);
  gs.setMap(lev.getMap());
  gs.setGameMode("Normal");
  gs.setNumTreasure(lev.getNumTreasure());
  
  player1.setPosition(lev.getStart(1));
  player2.setPosition(lev.getStart(2));
  minotaur.setPosition(lev.getStart(3));
  player1.owner = "Cyan";
  player2.owner = "Purple";
  minotaur.owner = "Minotaur";
      
  player1.setGoal(lev.getGoal(2));
  player2.setGoal(lev.getGoal(1));
      
  player1.setChar('A');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  player2.setChar('B');
  minotaur.setChar('M');
  
  m[0] = player1;
  m[1] = player2;
  m[2] = minotaur;
  
  gs.setCharacters(m);
  
  for (int i=0; i<haveMoved.length; i++){
    haveMoved[i] = false;
  }
  flags = new PImage[2];
  floor = loadImage("pixil-frame-0 (1).png");
  gameOverText = loadImage("Game_Over.png");
  gameOverText.resize(700, 700);
  flags[0] = loadImage("cyan-flag.png");
  flags[1] = loadImage("magenta-flag.png");
  gameOver = new PImage[16];
  for (int i = 0; i < 16; i++) {
     gameOver[i] = loadImage("blood"+Integer.toString(i+1)+".png"); 
     gameOver[i].resize(700, 700);
  }
}
   int counter = 0;
   int winner = 3;
   void draw() {
        if (!isOver) {
          for (int i = 0; i < 3; i++) {
           if (m[i].getWon()) {
             isOver = true;
             direction = "";
             winner = i;
           }
          }
        //print(direction);
          drawGs(gs);
          moveTiles = false;
          int i; 
          delay(100);
          for(i=0; i < 3 && haveMoved[i]; i++){}
          if (i == mover || i == 2){
            try {
              gs = takeTurn(i, gs, direction);
              haveMoved[i] = true;
            } catch(InvalidMoveException e) {
              
            }
          }
          if (i == 3) {
            haveMoved[0] = !m[0].getIsAlive();
            haveMoved[1] = !m[1].getIsAlive();
            haveMoved[2] = false;
            moveTiles = true;
          }
          mover = -1;
          direction = "";
        } else {
           ifOver(direction, counter, winner);
           counter = (counter+1) % 16;
        }
        
    }
    
    void ifOver(String s, int i, int winner) {
      if (winner == 2) {
        background(0);
        if (s.equals("")) {
          image(gameOverText, 0, 0);
          image(gameOver[i], 0, 0);
          delay(85);
        } else {
           exit(); 
        }
      }
    }
    void keyPressed() {
       if (key == 'w') {
         mover = 0;
         direction = "up";
       } else if (key == 's') {
         mover = 0;
         direction = "down";
       } else if (key == 'a') {
         mover = 0;
         direction = "left";
       } else if (key == 'd') {
         mover = 0;
         direction = "right";
       }
       else if (key == ' ') {
         mover = 0;
         direction = "same";
       }
       else if (key == CODED) {
          if (keyCode == UP) {
            mover = 1;
            direction = "up";
          } else if (keyCode == DOWN) {
            mover = 1;
            direction = "down";
          } else if (keyCode == LEFT) {
            mover = 1;
            direction = "left";
          } else if (keyCode == RIGHT) {
            mover = 1;
            direction = "right";
          }
          else if (keyCode == SHIFT) {
             mover = 1;
             direction = "same";
          }
       }
    }
    
    /*public static Square[][] move(Square[][] map){
        for (int i=0; i<map.length; i++){
            for (int j=0; j<map[0].length; j++){
                map[i][j].move();
            }
        }
        return map;
    }*/
    
    public static GameState takeTurn(int mover, GameState gs, String dir){
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

        if (gs.getMoveThings()[mover].getIsAlive()){

                gs.characters[mover].move(dir);
               
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
      background(255);
      for (int i = 0; i < 7; i++) {
         for (int j = 0; j < 7; j++) {
            image(floor, 100*i, 100*j);  
         }
      }
      fill(0);
      
      //Draws anything inherent to the spaces
      for (int i=0; i < gs.gMap.length; i++){
        for (int j=0; j< gs.gMap[0].length; j++){
          //Draws the walls
          if (moveTiles) {
            gs.gMap[i][j].move();
          }
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
          image(flags[i], 100*gs.characters[i].goal[1], 100*gs.characters[i].goal[0]);
          //rect(100*gs.characters[i].goal[1] + 10, 100*gs.characters[i].goal[0] + 10, 80, 80);
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