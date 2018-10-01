class GameObjectManager {
  Player player1;
  GameObjectManager(){
    player1 = new Player();
  }

  void update(){
    player1.update();
  }
}
