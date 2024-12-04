class Laser {
  // Member Variables
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 25;
    h = 5;
    speed = 5;
  }
  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    noStroke();
    rect(x+50, y, w, h);
  }

  void move() {
    x += speed;
  }

  boolean reachedRight() {
    if (x>1250) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
     float d = dist(x, y, r.x, r.y);
      if (d<50) {
        return true;
      } else {
        return false;
  }
}
}
