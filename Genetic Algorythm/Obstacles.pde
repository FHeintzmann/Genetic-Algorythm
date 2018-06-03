class Obstacles {
  Rectangle[] Rectangles;

  Obstacles(int size) {
    Rectangles = new Rectangle[size];
    for (int i = 0; i < Rectangles.length; i++) {
      Rectangles[i] = new Rectangle(random(800), random(400)+200, random(500), 10);
    }
  }

  //------------------------------------------------------------------------------------------

  void show() {
    for (int i = 0; i < Rectangles.length; i++) {
      Rectangles[i].show();
    }
  }

  //--------------------------------------------------------------------------------------------

  boolean collision(Dot d) {
    boolean f = false;
    for (int i = 0; i < Rectangles.length; i++) { 
      if (d.pos.x > Rectangles[i].x && d.pos.x < Rectangles[i].x+Rectangles[i].Rwidth && d.pos.y > Rectangles[i].y && d.pos.y < Rectangles[i].y+Rectangles[i].Rheight) {
        f = true;
      }
    }
    return f;
  }
}
