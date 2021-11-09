boolean hasSetupImage = false, canDraw = false;
PImage UTSBuilding11, Harbour, Opera;
Walker[] walkersInScene = new Walker[200];

AudioContext imageAudio;
ControlP5 ImageController;
Button Building11, HarbourBridge, OperaHouse, ImageBack;
boolean b11 = false, hb = false, oh = false;

void setupImage() {
  ImageController = new ControlP5(this);
  for (int i = 0; i < walkersInScene.length; i++)
  {
    walkersInScene[i] = new Walker(new PVector(width/2, height/2), new PVector(width/2, height/2), random(0, 1) > 0.5 ? 1 : -1, 0, random(3, 10));
  }
  hasSetupImage = true;
  ImageUISetup();
}

void ImageUISetup() {
  Building11 = ImageController.addButton("building11")
    .setPosition(width/3 - 200, height/2)
    .setFont(Bahnschrift)
    .setColorBackground(0xff660000)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setSize(200, 75)
    .setCaptionLabel("Building 11");

  HarbourBridge = ImageController.addButton("harbourBridge")
    .setPosition(width/2-100, height/2)
    .setFont(Bahnschrift)
    .setColorBackground(0xff660000)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setSize(200, 75)
    .setCaptionLabel("Harbour Bridge");

  OperaHouse = ImageController.addButton("operaHouse")
    .setPosition(width/2+300, height/2)
    .setFont(Bahnschrift)
    .setColorBackground(0xff660000)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setSize(200, 75)
    .setCaptionLabel("Opera House");

  ImageBack = ImageController.addButton("imageBack")
    .setPosition(width/2-90, height - 100)
    .setFont(Bahnschrift)
    .setColorBackground(0xff660000)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setCaptionLabel("BACK TO MENU")
    .setSize(200, 75);
}

void building11() {
  b11 = true;
  HideImageUI(false);
  background(255);
  UTSBuilding11 = loadImage(sketchPath("Images/")+"Building11.jpg");
  UTSBuilding11.loadPixels();
  canDraw = true;
}

void harbourBridge() {
  hb = true;
  HideImageUI(false);
  background(255);
  Harbour = loadImage(sketchPath("Images/")+"HarbourBridge.jpg");
  Harbour.loadPixels();
  canDraw = true;
}

void operaHouse() {
  oh = true;
  HideImageUI(false);
  background(255);
  Opera = loadImage(sketchPath("Images/")+"OperaHouse.jpg");
  Opera.loadPixels();
  canDraw = true;
}

void imageBack() {
  HideImageUI(true);
  background(255);
  canDraw = false;
  hasSetupImage = false;
  ImageMode = false;
  drawBook();
  showUI();
}

void HideImageUI(boolean back) {
  if (back) {
    ImageBack.hide();
    b11 = false;
    hb = false;
    oh = false;
  }
  Building11.hide();
  HarbourBridge.hide();
  OperaHouse.hide();
}

void DrawImage()
{
  for (int i = 0; i < walkersInScene.length; i++)
  {
    Walker tempWalker = walkersInScene[i];
    tempWalker.angle += 1 / tempWalker.radius * tempWalker.DirectionToGo;
    tempWalker.CurrentPos.x += cos(tempWalker.angle) * tempWalker.radius;
    tempWalker.CurrentPos.y += sin(tempWalker.angle) * tempWalker.radius;

    if (brightness(imageReturn().get((int)round(tempWalker.CurrentPos.x), (int)round(tempWalker.CurrentPos.y))) > 70 || tempWalker.CurrentPos.x < 0
      || tempWalker.CurrentPos.x > width || tempWalker.CurrentPos.y < 0 || tempWalker.CurrentPos.y > height)
    {
      tempWalker.DirectionToGo *= -1;
      tempWalker.radius = random(3, 10);
      tempWalker.angle += PI;
    }

    stroke(imageReturn().get((int)tempWalker.CurrentPos.x, (int)tempWalker.CurrentPos.y));
    line(tempWalker.PreviousPos.x, tempWalker.PreviousPos.y, tempWalker.CurrentPos.x, tempWalker.CurrentPos.y);
    tempWalker.PreviousPos.x = tempWalker.CurrentPos.x;
    tempWalker.PreviousPos.y = tempWalker.CurrentPos.y;
  }
}

PImage imageReturn() {
  if (b11)
    return UTSBuilding11;
  else if (hb)
    return Harbour;
  else
    return Opera;
}

class Walker {
  PVector CurrentPos;
  PVector PreviousPos;
  int DirectionToGo;
  float radius;
  float angle;

  Walker(PVector startPos, PVector prevPos, int Dir, float ang, float rad)
  {
    CurrentPos = startPos;
    PreviousPos = prevPos;
    DirectionToGo = Dir;
    angle = ang;
    radius = rad;
  }
}
