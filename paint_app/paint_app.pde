//Daniel Cui
//Block 1-4B
//Feb 24, 2021

//To whom it may concern:
//May have to run this program in fullscreen if screen resolution < (1240x720)!

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
color silver = #BDB3AA;

float sliderY = 265;
float thickness = 1;
color currentColor;

PImage loading;
boolean loadingOn; //true or false

void setup() {
  size(1240, 720);
  background(255);
  loading = loadImage("loading.png");
  loadingOn = false;
}

void draw() {
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
  rectTactile(35, 245, 65, 410);
  strokeWeight(3);
  line(50, 260, 50, 395);
  ellipse(50, sliderY, 15, 15);

  //thickness indicator
  stroke(0);
  strokeWeight(thickness);
  fill(0);
  line(15, 450, 85, 450);

  //color indicator
  stroke(darkgrey);
  strokeWeight(5);
  fill(currentColor);
  rect(15, 410, 70, 20);

  //stamp of loading image
  fill(silver);
  rectTactile(10, 472, 90, 560);
  if (loadingOn == true) {
    stroke(lightgrey);
  }
  strokeWeight(2);
  rect(6, 468, 88, 88);
  image(loading, 10, 472, 80, 80);
  
  //new button
  appButton(5, 570, 95, 600);
  text("new", 50, 590);
} // end of draw

void button(int x, int y, int buttonColor) { //color buttons
  circularTactile(x, y);
  strokeWeight(2);
  fill(buttonColor);
  ellipse(x, y, 40, 40);
} //end of button

void circularTactile(int x, int y) { //makes circular buttons tactile
  if (dist(x, y, mouseX, mouseY) < 20) {
    stroke(lightgrey);
  } else {
    stroke(darkgrey);
  }
} //end of circularTactile

void rectTactile (int x1, int y1, int x2, int y2) { //makes rect buttons tactile
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    stroke(lightgrey);
  } else {
    stroke(darkgrey);
  }
} //end of rectTactile

void mouseDragged () { //stuff that happens while mouse is dragged
  controlSlider();

  //stamp and drawing
  if (loadingOn == false) {
    drawing();
  } else {
    image(loading, mouseX - 50, mouseY - 50, 100, 100);
  }
} //end of mouseDragged

void mouseReleased () { //stuff happens after click
  controlSlider();
  drawing();

  //stamp button
  if (mouseX > 10 && mouseY > 480 && mouseX < 90 && mouseY < 560) {
    loadingOn = !loadingOn;
  }

  //color buttons
  if (dist(25, 25, mouseX, mouseY) < 20) {
    currentColor = white;
  } 
  if (dist(75, 25, mouseX, mouseY) < 20) {
    currentColor = red;
  } 
  if (dist(25, 75, mouseX, mouseY) < 20) {
    currentColor = orange;
  } 
  if (dist(75, 75, mouseX, mouseY) < 20) {
    currentColor = yellow;
  } 
  if (dist(25, 125, mouseX, mouseY) < 20) {
    currentColor = neon;
  } 
  if (dist(75, 125, mouseX, mouseY) < 20) {
    currentColor = green;
  } 
  if (dist(25, 175, mouseX, mouseY) < 20) {
    currentColor = blue;
  } 
  if (dist(75, 175, mouseX, mouseY) < 20) {
    currentColor = brightpink;
  } 
  if (dist(25, 225, mouseX, mouseY) < 20) {
    currentColor = purple;
  } 
  if (dist(75, 225, mouseX, mouseY) < 20) {
    currentColor = black;
  }
} //end of mouseReleased

void controlSlider () { //read the name dude
  if (mouseX > 35 && mouseX < 60 && mouseY > 265 && mouseY < 395) {
    sliderY = mouseY;
    thickness = map(sliderY, 260, 395, 1, 25);
  }
} //end of controlSlider

void drawing () { //the actual drawing part
  if (mouseX > 100 && mouseX < width) {
    stroke(currentColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
} //end of drawing

void appButton(int x1, int y1, int x2, int y2) {
  rectTactile(x1, y1, x2, y2);
  rect(5, y1, 90, 30);
  fill(black);
  textAlign(CENTER);
  textSize(15);
} //end of appButtons
