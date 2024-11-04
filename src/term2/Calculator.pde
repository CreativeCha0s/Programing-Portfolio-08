//Ryan Oliver | Calc Project | 10-2-24
Button[] buttons = new Button[24];
String dVal = "0";
Float l, r, result;
char op;
boolean left;

void setup() {
  size(310, 250);
  background(50);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(90, 190, '±', false);
  buttons[1] = new Button(40, 70, '?', false);
  buttons[2] = new Button(40, 110, 'π', false);
  buttons[3] = new Button(40, 150, '√', false);
  buttons[4] = new Button(40, 190, '^', false);
  buttons[5] = new Button(90, 70, '7', true);
  buttons[6] = new Button(90, 110, '4', true);
  buttons[7] = new Button(90, 150, '1', true);
  buttons[8] = new Button(130, 70, '8', true);
  buttons[9] = new Button(130, 110, '5', true);
  buttons[10] = new Button(130, 150, '2', true);
  buttons[11] = new Button(130, 190, '0', true);
  buttons[12] = new Button(170, 70, '9', true);
  buttons[13] = new Button(170, 110, '6', true);
  buttons[14] = new Button(170, 150, '3', true);
  buttons[15] = new Button(210, 70, '÷', false);
  buttons[16] = new Button(210, 110, '×', false);
  buttons[17] = new Button(210, 150, '-', false);
  buttons[18] = new Button(210, 190, '+', false);
  buttons[19] = new Button(170, 190, '=', false);
  buttons[20] = new Button(260, 70, '?', false);
  buttons[21] = new Button(260, 110, '≈', false);
  buttons[22] = new Button(260, 150, '.', false);
  buttons[23] = new Button(260, 190, 'C', false);
}

void draw() {
  background(50);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void updateDisplay() {
  rectMode(CENTER);
  fill(222);
  rect(width/2, 30, 140, 30);
  fill(0);
  if (dVal.length()<9) {
    textSize(35);
  } else if (dVal.length() == 8) {
    textSize(32);
  } else if (dVal.length() == 9) {
    textSize(29);
  } else if (dVal.length() == 10) {
    textSize(26);
  } else if (dVal.length() == 11) {
    textSize(23);
  }

  textAlign(RIGHT);
  text(dVal, width-90, 40);
}
void mouseReleased() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<11) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val == '.') {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && buttons[i].val == 'C') {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val == '+') {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val == '-') {
      op = '-';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val == '×') {
      op = '×';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val == '÷') {
      op = '÷';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val == '^') {
      op = 'e';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val == '≈') {
      op = 'n';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val == '=') {
      handleEvent("=", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '±') {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else {
        r *= -r;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(PI);
      } else {
        r = PI;
        dVal = str(PI);
      }
    }
  }
}
void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else  if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else  if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else  if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else  if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else  if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else  if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else  if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else  if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else  if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else  if (key == '+' || keyCode == 106 || keyCode == 107) {
    handleEvent("+", false);
  } else  if (key == '-' || keyCode == 107 || keyCode == 45) {
    handleEvent("-", false);
  } else  if (key == '/' || keyCode == 108 || keyCode == 111) {
    handleEvent("/", false);
  } else  if (key == '*' || keyCode == 109 || keyCode == 106) {
    handleEvent("*", false);
  } else  if (keyCode == 10) {
    handleEvent("=", false);
  }
}


void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 10 && isNum) {

    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 10 && isNum) {

    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  }
}


void performCalc() {
  if (op == '+') {
    result = l + r;
    dVal = str(result);
  } else if (op == '-') {
    result = l - r;
    dVal = str(result);
  } else if (op == '×') {
    result = l * r;
    dVal = str(result);
  } else if (op == '÷') {
    result = l / r;
    dVal = str(result);
  } else if (op == 'e') {
    result = pow(l, r);
    dVal = str(result);
  } else if (op == 'n') {
  }
  dVal = str(result);
}
