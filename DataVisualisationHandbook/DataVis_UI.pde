Button AudioVis, ImageManipulation, DrawingVis, InteractiveExp;
ControlP5 Controller;

void UISetup() {
  AudioVis = Controller.addButton("AudioVisualisation")
    .setPosition(width/6, height/2 - 240)
    .setCaptionLabel("Audio Visualisation")
    .setFont(calibri)
    .setSize(300, 60);

  ImageManipulation = Controller.addButton("ImageVisualisation")
    .setPosition(width/6, height/2 - 120)
    .setCaptionLabel("Image Manipulation")
    .setFont(calibri)
    .setSize(300, 60);

  DrawingVis = Controller.addButton("DrawingVisualisation")
    .setPosition(width/6, height/2)
    .setCaptionLabel("Drawing Visualisation")
    .setFont(calibri)
    .setSize(300, 60);

  InteractiveExp = Controller.addButton("InteractiveExperience")
    .setPosition(width/2+width/8, height/2 -240)
    .setCaptionLabel("Interactive Experience")
    .setFont(calibri)
    .setSize(300, 60);
}

void AudioVisualisation() {
  background(255);
  hideUI();
  AudioMode = true;
  if (!hasSetupAudio) {
    setupAudio();
  } else {
    showAudioUI();
    unpauseInstruments();
  }
}

void ImageVisualisation() {
  background(255);
  hideUI();
  ImageMode = true;
  if (!hasSetupImage) {
    setupImage();
  } else {
    //reset image things
  }
}

void hideUI() {
  AudioVis.hide();
  ImageManipulation.hide();
  DrawingVis.hide();
  InteractiveExp.hide();
}

void showUI() {
  AudioVis.show();
  ImageManipulation.show();
  DrawingVis.show();
  InteractiveExp.show();
}
