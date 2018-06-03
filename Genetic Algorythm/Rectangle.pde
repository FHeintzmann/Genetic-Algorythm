class Rectangle {
  float x;
  float y;
  float Rwidth;
  float Rheight;

  Rectangle(float a, float b, float c, float d) {
    x = a;
    y = b;
    Rwidth = c;
    Rheight = d;
  }

  //-------------------------------------------------------------------------------------

  void show() {
    fill(0, 0, 255);
    rect(x, y, Rwidth, Rheight);
  }
}
