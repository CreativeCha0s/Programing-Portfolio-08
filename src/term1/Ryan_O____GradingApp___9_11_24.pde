//Ryan O. | Grading App | 9-11-24
float grade = random(0, 4.00001);

void setup() {
  size(400, 150);
}
void draw() {
  background(200);
  textAlign(CENTER);
  fill(0);
  textSize(10);
  text("Grades by Ryan O.", width/2, 40);
  grade = random(0, 4.0001);

  // Reference Line
  line(0, 100, width, 100);

  // Tic Marks
  //line(200,95,200,105);
  for (int i=0; i<width; i+=50) {
    line(i, 95, i, 105);
    textSize(9);
    text((float)i/width*4, i, 95);
  }
  //Marker
  ellipse(mouseX, 100, 8, 8);
  text((float)mouseX/width*4, mouseX, 90);
  grade = random(0, 4.0001);
  println(grade);
  
  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  if (tgrade>=3.51) {
    text("Assign letter grade A.",width/2,135);
  } else if (tgrade>=3.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade A-",width/2,135);
  } else if (tgrade>=2.84) {
    text ("Assign letter grade B+",width/2,135);
  } else if (tgrade>=2.67) {
    text ("Assign letter grade B",width/2,135);
  } else if (tgrade>=2.50) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade B-",width/2,135);
  } else if (tgrade>=2.34) {
    text ("Assign letter grade C+",width/2,135);
  } else if (tgrade>=2.17) {
    text ("Assign letter grade C",width/2,135);
  } else if (tgrade>=2.00) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade C-",width/2,135);
  } else if (tgrade>=1.66) {
    text ("Assign letter grade D+",width/2,135);
  } else if (tgrade>=1.33) {
    text ("Assign letter grade D",width/2,135);
  } else if (tgrade>=1.00) {
    text ("Assign letter grade D-",width/2,135);
  } else {
    text ("Assign letter grade F",width/2,135);
  }
}
