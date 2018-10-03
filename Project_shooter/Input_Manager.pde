boolean moveLeft, moveRight, moveUp, moveDown, shoot;

void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT){
      moveRight = true;
    }
    else if (keyCode == LEFT){
      moveLeft = true;
    }
    if (keyCode == UP){
      moveUp = true;
    }
    else if (keyCode == DOWN) {
      moveDown = true;
    }

  }
  if (key == 'z' ||key == 'Z'){
    shoot = true;
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
    if (keyCode == UP){
      moveUp = false;
    }
    else if (keyCode == DOWN) {
      moveDown = false;
    }

  }
  if (key == 'z' ||key == 'Z'){
    shoot = false;
  }
}

boolean shooting(){
  if(shoot){
    return true;
  }
  else{
    return false;
  }
}

float getAxisRaw(String axis){
  if (axis == "Horizontal"){
    if(moveLeft){
      return -1;
    }
    if(moveRight){
      return 1;
    }
  }
  if (axis == "Vertical"){
    if(moveUp){
      return -1;
    }
    if(moveDown){
      return 1;
    }
  }
return 0;
}
