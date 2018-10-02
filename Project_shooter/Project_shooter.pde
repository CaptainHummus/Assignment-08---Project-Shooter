GameObjectManager gameStart;

void setup() {
size(650,900);
gameStart = new GameObjectManager();

}

void draw() {
  background(0);

  gameStart.update();
  // println(gameStart.timeSec);


}
