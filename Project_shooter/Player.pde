class Player extends GameObject {
float playerSpeed = 8;

  Player() {
    position = new PVector(width/2,height/2);
  }

  void update() {
    float xMovement = getAxisRaw("Horizontal") * playerSpeed;
    float yMovement = getAxisRaw("Vertical") * playerSpeed;
    position.x += xMovement;
    position.y += yMovement;
    ellipse(position.x,position.y, 40,40);
  }
}
