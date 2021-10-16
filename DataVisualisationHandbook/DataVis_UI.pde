Button AudioVis, TypographyVis, DrawingVis, 
  InteractiveExp;
ControlP5 Controller;

void UISetup()
{


  AudioVis = Controller.addButton("AudioVisualisation")
    .setPosition(width/6, height/2 - 240)
    .setCaptionLabel("Audio Visualisation")
    .setFont(calibri)
    .setSize(300, 60);

  TypographyVis = Controller.addButton("TypographyVisualisation")
    .setPosition(width/6, height/2 - 120)
    .setCaptionLabel("Typography Visualisation")
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

  setupAudio();
}

void hideUI()
{
  AudioVis.hide();
  TypographyVis.hide();
  DrawingVis.hide();
  InteractiveExp.hide();
}

void showUI()
{
}
