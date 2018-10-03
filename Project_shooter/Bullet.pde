class Bullet extends GameObject{
  PVector velocity;

  Bullet(PVector playerPosition) {
    speed = -7;
    int size = 5;
    position = new PVector();
    position.x = playerPosition.x;
    position.y = playerPosition.y;

    velocity = new PVector();
    velocity.y = speed;
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
