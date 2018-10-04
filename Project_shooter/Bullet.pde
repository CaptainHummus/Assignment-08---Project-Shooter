class Bullet extends GameObject{
  PVector velocity;
  int r,g,b;

  Bullet(PVector playerPosition, boolean player) {
    active = true;
    if (player){
      speed = -7;
      r = 10;
      g = 60;
      b = 10;
    }
    else{
      speed = 7;
      r = 255;
      g = 0;
      b = 0;
    }
    size = 5;
    position = new PVector();
    position.x = playerPosition.x;
    position.y = playerPosition.y;

    velocity = new PVector();
    velocity.y = speed;
  }

  void update()
  {
    position.y += velocity.y;
  }

  void draw()
  {
    fill(r,g,b);
    ellipse(position.x, position.y, size, size);
  }
}
