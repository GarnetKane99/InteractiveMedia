boolean hasSetupCanvas = false;
ControlP5 DrawingController;
Button drawingBack;
Slider brushSize;

color currentPenColour = 1;
color black = color(1, 1, 1), red = color(255, 0, 0), blue = color(0, 0, 255), greenLight = color(0, 255, 0), 
  yellow = color(255, 255, 0), pink = color(255, 0, 255), blueLight = color(0, 255, 255), orange = color(255, 200, 0), 
  green = color(0, 150, 0), purple = color(100, 0, 100), warmPink = color(219, 139, 199), maroon = color(144, 35, 44), brown = color(144, 132, 35), 
  teal = color(35, 144, 83), white = color(254, 254, 254);

void setupCanvas() {
  DrawingController = new ControlP5(this);
  drawBook();
  pushMatrix();
  noStroke();
  fill(255);
  rect(width/2+300, height/3+125, width/4+5, height/3+250);
  noFill();
  stroke(0);
  strokeWeight(5);
  rect(width/2+300, height/3+125, width/4+5, height/3+250);
  popMatrix();

  textFont(ColourPalette);
  fill(0);
  text("SELECT A COLOUR!", width/5, 200);

  CreateColours();
  drawingUI();
}

void CreateColours() {
  pushMatrix();
  noStroke();
  fill(black);
  ellipse(width/5, 300+ random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/5 + random(-30, 30), 300 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(blue);
  ellipse(width/4, 300 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4 + random(-30, 30), 300 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(red);
  ellipse(width/4+100, 300+ random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+100 + random(-30, 30), 300 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(greenLight);
  ellipse(width/4+200, 300+ random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+200 + random(-30, 30), 300 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(yellow);
  ellipse(width/4+300, 300+ random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+300 + random(-30, 30), 300 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(pink);
  ellipse(width/5, 400 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/5 + random(-30, 30), 400 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(blueLight);
  ellipse(width/4, 400 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4 + random(-30, 30), 400 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(orange);
  ellipse(width/4+100, 400 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+100 + random(-30, 30), 400 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(green);
  ellipse(width/4+200, 400 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+200 + random(-30, 30), 400 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(purple);
  ellipse(width/4+300, 400 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+300 + random(-30, 30), 400 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(warmPink);
  ellipse(width/5, 500+ random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/5 + random(-30, 30), 500 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(maroon);
  ellipse(width/4, 500 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4 + random(-30, 30), 500 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(brown);
  ellipse(width/4+100, 500 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+100 + random(-30, 30), 500 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(teal);
  ellipse(width/4+200, 500 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+200 + random(-30, 30), 500 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(white);
  ellipse(width/4+300, 500 + random(-30, 30), random(25, 50), random(25, 50));
  for (int i = 0; i < random(1, 6); i++) {
    ellipse(width/4+300 + random(-30, 30), 500 + random(-30, 30), random(5, 15), random(5, 15));
  }

  fill(0);
  textFont(DrawFont);
  text("Brush weight:", width/7, height-250);

  popMatrix();
}

void drawingUI() {
  brushSize = DrawingController.addSlider("brushThickness").setBroadcast(false)
    .setPosition(width/7+300, height-265)
    .setRange(0, 100)
    .setSize(250, 10)
    .setColorForeground(0xffAFAFAF)
    .setColorBackground(0)
    .setColorActive(color(0, 144, 221))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true);
  brushSize.getCaptionLabel().setVisible(false);
  brushSize.getValueLabel().setVisible(false);
  brushThickness();

  drawingBack = DrawingController.addButton("drawBack")
    .setPosition(225, height - 200)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setFont(Bahnschrift)
    .setCaptionLabel("BACK TO MENU")
    .setSize(150, 75);
}

void drawBack() {
  hideDrawUI();
  background(255);
  hasSetupCanvas = false;
  DrawingMode = false;
  drawBook();
  showUI();
}

void hideDrawUI() {
  brushSize.hide();
  drawingBack.hide();
}

void mousePressed() {  
  if (mouseButton == LEFT && DrawingMode && mouseX < width/2) {
    int[] pixelsFound = get().pixels;
    if (pixelsFound[mouseX+mouseY * width] == black) {
      currentPenColour = black;
    } else if (pixelsFound[mouseX+mouseY * width] == red) {
      currentPenColour = red;
    } else if (pixelsFound[mouseX+mouseY * width] == blue) {
      currentPenColour = blue;
    } else if (pixelsFound[mouseX+mouseY * width] == greenLight) {
      currentPenColour = greenLight;
    } else if (pixelsFound[mouseX+mouseY * width] == yellow) {
      currentPenColour = yellow;
    } else if (pixelsFound[mouseX+mouseY * width] == pink) {
      currentPenColour = pink;
    } else if (pixelsFound[mouseX+mouseY * width] == blueLight) {
      currentPenColour = blueLight;
    } else if (pixelsFound[mouseX+mouseY * width] == orange) {
      currentPenColour = orange;
    } else if (pixelsFound[mouseX+mouseY * width] == green) {
      currentPenColour = green;
    } else if (pixelsFound[mouseX+mouseY * width] == purple) {
      currentPenColour = purple;
    } else if (pixelsFound[mouseX+mouseY * width] == warmPink) {
      currentPenColour = warmPink;
    } else if (pixelsFound[mouseX+mouseY * width] == maroon) {
      currentPenColour = maroon;
    } else if (pixelsFound[mouseX+mouseY * width] == brown) {
      currentPenColour = brown;
    } else if (pixelsFound[mouseX+mouseY * width] == teal) {
      currentPenColour = teal;
    } else if (pixelsFound[mouseX+mouseY * width] == white) {
      currentPenColour = white;
    }
    brushThickness();
  }
}

void drawingOnCanvas() {
  if (mousePressed && mouseX > width/2 + 100 && mouseX < width-300 && mouseY > 150 && mouseY < height-200 && DrawingMode) {
    pushMatrix();
    stroke(currentPenColour);
    strokeWeight(brushSize.getValue()/2);
    line(pmouseX, pmouseY, mouseX, mouseY);
    popMatrix();
  }
}

void brushThickness() {
  pushMatrix();
  noStroke();
  fill(#D6A965);
  rect(width/7+200, height-200, 50, 50);
  fill(currentPenColour);
  strokeWeight(2);
  ellipseMode(CENTER);
  if (brushSize.getValue() <= 10)
  {
    ellipse(width/7+225, height-175, 5, 5);
  } else {
    ellipse(width/7+225, height-175, brushSize.getValue()/2, brushSize.getValue()/2);
  }
  popMatrix();
}
