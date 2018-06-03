class Goal {
  PVector pos;

  Goal(float x, float y) {
    pos = new PVector(x, y);
  }

  //--------------------------------------------------------------------------------

  void show() {
    fill(255, 0, 0);
    ellipse(goal.pos.x, goal.pos.y, 10, 10);
  }
}
