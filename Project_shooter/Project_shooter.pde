float playerSpeed = 8;
PVector position;

void setup() {
size(700,1000);
position = new PVector(width/2, height/2);

}

void draw() {
  background(0);

  float xMovement = getAxisRaw("Horizontal") * playerSpeed;
  float yMovement = getAxisRaw("Vertical") * playerSpeed;
  position.x += xMovement;
  position.y += yMovement;

  ellipse(position.x,position.y, 40,40);

}
