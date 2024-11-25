// Ryan Oliver || 11-6-24 || SpaceGame
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
int score, level;
boolean play;
Timer rTime, puTime;


void setup() {
  size(1200, 800);
  s1 = new SpaceShip();
  score = 0;
  level = 1;
  play = false;
  rTime = new Timer(1000);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
}

void draw () {
  PImage img;
  img = loadImage("IMG_3569.png");
  background(img);
  // Render PowerUps
  if(puTime.isFinished()) {
    powups.add(new PowerUp());
    puTime.start();
  }
  for (int i = 0; i <powups.size(); i++) {
    PowerUp pu = powups.get(i);
    if(pu.intersect(s1) && pu.type == 'h') {
      powups.remove(pu);
      s1.health += 100;
    }else if(pu.intersect(s1) && pu.type == 'l') {
      s1.laserCount+= 25;
    }
    
    
    pu.display();
    pu.move();
    if(pu.reachedLeft()){
      powups.remove(pu);
  }
  }

  // Render lasers and detect rock collide
  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    for (int j = 0; j < rocks.size(); j++) {
      Rock rock = rocks.get(j);
      if (laser.intersect(rock)) {
        rock.diam -= 10;
        if (rock.diam <1) {
          rocks.remove(rock);
        }
        score += 10;
        lasers.remove(laser);
      }
    }
    laser.display();
    laser.move();
    if (laser.reachedRight()) {
      lasers.remove(laser);
    }
  }


  if (rTime.isFinished()) {
    rocks.add(new Rock());
    rTime.start();
  }

  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    if (s1.intersect(rock)) {
      // detuct 10 points
      score -= 10;
      // deduct 25 health
      s1.health -= 25;
      // delete rock
      rocks.remove(rock);
      if (rock.reachedLeft()) {
        rocks.remove(rock);
      }
    }
  }

  s1.display();
  s1.move(mouseX, mouseY);
  infoPanel();
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(0, 0, 400, 500);
  fill(255);
  textSize(35);
  text("Score:" + score, 20, 70);
  text("Health:" + s1.health, 20, 105);
  text("Level:" + level, 20, 35);
  text("Ammo:" + s1.laserCount, 20, 140);
}

void startScreen() {
}

void gameOver() {
}

void ticker() {
}

void mousePressed() {
  if (s1.fire());
  lasers.add(new Laser(s1.x, s1.y));
  s1.laserCount--;
}
