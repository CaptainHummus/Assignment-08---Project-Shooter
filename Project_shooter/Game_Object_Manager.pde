class GameObjectManager {
  int timeSec, score = 0, enemyUnit = 0, enemyLimit = 1000,
  bulletLimit = 200, playerBulletUnit = 0, enemyBulletUnit = 0,
  enemyBulletCooldown = 0, playerBulletCooldown = 0;
  boolean spawnCheck = false, collisionCheck = false;
  Player player1;
  Bullet[] playerBullets;
  Bullet[] enemyBullets;
  Enemy01[] enemies01;

  GameObjectManager(){
    //ugly bulletdump that spawns the entire array of bullets outside the screen.
    PVector bulletdump = new PVector(-10,-10);
    playerBullets = new Bullet[bulletLimit];
    for(int i =0 ; i < bulletLimit; i++){
      playerBullets[i] = new Bullet(bulletdump, true);
    }
    enemyBullets = new Bullet[bulletLimit];
    for(int i =0 ; i < bulletLimit; i++){
      enemyBullets[i] = new Bullet(bulletdump, true);
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
        if (collisionDetection(enemies01[i], player1)){
          enemies01[i].active = false;
          player1.active = false;
        }
      }
    }

    for(int i = 0; i < playerBullets.length; i++){
      if (playerBullets[i].active == true){
        playerBullets[i].update();
        playerBullets[i].draw();

        for(int j = 0; j < enemyUnit; j++){
          if (enemies01[j].active == true){
            if (collisionDetection(playerBullets[i], enemies01[j])){
              enemies01[j].active = false;
              playerBullets[i].active = false;
              score += 10;
            }
          }
        }
      }
      if (enemyBullets[i].active == true){
        enemyBullets[i].update();
        enemyBullets[i].draw();
        if(collisionDetection(enemyBullets[i], player1)){
          enemyBullets[i].active = false;
          player1.active = false;
        }
      }
    }
  }

  void bulletManager(){
    if(shooting() && millis() - playerBulletCooldown > 500 && player1.active) {
      playerBullets[playerBulletUnit] = new Bullet(player1.position, true);
      playerBulletUnit++;
      playerBulletCooldown = millis();

      if(playerBulletUnit == bulletLimit){
        playerBulletUnit = 0;
      }
    }

    if(millis() - enemyBulletCooldown > 1800){
      for(int i = 0; i < enemyUnit; i++){
        if (enemies01[i].active){
          enemyBullets[enemyBulletUnit] = new Bullet(enemies01[i].position, false);
          enemyBulletUnit++;
          enemyBulletCooldown = millis();
          if(enemyBulletUnit == bulletLimit){
            enemyBulletUnit = 0;
          }
        }
      }
    }
  }

  void enemySpawner(){
    if (timeSec % 2 == 0 && spawnCheck == false){
      for(int i = 0; i < timeSec; i ++){
        enemies01[enemyUnit] = new Enemy01();
        enemyUnit++;
      }
      spawnCheck = true;
    }
    else if(timeSec % 2 != 0) {
      spawnCheck = false;
    }
  }

  void printer()  {
    fill(0,255,0);
    textSize(16);
    text("Score: "+ score,20,20);
    if (player1.active == false){
      textSize(32);
      text("GAME OVER",width/2 - textWidth("GAMEOVER")/2 ,height/2);
    }
  }
}
