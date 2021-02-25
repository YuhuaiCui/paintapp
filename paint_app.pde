//Daniel Cui
//Block 1-4B
//Feb 24, 2021

//pallette
color red = #DF151A;
color orange = #FD8603;
color yellow = #F4F328;
color green = #00DA3C;
color blue = #00CBE7;
color white = #FFFFFF;
color black = #000000;
color grey = #656565;
color darkgrey = #4C4C4C;
color lightgrey = #EFEFEF;
color pink = #F21D41;
color brightpink = #FF00AA;
color purple = #AA00FF;
color neon = #AAFF00;

void setup() { //setup
  size(800, 600);
  background(255);
}

void draw() { //draw
  //temp background
  background(255);

  //Interface background
  strokeWeight(0);
  fill(grey);
  rect(0, 0, 100, height);

  //buttons
  button(25, 25, white);
  button(75, 25, red);
  button(25, 75, orange);
  button(75, 75, yellow);
  button(25, 125, neon);
  button(75, 125, green);
  button(25, 175, blue);
  button(75, 175, brightpink);
  button(25, 225, purple);
  button(75, 225, black);

  //slider
  rectTactile(35, 250, 65, 415);
  strokeWeight(3);
  line(50, 265, 50, 400);
  ellipse(50, 265, 15, 15);

  //Coordinates Tool
  guidelines();
}

void guidelines() { //coordinates Tool
  fill(pink);
  stroke(pink);
  strokeWeight(5);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
  noCursor();
  text("X:" + mouseX, mouseX + 5, mouseY + 15);
  text("Y:" + mouseY, mouseX + 5, mouseY + 25);
}

void button(int x, int y, int buttonColor) { //color buttons
  circularTactile(x, y);
  strokeWeight(2);
  fill(buttonColor);
  ellipse(x, y, 40, 40);
}

void circularTactile(int x, int y) { //makes circular buttons tactile
  if (dist(x, y, mouseX, mouseY) < 20) {
    stroke(lightgrey);
  } else {
    stroke(darkgrey);
  }
}

void rectTactile (int x1, int y1, int x2, int y2) {
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    stroke(lightgrey);
  } else {
    stroke(darkgrey);
  }
}
