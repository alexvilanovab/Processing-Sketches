// variable declaration
PVector f00, f11;
float x, y, s;


// setup function
void setup() {

  // window
  size(600, 600);

  // variable initialization
  x = y = 0;
  s = 40;
  f00 = new PVector(s * 2, s * 2);
  f11 = new PVector(width - s * 4, height - s * 4);

  // colors and pens
  background(0);
  stroke(150, 105, 200);
  noFill();

}


// draw function
void draw() {

  // draw square
  stroke(150, 100, 200);
  rect(f00.x, f00.y, f11.x, f11.y);

  // get color
  if (x>=f00.x && y>=f00.y && x<f00.x+f11.x && y<f00.y+f11.y) {
    stroke(150, 105, 200);
  }
  else stroke(50, 50, 50);

  // generate line
  if (random(0, 2) > 1) line(x, y, x+s, y+s);
  else line(x, y+s, x+s, y);

  // jumpline
  if (x >= width) {
    x = 0;
    y += s;
  } else x += s;

  // end
  if (y >= height) {
    delay(4000);
    background(0);
    x = y = 0;
  }

}
