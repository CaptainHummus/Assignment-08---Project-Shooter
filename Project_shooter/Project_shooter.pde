import processing.sound.*;
SoundFile music;

int score = 0;
boolean gameStart = false;
String str1 = "CLICK TO START";
GameObjectManager gameManager;

void setup() {
size(650,900);
music = new SoundFile(this, "SpaceShooter.wav");
music.play();
gameManager = new GameObjectManager();
frameRate(60);

}

void draw() {
  background(0);
  if (gameStart){
    gameManager.printer();
    gameManager.update();
  }
  else{
    textSize(32);
    text(str1,width/2 - textWidth(str1)/2 ,height/2);
  }
}

void mouseReleased(){
  gameStart = true;
}
