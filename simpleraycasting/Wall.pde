
class Wall {
  // ends of the wall
  PVector from, to;

  Wall(float x1, float y1, float x2, float y2) {
    from = new PVector(x1, y1);
    to = new PVector(x2, y2);
  }

  void display() {
    stroke(255);
    line(from.x, from.y, to.x, to.y);
  }
}
