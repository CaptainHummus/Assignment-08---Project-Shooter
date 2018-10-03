boolean collisionDetection(GameObject ball1, GameObject ball2 )
{
  int maxDistance = ball1.size/2 + ball2.size/2;

  if(abs(ball1.position.x - ball2.position.x) > maxDistance
  || abs(ball1.position.y - ball2.position.y) > maxDistance)
  {
    return false;
  }

  else if(dist(ball1.position.x, ball1.position.y,
    ball2.position.x, ball2.position.y) > maxDistance)
  {
    return false;
  }
  else
  {
   return true;
  }
}
