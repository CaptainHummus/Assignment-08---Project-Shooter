class Player extends GameObject {


  Player() {
    active = true;
    speed = 4;
    size = 40;
    r = 120;
    g = 120;
    b = 255;
    position = new PVector(width/2,height - 150);
  }

  void update() {
    if (active){
      float xMovement = getAxisRaw("Horizontal") * speed;
      float yMovement = getAxisRaw("Vertical") * speed;

      position.x += xMovement;
      position.y += yMovement;
      fill(r,g,b);
      ellipse(position.x,position.y, size,size);
    }
    else{
      fill(255,0,0);
      ellipse(position.x,position.y, size,size);
    }
  }
}
