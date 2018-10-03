class Enemy01 extends GameObject {
  PVector velocity;

  Enemy01() {    //Create vector objects
    active = true;
    speed = 4;
    size = 30;
    position = new PVector();

    //Set random start pos
    position.x = random(0, width);
    position.y = 100;

    velocity = new PVector();
    velocity.y = speed;
  }

  void update()
  {
    position.y += velocity.y;

    if (position.y > height) {
      position.y = 0;
    }
  }

  void draw()
  {
    fill(168,168,168);
    ellipse(position.x, position.y, size, size);
  }
}
