class GameObjectManager {
  int timeSec;
  int enemyUnit;
  int enemyLimit = 500;
  boolean spawnCheck;
  boolean playerShoot = false;
  int bulletLimit = 50;
  int bulletUnit = 0;
  int bulletCooldown = 0;
  Bullet[] playerBullets;

  Player player1;
  Enemy01[] enemies01;
  GameObjectManager(){
    playerBullets = new Bullet[bulletLimit];
    player1 = new Player();
    enemies01 = new Enemy01[enemyLimit];
    enemyUnit = 0;
    spawnCheck = false;
  }

  void update(){
    timeSec = millis() /1000;
    playerShoot = shooting();
    if(playerShoot && millis() - bulletCooldown > 500) {
      playerBullets[bulletUnit] = new Bullet(player1.position);
      bulletUnit++;
      bulletCooldown = millis();
      if(bulletUnit == (bulletLimit-1)){
        bulletUnit = 1;

      }
    }
    player1.update();
    enemySpawner();

    for(int i = 0; i < enemyUnit; i++){
      enemies01[i].update();
      enemies01[i].draw();
    }
    for(int i = 0; i < bulletUnit; i++){
      playerBullets[i].update();
      playerBullets[i].draw();
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
