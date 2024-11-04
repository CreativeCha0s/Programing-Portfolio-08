// Ryan O. | ColDet | 9-9-24

int xspeed, yspeed;
int xpos, ypos, wdth, ht;
void setup(){
  size(1900, 1000);
  background(0);
  xspeed = 2;
  yspeed = 9;
  wdth = 20;
  ht = 20;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  frameRate(60);
}
void draw(){
  fill(255);
  ellipse(xpos, ypos, wdth, ht);
  xpos += xspeed;
  ypos += yspeed;
  if (xpos >= width-wdth/2 || xpos <= wdth/2){
   xspeed *= -1;
  } 
    if (ypos >= height-ht/2 || ypos <= ht/2){
      yspeed = yspeed * -1;
  }
}
