

class Player {
  PVector pos;
  // Perlin noise two dimensions offsets
  float xoff, yoff;


  Player() {
    xoff = 0;
    yoff = 1000;
    // random initial position
    pos = new PVector(noise(xoff) * width, noise(yoff) * height);
  }


  void display() {
    
    for (int i = 0; i < numRays; i++) {
      float angle = stepAngle * i;
      float rayLength = maxRayLength;

      stroke(255, 255, 0, 50);

      // for each ray calculate the distance to the nearest wall with which it intersects
      for (Wall wall : walls) {
        // Cramer Rule
        // calculates the solution of the system of linear equations with two unknowns
        // corresponding to the point of intersection of the wall line and the ray line
        // t and u are the unknowns
        float d = cos(angle)*(wall.to.y-wall.from.y) -
          sin(angle)*(wall.to.x-wall.from.x);
        // if the denominator is 0, the lines are parallel and there is no intersection point
        if (d != 0) {
          float nt = (pos.x-wall.from.x)*(wall.from.y-wall.to.y) -
            (pos.y-wall.from.y)*(wall.from.x-wall.to.x);
          float nu = cos(angle)*(pos.y-wall.from.y) -
            sin(angle)*(pos.x-wall.from.x);
          float t = nt / d;
          float u = nu / d;
          if (0<=u && u<=1 && 0<=t && t<rayLength) {
            // the ray strikes the wall
            rayLength=t;
          }
        }
      }

      line(pos.x, pos.y, pos.x+cos(angle)*rayLength, pos.y+sin(angle)*rayLength);
    }
  }


  void update() {
    pos.x = noise(xoff) * width;
    pos.y = noise(yoff) * height;

    xoff += 0.007;
    yoff += 0.007;
  }
}
