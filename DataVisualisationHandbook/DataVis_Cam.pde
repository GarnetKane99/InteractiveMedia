boolean hasSetupCam = false;

Capture camCapture;
//will handle the different filters
boolean pixelate = false, greyScale = false, sepia = false, noFilter = true, invert = false;
ControlP5 CameraController;
Button Pixelate, GreyScale, Sepia, NoFilter, Invert, CameraBack;

void setupCam() {
  CameraController = new ControlP5(this);
  drawBook();
  cameraUI();
  String[] camsFound = Capture.list();
  if (camsFound.length == 0) {
    cameraBack();
  } else {
    camCapture = new Capture(this, width/4, height/3, camsFound[0]);
    camCapture.start();
  }
}

void cameraUI() {
  textFont(CamTitleFont);
  fill(0);
  text("Select a filter!", width/8+125, height/2-250);

  Pixelate = CameraController.addButton("PixelFilter")
    .setPosition(width/8+25, height/2-200)
    .setFont(CamFilterFont)
    .setColorBackground(#D6A965)
    .setColorForeground(#5F93A7)
    .setColorActive(#2F4750)
    .setColorLabel(#8BDFFF)
    .setSize(200, 75)
    .setCaptionLabel("Pixelate");

  GreyScale = CameraController.addButton("GreyScaleFilter")
    .setPosition(width/8+325, height/2-100)
    .setFont(CamFilterFont)
    .setColorBackground(#D6A965)
    .setColorForeground(#5F93A7)
    .setColorActive(#2F4750)
    .setColorLabel(#8BDFFF)
    .setSize(250, 75)
    .setCaptionLabel("GreyScale");

  Sepia = CameraController.addButton("SepiaFilter")
    .setPosition(width/8+25, height/2)
    .setFont(CamFilterFont)
    .setColorBackground(#D6A965)
    .setColorForeground(#5F93A7)
    .setColorActive(#2F4750)
    .setColorLabel(#8BDFFF)
    .setSize(150, 75)
    .setCaptionLabel("Sepia");

  Invert = CameraController.addButton("InvertFilter")
    .setPosition(width/8+325, height/2+100)
    .setFont(CamFilterFont)
    .setColorBackground(#D6A965)
    .setColorForeground(#5F93A7)
    .setColorActive(#2F4750)
    .setColorLabel(#8BDFFF)
    .setSize(175, 75)
    .setCaptionLabel("Invert");

  NoFilter = CameraController.addButton("noFilter")
    .setPosition(width/8+25, height/2+200)
    .setFont(CamFilterFont)
    .setColorBackground(#D6A965)
    .setColorForeground(#5F93A7)
    .setColorActive(#2F4750)
    .setColorLabel(#8BDFFF)
    .setSize(225, 75)
    .setCaptionLabel("No Filter");

  CameraBack = CameraController.addButton("cameraBack")
    .setPosition(width/2+400, height-200)
    .setFont(Bahnschrift)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setCaptionLabel("BACK TO MENU")
    .setSize(150, 75);
}

void PixelFilter() {
  pixelate = true; 
  greyScale = false;
  sepia = false;
  noFilter = false;
  invert = false;
}

void GreyScaleFilter() {
  pixelate = false; 
  greyScale = true;
  sepia = false;
  noFilter = false;
  invert = false;
}

void InvertFilter() {
  pixelate = false; 
  greyScale = false;
  sepia = false;
  noFilter = false;
  invert = true;
}

void SepiaFilter() {
  pixelate = false; 
  greyScale = false;
  sepia = true;
  noFilter = false;
  invert = false;
}

void noFilter() {
  pixelate = false; 
  greyScale = false;
  sepia = false;
  noFilter = true;
  invert = false;
}

void cameraBack() {
  if (camCapture != null) {
    camCapture.stop();
  }
  hideCameraUI();
  background(255);
  CameraMode = false;
  drawBook();
  showUI();
}

void hideCameraUI() {
  pixelate = false; 
  greyScale = false;
  sepia = false;
  noFilter = true;
  invert = false;
  Pixelate.hide();
  GreyScale.hide();
  Sepia.hide();
  NoFilter.hide();
  Invert.hide();
  CameraBack.hide();
}

void showCamUI() {
  CameraMode = true;
  Pixelate.show();
  GreyScale.show();
  Sepia.show();
  NoFilter.show();
  Invert.show();
  CameraBack.show();
}

void drawCam() {
  if (camCapture.available() == true) {
    camCapture.read();
    camCapture.loadPixels();
    imageMode(0);
    strokeWeight(4);
    stroke(#223993);
    noFill();
    rect(width/2+300, height/3+75, width/4+5, height/3+5);
    //pixelate is its own thing because i dont want the camera to be loaded in/take precedence
    if (pixelate) {
      for (int i = 0; i < 100; i++) {
        pushMatrix();
        noStroke();
        int xPos = (int)random(0, camCapture.width);
        int yPos = (int) random(0, camCapture.height);
        int location = (camCapture.width - xPos - 1) + yPos * camCapture.width;
        color c = camCapture.pixels[location];
        int pixelSize = (int)random(10, 20);
        int opacity = (int)random(150, 255);
        fill(c, opacity);
        rect((width/2+100)+xPos, (height/4)+yPos, pixelSize, pixelSize);
        popMatrix();
      }
    } else {
      if (greyScale) {
        camCapture.filter(GRAY);
      } else if (invert) {
        camCapture.filter(INVERT);
      } else if (sepia) {
        for (int i = 0; i < camCapture.pixels.length; i++) {
          color c = camCapture.pixels[i];
          float r = red(c)*0.393+green(c)*0.769+blue(c)*0.189;
          float g = red(c)*0.349+green(c)*0.686+blue(c)*0.168;
          float b = red(c)*0.272+green(c)*0.534+blue(c)*0.131;
          camCapture.pixels[i] = color(r, g, b);
        }
      }
      image(camCapture, width/2 + 100, height/4);
    }
  }
}
