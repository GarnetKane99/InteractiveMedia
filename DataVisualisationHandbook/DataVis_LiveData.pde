boolean hasSetupLiveData = false;
int peopleFound = 0;
int curDay = 0, prevDay = 0;
ControlP5 DataController;
Button liveDataBack;
Slider dataByDay;

Table peopleData;

String curDayText = "MONDAY", prevDayText = "MONDAY";

void setupLiveData() {
  DataController = new ControlP5(this);
  //data from march 9 2020 - march 15 2020
  peopleData = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2020-03-09T00%3A00&rToDate=2020-03-15T23%3A59%3A59&rFamily=people&rSensor=+PC00.06+%28In%29", "csv");
  drawBook();
  setupLiveDataUI();
  drawUTS();
  dataDescription();
  dataDay();
  drawPeople(peopleFound);
  fill(0);
  textFont(DrawFont);
  text(curDayText, 300, height-250);
}

void setupLiveDataUI() {
  liveDataBack = DataController.addButton("LiveDataBack")
    .setPosition(225, height - 200)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setFont(Bahnschrift)
    .setCaptionLabel("BACK TO MENU")
    .setSize(150, 75);

  dataByDay = DataController.addSlider("dataDay").setBroadcast(false)
    .setPosition(300, height-350)
    .setSize(400, 50)
    .setRange(0, 6)
    .setNumberOfTickMarks(7)
    .setColorForeground(0xffAFAFAF)
    .setCaptionLabel("")
    .setColorBackground(0)
    .setColorActive(color(0, 144, 221))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true);
  dataByDay.getCaptionLabel().setVisible(false);
  dataByDay.getValueLabel().setVisible(false);
}

void dataDay() {
  int multiplier = (int)dataByDay.getValue();
  int rowInADay = 48;
  peopleFound = 0;
  curDay = multiplier;
  for (int i = rowInADay * multiplier; i < (rowInADay * multiplier) + 48; i++) {
    if (i < 288) {
      peopleFound += (int)peopleData.getFloat(i, 1);
    }
  }
  if (prevDay != curDay) {
    resetBook();
    drawUTS();
    drawPeople(peopleFound);
    prevDay = curDay;
  }
}

void resetBook() {
  pushMatrix();
  stroke(0, 0, 0);
  strokeWeight(4);

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
  popMatrix();
}

void drawPeople(int toCount) {
  for (int i = 0; i < toCount; i++) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(2);
    float randX = random(900, 1350);
    float randY = random(300, 650);
    int randSize = (int)random(1, 8);
    ellipse(randX, randY, randSize, randSize);
  }
}

void drawData() {
  pushMatrix();
  switch((int)dataByDay.getValue()) {
  case 0:
    //text("MONDAY", 300, height-200);
    curDayText = "MONDAY";
    break;
  case 1:
    curDayText = "TUESDAY";
    break;
  case 2:
    curDayText = "WEDNESDAY";
    break;
  case 3:
    curDayText = "THURSDAY";
    break;
  case 4:
    curDayText = "FRIDAY";
    break;
  case 5:
    curDayText = "SATURDAY";
    break;
  case 6:
    curDayText = "SUNDAY";
    break;
  }
  if (prevDayText != curDayText) {
    pushMatrix();
    stroke(0, 0, 0);
    strokeWeight(4);
    //left side of book
    beginShape();
    fill(#D6A965);
    vertex(width/2, 100);
    bezierVertex(width/2, 10, width/6, 100, width/8, 100);
    vertex(width/8, 100);
    vertex(width/8, height-100);
    bezierVertex(width/6, height-100, width/2, height-180, width/2, height-50);
    endShape();
    line(width/2, 100, width/2, height-50);
    popMatrix();
    dataDescription();
    textFont(DrawFont);
    text(curDayText, 300, height-250);
    prevDayText = curDayText;
  }
  popMatrix();
}

void LiveDataBack() {
  hideLiveDataUI();
  background(255);
  DataMode = false;
  drawBook();
  showUI();
}

void hideLiveDataUI() {
  liveDataBack.hide();
  dataByDay.hide();
}

void showLiveDataUI() {
  drawBook();
  liveDataBack.show();
  dataByDay.show();
  drawUTS();
  dataDescription();
}

void dataDescription() {
  strokeWeight(2);
  fill(0);
  textFont(Chimken);
  text("Dotted People", width/5, 200);
  textFont(titleFont);
  text("This page collects data from UTS\neif-Research. The data collected is from\nthe people counter sensor.", width/6, 250);
  text("I used a week (March 9 2020 - March 15\n2020) and calculated the total number of\nvisitors on the selected day and", width/6, 350);
  text("transformed them into ellipses that is\nprocedurally placed on the UTS building\n11 to make up the 'grater' design", width/6, 440);
}

void drawUTS() {
  beginShape();
  fill(200);
  strokeWeight(3);
  vertex(900, 300);
  vertex(1100, 200);
  vertex(1350, 350);
  vertex(1350, 650);
  vertex(1100, 700);
  vertex(1100, 200);
  vertex(1100, 700);
  vertex(900, 650);
  vertex(900, 300);
  endShape();
  pushMatrix();
  fill(0);
  textFont(Chimken);
  translate(1000, 290);
  rotate(radians(340));
  text("UTS", 0, 0);
  popMatrix();
}
