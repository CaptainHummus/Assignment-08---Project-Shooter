class Player extends GameObject {

  PImage boat;

  Player() {
    active = true;
    speed = 4;
    size = 40;
    r = 120;
    g = 120;
    b = 255;
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
      ellipse(position.x,position.y, size,size);
      imageMode(CENTER);
      image(boat, position.x, position.y, size, size);  
    }
    else{
      noFill();
      noStroke();
      ellipse(position.x,position.y, size,size);
      tint(60,60,10);
      imageMode(CENTER);
      image(boat, position.x, position.y, size, size);
    }
  }
}
