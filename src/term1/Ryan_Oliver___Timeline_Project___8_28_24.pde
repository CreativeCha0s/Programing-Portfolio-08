// Ryan O. | Timeline Project | 8-28-24

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(100, 200, "Zuse Z4", "Date: March 1945 | Location: Switzerland | Purpose: It was the first \n commercial digital computer, and\n improved the design from the Z3, the predecessor of the Z4. ", true);
  histEvent(300, 200, "Modified ENIAC", "Date: April 1948 | Location: US | A similar version of the original ENIAC, \n but with mechanisms using the Function Tables as Program Rom" , true);
  histEvent(500, 200, "Manchester Baby", "Date: June 1948 | Location: University of Manchester | Purpose: It was the first \n electronic stored-program computer, which was not the \n intended idea at first", true);
  histEvent(700, 200, "EDSAC", "Date: May 1949 | Location: | Purpose: It \n  was the second ever electronic digital stored-program computer", true);
  histEvent(200, 300, "ENIAC", "Date: December 1945 | Location: University of Pennsylvania | Purpose: It was the first \n programmable, electronic digital computer, and it was the first computer \n to have all of these features", false);
  histEvent(385, 300, "ARC2 (SEC)", "Date: May 1948 | Location: Birkbeck College, London | Purpose: It was a computer that \n computed the reciprocal spacings of diffraction patterns ", false);
  histEvent(570, 300, "Manch. Mark 1", "Date: April 1949 | Location: Victoria University of Manchester, England | Purpose: It was \n one of the first digital stored-program computer, which \n  ran for 9 hours straight with no errors or problems", false);
  histEvent(750, 300, "CSIRAC", "Date: Nov 1949 | Location: Australia | Purpose: It was \n  Australia’s first ever digital computer", false);
}

void drawRef() {
  // timeline format
  strokeWeight(3);
  stroke(0);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 90, 260);
  text("1950", 810, 260);


  // title text
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(25);
  text("by Ryan O.", width/2, 85);
}

void histEvent(int x, int y, String title, String detail, boolean top) {
  if (top == true) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  rectMode(CENTER);
  fill(220);
  rect(x, y, 175, 20);
  fill(0);
  text(title, x, y);
  if (mouseX>x-50 && mouseX<x+50 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
