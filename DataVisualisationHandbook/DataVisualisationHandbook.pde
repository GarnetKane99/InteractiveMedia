import beads.*;
import controlP5.*;

Button Continue;

ControlFont calibri;

void setup()
{
  Controller = new ControlP5(this);
  size(1600, 900);
  background(255);

  calibri = new ControlFont(createFont("calibri", 20));
  showTitle();

  //drawBook();
  //UISetup();
}

void showTitle()
{
  Continue = Controller.addButton("ContinueClicked")
    .setPosition(width/2, height/2+192)
    .setSize(100, 100)
    .setFont(calibri)
    .setCaptionLabel("Continue");

  textSize(32);
  fill(0);
  text("Welcome to my project!", width/2-150, height/2);
  text("My name is Jake; This project utilises various data through what I call:", 250, height/2+48);
  text("The Data Visualisation Handbook", width/2-200, height/2 + 96);
  text("Enjoy your stay!", width/2-150, height/2 + 144);
}

void ContinueClicked()
{
  background(255);
  Continue.hide();
  drawBook();
  UISetup();
}

void draw()
{
}

//this will eventually be updated so positions aren't as hardcoded in (as in they will take proper parameters rather than numbers)
void drawBook()
{
  noFill();
  stroke(0, 0, 0);
  //top left
  bezier(width/2, 100, width/2, 10, width/6, 100, width/8, 100);
  //top right
  bezier(width/2, 100, width/2, 10, width - width/6, 100, width - width/8, 100);
  //bottom left
  bezier(width/2, height-50, width/2, height-180, width/6, height-100, width/8, height-100);
  bezier(width/2-50, height-50, width/2-50, height-130, width/6-50, height-50, width/8-50, height-50);
  //bottom right
  bezier(width/2, height-50, width/2, height-180, width-width/6, height-100, width-width/8, height-100);
  bezier(width/2+50, height-50, width/2+50, height-130, width-(width/6)+50, height-50, width-(width/8)+50, height-50);

  line(width/2, 100, width/2, height-50);
  line(width/8, 100, width/8, height-100);
  line(width/2+50, height-50, width/2-50, height-50);
  line(width-width/8, 100, width-width/8, height-100);
  line(width/8-50, height-50, width/8-50, 150); 
  line(width-(width/8)+50, height-50, width-(width/8)+50, 150);
  line(width/8, height-100, width/8-50, height-50);
  line(width/8-50, 150, width/8, 100);
  line(width-(width/8)+50, 150, width-width/8, 100);
  line(width-width/8, height-100, width-(width/8)+50, height-50);
}
