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
PImage[] iWalls;
PImage[] playerWonGif;

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
  iWalls = new PImage[4];
  floor = loadImage("images/pixil-frame-0 (1).png");
  floor.filter(GRAY);
  gameOverText = loadImage("images/Game_Over.png");
  gameOverText.resize(700, 700);
  flags[0] = loadImage("images/cyan-flag.png");
  flags[1] = loadImage("images/magenta-flag.png");
  iWalls[0] = loadImage("images/top-wall.png");
  iWalls[1] = loadImage("images/right-wall.png");
  iWalls[2] = loadImage("images/bottom-wall.png");
  iWalls[3] = loadImage("images/left-wall.png");
  gameOver = new PImage[16];
  for (int i = 0; i < 16; i++) {
     gameOver[i] = loadImage("images/blood/blood"+Integer.toString(i+1)+".png"); 
     gameOver[i].resize(700, 700);
  }
  playerWonGif = new PImage[37];
  for (int i = 0; i < 37; i++) {
     playerWonGif[i] = loadImage("images/deadpool/deadpool"+Integer.toString(i+1)+".png");
     playerWonGif[i].resize(700, 600);
  }
}
   int counter = 0;
   int winner = 3;
   int mod = 0;
   void draw() {
        if (!isOver) {
          for (int i = 0; i < 3; i++) {
           if (m[i].getWon()) {
             isOver = true;
             direction = "";
             winner = i;
             if (winner == 2) {
                mod = 16; 
             } else {
                mod = 37; 
             }
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
           counter = (counter+1) % mod;
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
      } else {
        background(0);
        if (s.equals("")) {
           image(playerWonGif[i], 0, 0);
           delay(50);
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
            image(iWalls[0], 100*j, 100*i);
          }
          if (walls[1] == 1) {
            image(iWalls[1], 100*j, 100*i);
          }
          if (walls[2] == 1) {
            image(iWalls[2], 100*j, 100*i);
          }
          if (walls[3] == 1) {
            image(iWalls[3], 100*j, 100*i);
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