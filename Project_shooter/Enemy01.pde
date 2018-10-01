class Enemy01 extends GameObject {
  super();

PVector position;
  PVector velocity;
  int size = 20;

  Enemy01() {    //Create vector objects
    position = new PVector();

    //Set random start pos
    position.x = random(0, width);
    position.y = 0;

    //Create vector for velocity and set random direction
    velocity = new PVector();
    velocity.y = random(10) - 5;
  }

  //Constructor with position arguments
  public Enemy01 (int x, int y) {
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.y = random(10) - 5;
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
    ellipse(position.x - size/2, position.y - size/2, size, size);   
  }
}
