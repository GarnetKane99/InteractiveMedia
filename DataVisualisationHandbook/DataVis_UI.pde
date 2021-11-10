Button AudioVis, ImageManipulation, Illusions, CamFilter, Drawing, LiveData;
ControlP5 Controller;

void UISetup() {
  AudioVis = Controller.addButton("AudioVisualisation")
    .setPosition(width/8+50, height/2-200)
    .setCaptionLabel("Audio Visualisation")
    .setColorBackground(#D6A965)
    .setFont(Chimken)
    .setSize(500, 60);

  ImageManipulation = Controller.addButton("ImageVisualisation")
    .setPosition(width/8+50, height/2-50)
    .setCaptionLabel("Image Manipulation")
    .setColorBackground(#D6A965)
    .setFont(Chimken)
    .setSize(500, 60);

  Illusions = Controller.addButton("OpticalIllusions")
    .setPosition(width/8+50, height/2 + 100)
    .setCaptionLabel("Optical Illusions")
    .setColorBackground(#D6A965)
    .setFont(Chimken)
    .setSize(450, 60);

  CamFilter = Controller.addButton("CameraFilters")
    .setPosition(width/2+100, height/2 -200)
    .setCaptionLabel("Camera Filters")
    .setColorBackground(#D6A965)
    .setFont(Chimken)
    .setSize(400, 60);

  Drawing = Controller.addButton("drawing")
    .setPosition(width/2+100, height/2-50)
    .setCaptionLabel("Drawing")
    .setColorBackground(#D6A965)
    .setFont(Chimken)
    .setSize(250, 60);

  LiveData = Controller.addButton("LiveData")
    .setPosition(width/2+100, height/2+100)
    .setCaptionLabel("Live Data")
    .setColorBackground(#D6A965)
    .setFont(Chimken)
    .setSize(250, 60);

  fill(255);
  textFont(Glossary);
  text("GLOSSARY", width/8+50, height/2-250);
}

void AudioVisualisation() {
  background(255);
  hideUI();
  AudioMode = true;
  if (!hasSetupAudio) {
    setupAudio();
    drawBook();
  } else {
    showAudioUI();
    drawBook();
    unpauseInstruments();
  }
}

void ImageVisualisation() {
  background(255);
  hideUI();
  ImageMode = true;
  if (!hasSetupImage) {
    setupImage();
  }
}

void CameraFilters() {
  background(255);
  hideUI();
  CameraMode = true;
  if (!hasSetupCam) {
    setupCam();
  } else {
    showCamUI();
  }
}

void drawing() {
  background(255);
  hideUI();
  DrawingMode = true;
  if (!hasSetupCanvas) {
    setupCanvas();
  }
}

void OpticalIllusions(){
  background(255);
  hideUI();
  IllusionMode = true;
  if(!hasSetupIllusions){
   setupIllusions(); 
  }
}

void hideUI() {
  AudioVis.hide();
  ImageManipulation.hide();
  Illusions.hide();
  CamFilter.hide();
  Drawing.hide();
  LiveData.hide();
}

void showUI() {
  AudioVis.show();
  ImageManipulation.show();
  Illusions.show();
  CamFilter.show();
  Drawing.show();
  LiveData.show();
  fill(255);
  textFont(Glossary);
  text("GLOSSARY", width/8+50, height/2-250);
}
