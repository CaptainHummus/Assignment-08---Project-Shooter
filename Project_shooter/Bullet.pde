class Bullet extends GameObject{

  PVector velocity;
  int size = 5;
  int bulletSpeed = -1;

  Bullet(PVector playerPosition) {
    position = new PVector();
    position.x = playerPosition.x;
    position.y = playerPosition.y;

    //Create vector for velocity and set random direction
    velocity = new PVector();
    velocity.y = bulletSpeed;
  }

  void update()
  {
    position.y += velocity.y;

    if (position.y < 0) {
      size = 0;
    }
  }

  void draw()
  {
    //Draw our ball on the screen
    fill(255,0,0);
    ellipse(position.x, position.y, size, size);
  }
}
