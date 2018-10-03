class GameObjectManager {
  int timeSec, enemyUnit = 0, enemyLimit = 500,
  bulletLimit = 50, bulletUnit = 0, bulletCooldown = 0;
  boolean spawnCheck = false, collisionCheck = false;
  Player player1;
  Bullet[] playerBullets;
  Enemy01[] enemies01;

  GameObjectManager(){
    //ugly bulletdump that spawns the entire array of bullets outside the screen
    PVector bulletdump = new PVector(-10,-10);
    playerBullets = new Bullet[bulletLimit];
    for(int i =0 ; i < bulletLimit; i++){
      playerBullets[i] = new Bullet(bulletdump);
    }
    player1 = new Player();
    enemies01 = new Enemy01[enemyLimit];
    enemies01[enemyUnit] = new Enemy01();

  }

  void update(){
    timeSec = millis() /1000;
    player1.update();
    enemySpawner();
    bulletManager();


    for(int i = 0; i < enemyUnit; i++){
      if (enemies01[i].active == true){
        enemies01[i].update();
        enemies01[i].draw();
        collisionCheck = collisionDetection(enemies01[i], player1);
        if (collisionCheck){
          // enemies01[i].active = false;
          println("Collision!");

        }
      }
    }

    for(int i = 0; i < playerBullets.length; i++){
      if (playerBullets[i].active == true){
        playerBullets[i].update();
        playerBullets[i].draw();

        for(int j = 0; j < enemyUnit; j++){
          if (enemies01[j].active == true){
            collisionCheck = collisionDetection(playerBullets[i], enemies01[j]);
            if (collisionCheck){
              enemies01[j].active = false;
              playerBullets[i].active = false;
            }
          }
        }
      }
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
    }
  }

  void enemySpawner(){
    if (timeSec % 2 == 0 && spawnCheck == false){
      enemies01[enemyUnit] = new Enemy01();
      enemyUnit++;
      spawnCheck = true;
      //println(enemies01[enemyUnit].position.y);
    }
    else if(timeSec % 2 != 0) {
      spawnCheck = false;
    }
  }

}
