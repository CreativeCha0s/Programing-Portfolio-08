// Ryan Oliver || 11-6-24 || SpaceGame
import processing.sound.*;
SoundFile laser;
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
int score, level, timer, rockRate;
//int s = 0;
boolean play;
Timer rTime, puTime, sTime;
PImage img, img2;

void setup() {
  size(1200, 800);
  s1 = new SpaceShip();
  score = 0;
  level = 1;
  play = false;
  rTime = new Timer(500);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  sTime = new Timer (5000);
  img2 = loadImage("IMG_3583.png");

  img = loadImage("IMG_3569.png");
  laser = new SoundFile(this, "laser.wav");
}

void draw () {
  if (!play) {
    startScreen();
  } else {
    //  s++;


    background(img);
    if (frameCount % 1000 == 0) {
      level++;
      rTime.totalTime-= 50;
    }
    // Render PowerUps
    if (puTime.isFinished()) {
      powups.add(new PowerUp());
      puTime.start();
    }
    for (int i = 0; i <powups.size(); i++) {
      PowerUp pu = powups.get(i);
      if (pu.intersect(s1) && pu.type == 'h') {
        powups.remove(pu);
        s1.health += 50;
      } else if (pu.intersect(s1) && pu.type == 'l') {
        powups.remove(pu);
        s1.laserCount += 50;
      } else if (pu.intersect(s1) && pu.type == 't') {
        powups.remove(pu);
        s1.turretCount += 1;
      }
      //else if (pu.intersect(s1) && pu.type == 's') {
      //  powups.remove(pu);
      //  if (mousePressed && (mouseButton == RIGHT)) {
      //    sTime.start();
      //    for (int j = 0; j < rocks.size(); j++) {
      //      Rock rock = rocks.get(j);
      //      rock.speed = 0;
      //    }
      //    Rock speed = int(0);
      //    Laser speed = int(0);
      //    if (sTime.isFinished);
      //    Rock speed = int(random(1, 7));
      //    Laser speed = 5;
      //  }
      //}

      pu.display();
      pu.move();
      if (pu.reachedLeft()) {
        powups.remove(pu);
      }
    }

    // Render lasers and detect rock collide
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rock.diam -= 150;
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
    //if (bTime.isFinished()) {
    //  rocks.add(new Rock());
    //  bTime.start();


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
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
}

void infoPanel() {
  //s = second();
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 50);
  fill(255);
  textSize(35);
  text("Score:" + score, 140, 35);
  text("Health:" + s1.health, 500, 35);
  text("Level:" + level, 20, 35);
  text("Ammo:" + s1.laserCount, 320, 35);
  //text("Time:" + s, 700, 35);
  //line(s, 0, s, 33);
}

void startScreen() {

  background(img2);
  fill(255);
  textSize(75);
  text("Space Game", 700, 350);
  textSize(50);
  text("Created by Ryan O.", 700, 400);
  textSize(35);
  text("Click to Start", 755, 450);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over", width/2, 350);
  text("Score:" + score, width/2, 400);
  text("Level:" + level, width/2, 450);
  // text("Time:" + s, width/2, 500);
}

void ticker() {
}

void mousePressed() {
  if (!laser.isPlaying()) {
    laser.play();
  }
  if (s1.fire() && s1.turretCount == 1) {

    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  } else if (s1.fire() && s1.turretCount >= 2) {
    lasers.add(new Laser(s1.x, s1.y-10));
    lasers.add(new Laser(s1.x, s1.y+10));
    s1.laserCount -=1;
  }
}
