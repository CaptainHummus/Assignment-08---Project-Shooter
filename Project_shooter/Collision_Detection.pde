boolean collisionDetection(GameObject object1, GameObject object2 )
{
  int maxDistance = object1.size/2 + object2.size/2;

  if(abs(object1.position.x - object2.position.x) > maxDistance
  || abs(object1.position.y - object2.position.y) > maxDistance)
  {
    return false;
  }

  else if(dist(object1.position.x, object1.position.y,
    object2.position.x, object2.position.y) > maxDistance)
  {
    return false;
  }
  else
  {
   return true;
  }
}
