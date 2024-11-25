class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;
  // Constructor
  Rock() {
    y = int(random(height));
    x = width+50;
    diam = int(random(40, 120));
    speed = int(random(1, 7));
    r1 = loadImage("file.png");
   
  }
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }
  void move() {
    x = x - speed;
  }

  boolean reachedLeft() {
    if (x<-1250) {
      return true;
    } else{
      return false;
    }
  }
}
