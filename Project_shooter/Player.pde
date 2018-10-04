class Player extends GameObject {

  PImage boat;

  Player() {
    active = true;
    speed = 4;
    size = 40;
    position = new PVector(width/2,height - 150);
    boat = loadImage("boat.png");
  }

  void update() {
    if (active){
      float xMovement = getAxisRaw("Horizontal") * speed;
      float yMovement = getAxisRaw("Vertical") * speed;

      position.x += xMovement;
      position.y += yMovement;
      noFill();
      noStroke();
      imageMode(CENTER);
      image(boat, position.x, position.y, size, size);
    }
    else{
      noFill();
      noStroke();
      tint(60,60,10);
      imageMode(CENTER);
      image(boat, position.x, position.y, size, size);
    }
  }
}
