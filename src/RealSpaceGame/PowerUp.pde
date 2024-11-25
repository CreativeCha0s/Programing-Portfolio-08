class PowerUp {
  // Member Variables
  int x, y, diam, speed;
  char type;

  // Constructor
  PowerUp() {
    x = int(random(height));
    y = 100;
    diam = int(random(20, 80));
    speed = int(random(1, 5));
    int rand = int(random(3));
    if (rand == 0)
    {
      type = 'h';
    } else if (rand == 1)
    {
      type = 'l';
    } else if (rand == 2)
    {
      type = 't';
    }
  }
  void display() {
    fill(255, 0, 0);

    // PImage img;
    // img = loadImage(laserpower_0.png);

    noStroke();
  }

  void move() {
    x = x - speed;
  }

  boolean reachedLeft() {
    if (x>1250) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip s) {
    float d = dist(x, y, s.x, s.y);
    if (d<1250) {
      return true;
    } else {
      return false;
    }
  }
}
