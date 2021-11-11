boolean hasSetupIllusions = false;
ControlP5 illusionController;
Button illusionNext, illusionPrevious, illusionBack;
boolean shape1 = false, shape2 = false, shape3 = false, shape4 = false;
boolean hasDrawn = false;

void setupIllusions() {
  shape1 = true;
  shape2 = false;
  shape3 = false;
  shape4 = false;
  illusionController = new ControlP5(this);
  drawBook();
  setupIllusionUI();
  drawShapeOne();
  hasDrawn = true;
}

void setupIllusionUI() {
  illusionBack = illusionController.addButton("IllusionBack")
    .setPosition(225, height - 200)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setFont(Bahnschrift)
    .setCaptionLabel("BACK TO MENU")
    .setSize(150, 75);

  illusionNext = illusionController.addButton("IllusionNext")
    .setPosition(width-300, height-200)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setFont(Chimken)
    .setCaptionLabel(">>")
    .setSize(50, 50);

  illusionPrevious = illusionController.addButton("IllusionPrevious")
    .setPosition(width-400, height-200)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setFont(Chimken)
    .setCaptionLabel("<<")
    .setSize(50, 50);
}

void IllusionBack() {
  hideIllusionUI();
  background(255);
  hasSetupIllusions = false;
  IllusionMode = false;
  drawBook();
  showUI();
}

void IllusionNext() {
  if (shape1) {
    shape1 = false;
    shape2 = true;
  } else if (shape2) {
    shape2 = false;
    shape3 = true;
  } else if (shape3) {
    shape3 = false;
    shape4 = true;
  }
  hasDrawn = false;
  drawBook();
}

void IllusionPrevious() {
  if (shape2) {
    shape2 = false;
    shape1 = true;
  } else if (shape3) {
    shape3 = false;
    shape2 = true;
  } else if (shape4) {
    shape4 = false;
    shape3 = true;
  }
  hasDrawn = false;
  drawBook();
}

void hideIllusionUI() {
  illusionBack.hide();
  illusionNext.hide();
  illusionPrevious.hide();
}

void illusionDraw() {
  if (shape1) {
    pushMatrix();
    noStroke();
    fill(#D6A965);
    rect(width-400, height-200, 100, 100);
    illusionPrevious.hide();
    popMatrix();
  } else {
    illusionPrevious.show();
  }
  if (shape4) {
    pushMatrix();
    noStroke();
    fill(#D6A965);
    rect(width-300, height-200, 100, 100);
    illusionNext.hide();
    popMatrix();
  } else {
    illusionNext.show();
  }

  if (shape1 && !hasDrawn) {
    drawShapeOne();
    hasDrawn = true;
  } else if (shape2 && !hasDrawn) {
    drawShapeTwo();
    hasDrawn = true;
  } else if (shape3 && !hasDrawn) {
    drawShapeThree();
    hasDrawn = true;
  } else if (shape4 && !hasDrawn) {
    drawShapeFour();
    hasDrawn = true;
  }
}

void drawShapeOne() {
  pushMatrix();
  stroke(0);
  strokeWeight(4);
  //border
  fill(255);
  rect(width/3-50, height/2-50, 300, 300);

  fill(0);
  stroke(0);
  //shapes
  for (int x = 150, y = -137, i = 0; i < 10; i++, y+=25) {
    for (int xOffset = 50, j = 0; j < 5; j++) {
      if (i%2==0) {
        rect(width/3-x + (xOffset * j), height/2+y, 25, 25);
      } else if (i%3 == 0 && i != 9|| i == 7) {
        rect(width/3-x+13 + (xOffset * j), height/2+y, 25, 25);
      } else {
        rect(width/3-x-13 + (xOffset * j), height/2+y, 25, 25);
      }
    }
  }
  for (int i = 0; i < 2; i++) {
    for (int xOffset = 50, j = 0; j < 5; j++) {
      if (i == 0) {
        rect(width/3-150+(xOffset*j), height/2-187, 25, 25);
      } else {
        rect(width/3-137+(xOffset*j), height/2-162, 25, 25);
      }
    }
  }
  //these are the offset shapes so their sizes/placements will be hardcoded in
  rect(width/3-150-40, height/2-187, 15, 15);
  rect(width/3-137-50, height/2-162, 25, 25);
  rect(width/3-150-40, height/2-137, 15, 15);
  rect(width/3-150-40, height/2-87, 15, 15);
  rect(width/3-137-50, height/2-62, 25, 25);
  rect(width/3-150-40, height/2-37, 15, 15);
  rect(width/3-150-40, height/2+13, 15, 15);
  rect(width/3-137-50, height/2+38, 25, 25);
  rect(width/3-150-40, height/2+63, 15, 15);

  rect(width/3-150+240, height/2-187, 15, 25);
  rect(width/3-150+240, height/2-137, 15, 25);
  rect(width/3-163+250, height/2-112, 25, 25);
  rect(width/3-150+240, height/2-87, 15, 25);
  rect(width/3-150+240, height/2-37, 15, 25);
  rect(width/3-163+250, height/2-12, 25, 25);
  rect(width/3-150+240, height/2+13, 15, 25);
  rect(width/3-150+240, height/2+63, 15, 25);
  rect(width/3-163+250, height/2+88, 25, 25);

  stroke(150);
  for (int i = 0, x = -25; i < 11; x+=25) {
    line(width/4-65, height/3+x, width/3+100, height/3+x);
    i++;
  }

  strokeWeight(2);
  fill(0);
  textFont(Chimken);
  text("STRAIGHT LINES", width/5, 200);
  textFont(DrawFont);
  text("No, not the Silverchair song,\nit's just an optical illusion!", width/2+50, 200);
  text("All the lines in this image\nare perfectly straight, even\nif they don't seem that way!", width/2+50, 300);
  text("This illusion was created\nusing rects and lines", width/2+50, 450);

  popMatrix();
}

void drawShapeTwo() {
  pushMatrix();
  stroke(0);
  strokeWeight(3);
  line(width/4-65, height/3+50, width/3+100, height/3+50);
  //< top out
  line(width/4-65, height/3+50, width/4-35, height/3+20);
  line(width/4-65, height/3+50, width/4-35, height/3+80);
  //> top in
  line(width/3+100, height/3+50, width/3+70, height/3+20);
  line(width/3+100, height/3+50, width/3+70, height/3+80);

  line(width/4-65, height/3+150, width/3+100, height/3+150);
  //bottom left
  line(width/4-65, height/3+150, width/4-95, height/3+120);
  line(width/4-65, height/3+150, width/4-95, height/3+180);
  //bottom right
  line(width/3+100, height/3+150, width/3+130, height/3+120);
  line(width/3+100, height/3+150, width/3+130, height/3+180);

  strokeWeight(2);
  fill(0);
  textFont(Chimken);
  text("LENGTHY BOYS", width/5, 200);
  textFont(DrawFont);
  text("Okay, I know what you're\nthinking - but I assure you,\nthey are the exact same\nlength.", width/2+50, 200);
  text("They were created using the\n'line' primitive:", width/2+50, 350);
  textFont(titleFont);
  text("top line: line(width/4-65, height/3+50,\n              width/3+100, height/3+50)", width/2+50, 450);
  text("bot line: line(width/4-65, height/3+150,\n             width/3+100, height/3+150)", width/2+50, 550);

  popMatrix();
}

void drawShapeThree() {
  pushMatrix();
  fill(255);
  strokeWeight(5);
  stroke(0);
  rect(475, 500, 350, 350);
  noFill();
  stroke(0);
  strokeWeight(3);
  int offset = 50;
  line(300 + offset, height/2+85, 475 + offset, height/2-75);
  line(475 + offset, height/2-75, 545 + offset, height/2-5);
  line(545 + offset, height/2-5, 545 + offset, height/2+20);
  line(545 + offset, height/2+20, 400 + offset, height/2+145);
  line(545 + offset, height/2-5, 400 + offset, height/2+115);
  line(300 + offset, height/2+115, 475 + offset, height/2-40);

  line(475 + offset, height/2-40, 475 + offset, height/2-15);  
  line(475 + offset, height/2-15, 350 + offset, height/2+100);
  line(350 + offset, height/2+130, 507 + offset, height/2-7);

  line(475 + offset, height/2-15, 494 + offset, height/2+4);
  line(475 + offset, height/2-40, 508 + offset, height/2-7);

  ellipse(400 + offset, height/2+130, 20, 30);
  ellipse(300 + offset, height/2+100, 20, 30);
  ellipse(350 + offset, height/2+115, 20, 30);

  strokeWeight(2);
  fill(0);
  textFont(Chimken);
  text("WHAT THE FORK?", width/5, 200);
  textFont(DrawFont);
  text("This is just a shape illusion,\nI thought it looked cool.\n\nThis shape is famously\nknown as the 'Impossible\nTrident'", width/2+50, 200);
  text("This 'shape' was created\nusing ellipses and lines", width/2+50, 500);
  popMatrix();
}

void drawShapeFour() {
  pushMatrix();
  fill(0);
  rect(width/3-50, height/2-50, 300, 300);

  stroke(150);
  strokeWeight(13);
  for (int x = 0, i = -25; x < 6; i+=50) {
    line(width/4-65, height/3+i, width/3+100, height/3+i);
    x++;
  }

  for (int x = 0, i = -45; x < 6; i+= 50) {
    line(width/4+i, height/3-50, width/4+i, height/3+250);
    x++;
  }

  stroke(255);
  strokeWeight(5);
  fill(255);
  int squW = 6, squH = 6;
  for (int tempX = 0, x = -45; tempX < squW; x+=50) {
    for (int tempY = 0, y = -25; tempY < squH; y+=50) {
      ellipse(width/4+x, height/3+y, 15, 15);
      tempY++;
    }
    tempX++;
  }

  stroke(0);
  strokeWeight(10);
  noFill();
  rect(width/3-50, height/2-50, 300, 300);

  strokeWeight(2);
  fill(0);
  textFont(Chimken);
  text("BLACK DOTS?!", width/5, 200);
  textFont(DrawFont);
  text("Your eyes are a lie!\nNo really, there aren't any\ndots other than the white\nones! it's just a fancy illusion!", width/2+50, 200);
  text("I took a different approach\nfor this illusion - this one\nuses loops to generate the\nlines and ellipses rather than\nbeing hardcoded in.", width/2+50, 400); 
  popMatrix();
}
