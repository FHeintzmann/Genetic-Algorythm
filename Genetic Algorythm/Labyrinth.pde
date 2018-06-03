class Labyrinth {
  Rectangle[] Rectangles = new Rectangle[4];


  Labyrinth() {
    Rectangles[0] = new Rectangle(370, 60, 10, 680);
    Rectangles[1] = new Rectangle(420, 60, 10, 680);
    Rectangles[2] = new Rectangle(100, 395, 270, 10);
    Rectangles[3] = new Rectangle(430, 395, 270, 10);
  }

  //------------------------------------------------------------------------------------

  void show() {
    for (int i = 0; i < Rectangles.length; i++) {
      Rectangles[i].show();
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------

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
