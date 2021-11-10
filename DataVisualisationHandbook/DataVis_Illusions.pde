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
  }
}

void drawShapeOne() {
  //shape 1
  pushMatrix();
  stroke(0);
  strokeWeight(4);
  fill(255);
  rect(width/3-50, height/2-50, 300, 300);

  fill(0);
  stroke(0);
  rect(width/3-150, height/2-187, 25, 25);
  rect(width/3-137, height/2-162, 25, 25);
  rect(width/3-150, height/2-137, 25, 25);
  rect(width/3-163, height/2-112, 25, 25);
  rect(width/3-150, height/2-87, 25, 25);
  rect(width/3-137, height/2-62, 25, 25);
  rect(width/3-150, height/2-37, 25, 25);
  rect(width/3-163, height/2-12, 25, 25);
  rect(width/3-150, height/2+13, 25, 25);
  rect(width/3-137, height/2+38, 25, 25);
  rect(width/3-150, height/2+63, 25, 25);
  rect(width/3-163, height/2+88, 25, 25);

  rect(width/3-150-40, height/2-187, 15, 15);
  rect(width/3-137-50, height/2-162, 25, 25);
  rect(width/3-150-40, height/2-137, 15, 15);
  rect(width/3-150-40, height/2-87, 15, 15);
  rect(width/3-137-50, height/2-62, 25, 25);
  rect(width/3-150-40, height/2-37, 15, 15);
  rect(width/3-150-40, height/2+13, 15, 15);
  rect(width/3-137-50, height/2+38, 25, 25);
  rect(width/3-150-40, height/2+63, 15, 15);

  rect(width/3-150+50, height/2-187, 25, 25);
  rect(width/3-137+50, height/2-162, 25, 25);
  rect(width/3-150+50, height/2-137, 25, 25);
  rect(width/3-163+50, height/2-112, 25, 25);
  rect(width/3-150+50, height/2-87, 25, 25);
  rect(width/3-137+50, height/2-62, 25, 25);
  rect(width/3-150+50, height/2-37, 25, 25);
  rect(width/3-163+50, height/2-12, 25, 25);
  rect(width/3-150+50, height/2+13, 25, 25);
  rect(width/3-137+50, height/2+38, 25, 25);
  rect(width/3-150+50, height/2+63, 25, 25);
  rect(width/3-163+50, height/2+88, 25, 25);

  rect(width/3-150+100, height/2-187, 25, 25);
  rect(width/3-137+100, height/2-162, 25, 25);
  rect(width/3-150+100, height/2-137, 25, 25);
  rect(width/3-163+100, height/2-112, 25, 25);
  rect(width/3-150+100, height/2-87, 25, 25);
  rect(width/3-137+100, height/2-62, 25, 25);
  rect(width/3-150+100, height/2-37, 25, 25);
  rect(width/3-163+100, height/2-12, 25, 25);
  rect(width/3-150+100, height/2+13, 25, 25);
  rect(width/3-137+100, height/2+38, 25, 25);
  rect(width/3-150+100, height/2+63, 25, 25);
  rect(width/3-163+100, height/2+88, 25, 25);

  rect(width/3-150+150, height/2-187, 25, 25);
  rect(width/3-137+150, height/2-162, 25, 25);
  rect(width/3-150+150, height/2-137, 25, 25);
  rect(width/3-163+150, height/2-112, 25, 25);
  rect(width/3-150+150, height/2-87, 25, 25);
  rect(width/3-137+150, height/2-62, 25, 25);
  rect(width/3-150+150, height/2-37, 25, 25);
  rect(width/3-163+150, height/2-12, 25, 25);
  rect(width/3-150+150, height/2+13, 25, 25);
  rect(width/3-137+150, height/2+38, 25, 25);
  rect(width/3-150+150, height/2+63, 25, 25);
  rect(width/3-163+150, height/2+88, 25, 25);

  rect(width/3-150+200, height/2-187, 25, 25);
  rect(width/3-137+200, height/2-162, 25, 25);
  rect(width/3-150+200, height/2-137, 25, 25);
  rect(width/3-163+200, height/2-112, 25, 25);
  rect(width/3-150+200, height/2-87, 25, 25);
  rect(width/3-137+200, height/2-62, 25, 25);
  rect(width/3-150+200, height/2-37, 25, 25);
  rect(width/3-163+200, height/2-12, 25, 25);
  rect(width/3-150+200, height/2+13, 25, 25);
  rect(width/3-137+200, height/2+38, 25, 25);
  rect(width/3-150+200, height/2+63, 25, 25);
  rect(width/3-163+200, height/2+88, 25, 25);

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
  line(width/4-65, height/3-25, width/3+100, height/3-25);
  line(width/4-65, height/3, width/3+100, height/3);
  line(width/4-65, height/3+25, width/3+100, height/3+25);
  line(width/4-65, height/3+50, width/3+100, height/3+50);
  line(width/4-65, height/3+75, width/3+100, height/3+75);
  line(width/4-65, height/3+100, width/3+100, height/3+100);
  line(width/4-65, height/3+125, width/3+100, height/3+125);
  line(width/4-65, height/3+150, width/3+100, height/3+150);
  line(width/4-65, height/3+175, width/3+100, height/3+175);
  line(width/4-65, height/3+200, width/3+100, height/3+200);
  line(width/4-65, height/3+225, width/3+100, height/3+225);

  strokeWeight(2);
  fill(0);
  textFont(Chimken);
  text("STRAIGHT LINES", width/5, 200);
  textFont(DrawFont);
  text("No, not the Silverchair song,\nit's just an optical illusion!", width/2+50, 200);
  text("All the lines in that image\nare perfectly straight, even\nif they don't seem that way!", width/2+50, 300);
  text("This illusion was created\nusing rects and lines", width/2+50, 450);

  popMatrix();
}
