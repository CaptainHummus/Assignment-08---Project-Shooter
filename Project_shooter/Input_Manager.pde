boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT){
      moveRight = true;
    }
    else if (keyCode == LEFT){
      moveLeft = true;
    }
  }
}

void keyReleased() {
  if (key == CODED){
    if (keyCode == RIGHT){
      moveRight = false;
    }
    else if (keyCode == LEFT){
      moveLeft = false;
    }
  }
}
