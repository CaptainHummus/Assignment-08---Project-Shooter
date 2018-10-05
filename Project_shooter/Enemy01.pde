class Enemy01 extends GameObject {
  // PVector velocity;
  int spawnTimeMark;
  PImage fish;

  Enemy01() {
    active = true;
    spawnTimeMark = millis();
    speed = 4;
    size = 30;
    position = new PVector();
    fish = loadImage("fish.png");

    position.x = random(0, width);
    position.y = 0;

    // velocity = new PVector();
    // velocity.y = speed;
  }

  void update(){
    position.y += speed;

    if (position.y > height) {
      position.y = 0;
    }
  }

  void draw(){
    noFill();
    noStroke();
    imageMode(CENTER);
    image(fish, position.x, position.y, 40, 40);
  }
}
