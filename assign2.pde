//You should implement your assign2 here.
PImage bg1, bg2, end1, end2, enemy, fighter, hp, start1, start2, treasure;
final int hpX = 0, hpY = 0; 
final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
final int TURN_UP = 1, TURN_DOWN = 2;
float hpLong = 39;
int gameState;
int bg1X = 0, bg2X = 640;
int fighterX = 590, fighterY = 240;
int speed = 4;
int treasureX = floor(random(120, 521)),treasureY = floor(random(60, 421));
int enemyX = 0, enemyY = floor(random(50, 431));
int turnDirection = 0;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  size(640, 480) ;
  // loadImage
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  treasure = loadImage("img/treasure.png");
  
  
  //gameState
  gameState = GAME_START;
}

void draw() {
  
  switch(gameState){
  
  case GAME_START:
    image(start2, 0, 0);
      if(mouseX >= 213 && mouseX <= 426 && mouseY >= 360 && mouseY <= 420 ){
  
        image(start1, 0, 0);
          if(mousePressed){
            gameState = GAME_RUN;
          }
      }
      break;
   case GAME_RUN:
     
     //bg
     image(bg2, bg2X-640, 0);
       bg2X += 2;
       bg2X %= 1280;
     image(bg1, bg1X-640, 0);
       bg1X += 2;
       bg1X %= 1280;
     
       
     //fighter
     image(fighter ,fighterX ,fighterY);
       //control fighter
       if(upPressed){
         fighterY -= speed;
       }
       if(downPressed){
         fighterY += speed;
       }
       if(rightPressed){
         fighterX += speed;
       }
       if(leftPressed){
         fighterX -= speed;
       }
       //fighter limit
       if(fighterX >= 590){
         fighterX = 590;
       }
       if(fighterX <= 0){
         fighterX = 0;
       }
       if(fighterY >= 430){
         fighterY = 430;
       }
       if(fighterY <= 0){
         fighterY = 0;
       }
     //treasure
     image(treasure, treasureX, treasureY);
       if(treasureX >= fighterX - 28 && treasureX <= fighterX + 28 && treasureY >= fighterY - 39  && treasureY <= fighterY + 39){
          hpLong += 18.5;
          if(hpLong >=195 ){
            hpLong = 195;
          }
          rect(10, 3, hpLong, 24);
          treasureX = floor(random(120, 521));
          treasureY = floor(random(60, 421));
       }
       
     //enemy
     image(enemy, enemyX ,enemyY);
       enemyX += 5;
       enemyX %= 645;    
       if(enemyY < fighterY-59){
         enemyY += 2;
         
       }
       if(enemyY > fighterY+59){
         enemyY -= 2;
         
       }

       
     //get hurt
     if(enemyX >= fighterX - 48 && enemyX <= fighterX + 48 && enemyY >= fighterY - 59  && enemyY <= fighterY + 59){
             hpLong -= 39;
             if(hpLong <= 0 ){
              gameState = GAME_OVER;
             }
             rect(10, 3, hpLong, 24);
             enemyX = 0;
             enemyY =floor(random(50, 431));
           }
     if(enemyX >=640){
        enemyY = floor(random(50, 431));
      }         
       break;
     case GAME_OVER:
      //bg
      image(end2 , 0, 0);
      if(mouseX >= 213 && mouseX <= 426 && mouseY >= 290 && mouseY <= 350 ){
        image(end1 ,0 ,0);
          if(mousePressed){
            fighterX = 590;
            fighterY = 240;
            enemyX = 0;
            enemyY = floor(random(50, 431));
            hpLong = 39; 
            rect(10, 3, hpLong, 24);
            image(hp, hpX, hpY);
            gameState = GAME_RUN ;
    
          }
      }
        break;
  }

//hp
  fill(255, 0, 0);
  rect(10, 3, hpLong, 24);
  image(hp, hpX, hpY);


}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
     }
  }
}
