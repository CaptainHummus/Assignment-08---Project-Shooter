class Bullet extends GameObject{

  PVector velocity;
  int size = 5;
  int bulletSpeed = -7;

  Bullet(PVector playerPosition) {
    position = new PVector();
    position.x = playerPosition.x;
    position.y = playerPosition.y;

    velocity = new PVector();
    velocity.y = bulletSpeed;
  }

  void update()
  {
    position.y += velocity.y;

    // if (position.y < 0) {
    //   size = 0;
    // }
  }

  void draw()
  {
    fill(255,0,0);
    ellipse(position.x, position.y, size, size);
  }
}
