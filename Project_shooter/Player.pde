class Player extends GameObject {


  Player() {
    speed = 4;
    size = 40;
    position = new PVector(width/2,height - 150);
  }

  void update() {
    float xMovement = getAxisRaw("Horizontal") * speed;
    float yMovement = getAxisRaw("Vertical") * speed;

    position.x += xMovement;
    position.y += yMovement;
    fill(120,120,255);
    ellipse(position.x,position.y, size,size);
  }
}
