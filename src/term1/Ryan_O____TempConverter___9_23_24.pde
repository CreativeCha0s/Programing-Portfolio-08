// Ryan O. | TempConverter | 9-23-24

void setup() {
  size(400, 200);
}

void draw() {

  // Display your name and app title
  background(120);
  line(0, 150, width, 150);
  for (int i=0; i<width; i=i+50) {
    line(i, 145, i, 155);
    textAlign(CENTER);
    text(i-200, i, 165);
    text("Ryan Oliver | TempConverter", 200, 50);
    textAlign(CENTER);
  }

  text("Cel: " + farToCel(mouseX-200), width/2, 100);
    text("Far: " + celToFar(mouseX-200), width/2, 110);

  // TODO: add far info
  // TODO: change the number line to display -200 to 200
  println("MouseX:" + mouseX + " : " + farToCel(mouseX));
}

float farToCel(float tempFar) {
  //formula to calculate cel conv
  tempFar = (tempFar-32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = ((tempCel*(9.0/5.0)) + 32.0);
  return tempCel;
}
