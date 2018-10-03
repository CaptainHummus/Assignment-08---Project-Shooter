class GameObjectManager {
  int timeSec;
  int enemyUnit = 0;
  int enemyLimit = 500;
  int bulletLimit = 50;
  int bulletUnit = 0;
  int bulletCooldown = 0;
  boolean spawnCheck = false;
  boolean collisionCheck = false;
  Player player1;
  Bullet[] playerBullets;
  Enemy01[] enemies01;
  PVector bulletdump;

  GameObjectManager(){
    //ugly bulletdump that spawns the entire array of bullets outside the screen
    bulletdump = new PVector(-10,-10);
    playerBullets = new Bullet[bulletLimit];
    for(int i =0 ; i < bulletLimit; i++){
      playerBullets[i] = new Bullet(bulletdump);
    }
    player1 = new Player();
    enemies01 = new Enemy01[enemyLimit];

  }

  void update(){
    timeSec = millis() /1000;
    player1.update();
    enemySpawner();
    bulletManager();



    for(int i = 0; i < enemyUnit; i++){
      enemies01[i].update();
      enemies01[i].draw();
      collisionCheck = collisionDetection(enemies01[i], player1);
      println(collisionCheck);
    }
    for(int i = 0; i < playerBullets.length; i++){
      playerBullets[i].update();
      playerBullets[i].draw();
    }


  }

  void bulletManager(){
    if(shooting() && millis() - bulletCooldown > 100) {
      playerBullets[bulletUnit] = new Bullet(player1.position);
      bulletUnit++;
      bulletCooldown = millis();
      if(bulletUnit == bulletLimit){
        bulletUnit = 0;

      }
      println(bulletUnit);
    }
  }

  void enemySpawner(){
    if (timeSec % 2 == 0 && spawnCheck == false){
      enemies01[enemyUnit] = new Enemy01();
      enemyUnit++;
      spawnCheck = true;
    }
    else if(timeSec % 2 != 0) {
      spawnCheck = false;
    }
  }

}
