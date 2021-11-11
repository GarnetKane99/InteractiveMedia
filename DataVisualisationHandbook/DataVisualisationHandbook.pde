import beads.*;
import controlP5.*;
import processing.video.*;

Button Continue;
ControlFont calibri, Bahnschrift;
PFont titleFont, Chunkeh, Chimken, Glossary, ImageChoose, ImageFont, BeatsBook, InstrumentsFont, AudioSelectorFont, 
  CamFilterFont, CamTitleFont, ColourPalette, DrawFont;

boolean Menu = true, AudioMode = false, ImageMode = false, CameraMode = false, 
  DrawingMode = false, IllusionMode = false, DataMode = false;

void setup() {
  Controller = new ControlP5(this);
  size(1600, 900);
  background(255);
  createFonts();
  showTitle();
}

void createFonts() {
  titleFont = loadFont("Lucida.vlw");
  Chunkeh = loadFont("Chunkeh.vlw");
  Chimken = loadFont("Chimken.vlw");
  Glossary = loadFont("Glossary.vlw");
  ImageChoose = loadFont("ImageChoose.vlw");
  ImageFont = loadFont("ImageFont.vlw");
  BeatsBook = loadFont("BeatsBook.vlw");
  CamFilterFont = loadFont("CamFilter.vlw");
  CamTitleFont = loadFont("CameraFont.vlw");
  ColourPalette = loadFont("Colours.vlw");
  DrawFont = loadFont("DrawFont.vlw");
  AudioSelectorFont = loadFont("InstrumentsFont.vlw");
  InstrumentsFont = loadFont("InstrumentsFont1.vlw");
  calibri = new ControlFont(createFont("calibri", 20));
  Bahnschrift = new ControlFont(createFont("Bahnschrift", 20));
}

void showTitle() {
  Continue = Controller.addButton("ContinueClicked")
    .setPosition((width/2) + 500, height/2+250)
    .setSize(130, 50)
    .setColorBackground(0xffC8C8C8)
    .setColorForeground(0xffFFFFFF)
    .setColorActive(0xff000000)
    .setColorLabel(0xff504554)
    .setFont(Chunkeh)
    .setCaptionLabel("Continue");

  titleBackground();

  fill(0);
  textFont(titleFont);
  text("Welcome to my project!", width/2-180, height/2-250);
  text("My name is Jake. This is my project for Interactive Media. This project utilises", 250, height/2-150);
  text("data in various mediums for a (hopefully) more interesting experience.", 250, height/2-100);
  text("In this project, you will find things like:", 250, height/2);
  text("- Image Manipulation using a Random Walker Algorithm", 250, height/2+50);
  text("- Audio Synthesis", 250, height/2+100);
  text("- Data Visualisation from UTS research", 250, height/2+150);
  text("- and much more!", 250, height/2+200);
  text("I hope you enjoy your stay! Press 'CONTINUE' -> to proceed", 250, height/2+300);
}

void titleBackground() {
  rectMode(CENTER);
  stroke(120);
  strokeWeight(3);
  fill(200);
  rect(width/2, height/2, 1400, 700);
}

void ContinueClicked() {
  background(255);
  Continue.hide();
  drawBook();
  UISetup();
}

void draw() {
  if (AudioMode) {
    UpdateInstruments();
  }
  if (canDraw) {
    DrawImage();
  }
  if (CameraMode) {
    drawCam();
  }
  if (DrawingMode) {
    drawingOnCanvas();
  }
  if (IllusionMode) {
    illusionDraw();
  }
  if (DataMode) {
    drawData();
  }
}

void drawBook() {
  stroke(0, 0, 0);
  strokeWeight(4);

  //left excess pages
  beginShape();
  fill(#E5D0B0);
  vertex(width/2, height-50);
  vertex(width/2-50, height-50);
  bezierVertex(width/2-50, height-130, width/6-50, height-50, width/8-50, height-50);
  vertex(width/8-50, height-50);
  vertex(width/8, height-100);
  vertex(width/8-50, height-50);
  vertex(width/8-50, 150);
  vertex(width/8, 100);
  vertex(width/2, 100);
  endShape();

  //right excess pages
  beginShape();
  fill(#E5D0B0);
  vertex(width/2, height-50);
  vertex(width/2+50, height-50);
  bezierVertex(width/2+50, height-130, width-(width/6)+50, height-50, width-(width/8)+50, height-50);
  vertex(width-(width/8)+50, height-50);
  vertex(width-width/8, height-100);
  vertex(width-(width/8)+50, height-50);
  vertex(width-(width/8)+50, 150);
  vertex(width-width/8, 100);
  vertex(width/2, 100);
  endShape();

  //left side of book
  beginShape();
  fill(#D6A965);
  vertex(width/2, 100);
  bezierVertex(width/2, 10, width/6, 100, width/8, 100);
  vertex(width/8, 100);
  vertex(width/8, height-100);
  bezierVertex(width/6, height-100, width/2, height-180, width/2, height-50);
  endShape();

  //right side of book
  beginShape();
  fill(#D6A965);
  vertex(width/2, 100);
  bezierVertex(width/2, 10, width-width/6, 100, width-width/8, 100);
  vertex(width-width/8, 100);
  vertex(width-width/8, height-100);
  bezierVertex(width-width/6, height-100, width/2, height-180, width/2, height-50);
  endShape();

  line(width/2, 100, width/2, height-50);

  //random page lines
  randomPages();
}

void randomPages() {
  strokeWeight(1);

  for (int i = 0; i < 50; i++) {
    int randX = (int)random(0, 50);
    int randYStart = (int)random(300, height-100);
    int randYEnd = (int)random(randYStart-random(0, 200), randYStart);
    line(width/8-randX, randYStart, width/8-randX, randYEnd);
  }
  for (int i = 0; i < 50; i++) {
    int randX = (int)random(0, 50);
    int randYStart =(int) random(300, height-100);
    int randYEnd = (int) random(randYStart-random(0, 200), randYStart);
    line(width-(width/8)+randX, randYStart, width-(width/8)+randX, randYEnd);
  }
}
