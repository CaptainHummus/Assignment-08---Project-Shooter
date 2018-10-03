class Player extends GameObject {
  float playerSpeed = 4, size = 40;

  Player() {
    position = new PVector(width/2,height - 150);
  }

  void update() {
    float xMovement = getAxisRaw("Horizontal") * playerSpeed;
    float yMovement = getAxisRaw("Vertical") * playerSpeed;

    position.x += xMovement;
    position.y += yMovement;
    fill(120,120,255);
    ellipse(position.x,position.y, size,size);
  }
}
