class Enemy01 extends GameObject {

  PVector velocity;
  int size = 30;

  Enemy01() {    //Create vector objects
    position = new PVector();

    //Set random start pos
    position.x = random(0, width);
    position.y = 0;

    //Create vector for velocity and set random direction
    velocity = new PVector();
    velocity.y = 4;
  }

  void update()
  {
    //Update our position
    position.y += velocity.y;

    if (position.y > height) {
      position.y = 0;
    }
  }

  void draw()
  {
    //Draw our ball on the screen
    fill(168,168,168);
    ellipse(position.x, position.y, size, size);
  }
}
