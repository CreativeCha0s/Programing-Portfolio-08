class PowerUp {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage pu;

  // Constructor
  PowerUp() {
    y = int(random(height));
    x = width+50;
    diam = int(80);
    speed = int(random(1, 5));
    int rand = int(random(3));
    if (rand == 0) {
      type = 'h';
    } else if (rand == 1) {
      type = 'l';
      //pu = loadImage("laserpower_0.png");
    } else if (rand == 2) {
      type = 't';
    }
    //  else if (rand == 3)
    //    type = 's';
    //}
  }
  void display() {

    if (type == 'h') {
      fill(0, 255, 0);
    } else if (type == 'l') {
      fill(255, 0, 0);
    } else if (type == 't') {
      fill(0, 0, 255);
    }
    ellipse(x, y, diam, diam);

    //if (type = 'l') {
    //  laser = loadImage(laserpower_0.png);

    noStroke();
  }

  void move() {
    x = x - speed;
  }

  boolean reachedLeft() {
    if (x<-1250) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
