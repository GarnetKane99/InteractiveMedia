//class specifically for all the audio data vis things
AudioContext drumAC, bassAC, guitarAC, keysAC;
SamplePlayer drums1, drums2, drums3, bass1, bass2, bass3, guitar1, guitar2, guitar3, keys1, keys2, keys3;
WavePlayer drums1A;
Gain drumsGain, bassGain, guitarGain, keysGain;
Glide drumsValue, bassValue, guitarValue, keysValue;
Knob guitarOut, drumsOut, keysOut, bassOut;

PImage drumsImg, bassImg, guitarImg, keysImg;
//audio specific controller
ControlP5 audioController;
Button drumB1, drumB2, drumB3, bassB1, bassB2, bassB3, guitarB1, guitarB2, guitarB3, keysB1, keysB2, keysB3, audioBack;
boolean hasSetupAudio = false;

float keysLevel, bassLevel, drumsLevel, guitarLevel;

void setupAudio() {
  keysLevel = 50;
  bassLevel = 50;
  drumsLevel = 50;
  guitarLevel =50;

  drumAC = new AudioContext();
  bassAC = new AudioContext();
  guitarAC = new AudioContext();
  keysAC = new AudioContext();
  audioController = new ControlP5(this);

  try {
    drums1 =  new SamplePlayer(drumAC, new Sample(sketchPath("Audio/") + "Drums1.mp3"));
    drums2 =  new SamplePlayer(drumAC, new Sample(sketchPath("Audio/") + "Drums2.mp3"));
    drums3 =  new SamplePlayer(drumAC, new Sample(sketchPath("Audio/") + "Drums3.mp3"));
    bass1 = new SamplePlayer(bassAC, new Sample(sketchPath("Audio/") + "Bass1.mp3"));
    bass2 = new SamplePlayer(bassAC, new Sample(sketchPath("Audio/") + "Bass2.mp3"));
    bass3 = new SamplePlayer(bassAC, new Sample(sketchPath("Audio/") + "Bass3.mp3"));
    guitar1 = new SamplePlayer(guitarAC, new Sample(sketchPath("Audio/") + "Guitar1.mp3"));
    guitar2 = new SamplePlayer(guitarAC, new Sample(sketchPath("Audio/") + "Guitar2.mp3"));
    guitar3 = new SamplePlayer(guitarAC, new Sample(sketchPath("Audio/") + "Guitar3.mp3"));
    keys1 = new SamplePlayer(keysAC, new Sample(sketchPath("Audio/") + "Keys1.mp3"));
    keys2 = new SamplePlayer(keysAC, new Sample(sketchPath("Audio/") + "Keys2.mp3"));
    keys3 = new SamplePlayer(keysAC, new Sample(sketchPath("Audio/") + "Keys3.mp3"));
  }
  catch(Exception E) {
    println("Attempting to load file");
  }

  //so that instruments can loop
  drums1.setKillOnEnd(false);
  drums1.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  drums2.setKillOnEnd(false);
  drums2.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  drums3.setKillOnEnd(false);
  drums3.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  bass1.setKillOnEnd(false);
  bass1.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  bass2.setKillOnEnd(false);
  bass2.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  bass3.setKillOnEnd(false);
  bass3.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  guitar1.setKillOnEnd(false);
  guitar1.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  guitar2.setKillOnEnd(false);
  guitar2.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  guitar3.setKillOnEnd(false);
  guitar3.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  keys1.setKillOnEnd(false);
  keys1.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  keys2.setKillOnEnd(false);
  keys2.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  keys3.setKillOnEnd(false);
  keys3.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);

  //audio setup
  drumsValue = new Glide(drumAC, 1, 0);
  bassValue = new Glide(bassAC, 1, 0);
  guitarValue = new Glide(guitarAC, 1, 0);
  keysValue = new Glide(keysAC, 1, 0);

  drumsGain = new Gain(drumAC, 1, drumsValue);
  bassGain = new Gain(bassAC, 1, bassValue);
  guitarGain = new Gain(guitarAC, 1, guitarValue);
  keysGain = new Gain(keysAC, 1, keysValue);

  drumsGain.addInput(drums1);
  bassGain.addInput(bass1);
  guitarGain.addInput(guitar1);
  keysGain.addInput(keys1);

  //add audio input to sample so that they exist
  drumsGain.addInput(drums2);
  drumsGain.addInput(drums3);
  bassGain.addInput(bass2);
  bassGain.addInput(bass3);
  guitarGain.addInput(guitar2);
  guitarGain.addInput(guitar3);
  keysGain.addInput(keys2);
  keysGain.addInput(keys3);

  //by default, these audio are paused
  drums2.pause(true);
  drums3.pause(true);
  bass2.pause(true);
  bass3.pause(true);
  guitar2.pause(true);
  guitar3.pause(true);
  keys2.pause(true);
  keys3.pause(true);

  drumAC.out.addInput(drumsGain);
  bassAC.out.addInput(bassGain);
  guitarAC.out.addInput(guitarGain);
  keysAC.out.addInput(keysGain);
  drumAC.start();
  bassAC.start();
  guitarAC.start();
  keysAC.start();
  GetInstruments();
  AudioUISetup();
  hasSetupAudio = true;
}

void GetInstruments()
{
  drumsImg = loadImage(sketchPath("Images/")+"Drums.png");
  bassImg = loadImage(sketchPath("Images/")+"Bass.png");
  guitarImg = loadImage(sketchPath("Images/")+"Guitar.png");
  keysImg = loadImage(sketchPath("Images/")+"Keys.png");
}

void UpdateInstruments() {
  AudioBook();
  drumsValue.setValue(drumsLevel/10);
  bassValue.setValue(bassLevel/10);
  keysValue.setValue(keysLevel/10);
  guitarValue.setValue(guitarLevel/10);
  float drumOffset = (float)((1+drumAC.out.getValue()));
  float bassOffset = (float)((1+bassAC.out.getValue()));
  float guitarOffset = (float)((1+guitarAC.out.getValue()));
  float keysOffset = (float)((1+keysAC.out.getValue()));

  imageMode(CENTER);
  if (drumsLevel > 1)
    image(drumsImg, width/8+150, height/2-200, drumsLevel * 2 + (drumOffset * 30), drumsLevel * 2 + (drumOffset * 30));
  else
    image(drumsImg, width/8+150, height/2-200, 0, 0);
  if (bassLevel > 1)
    image(bassImg, 650, 250, bassLevel * 2 + (bassOffset * 30), bassLevel * 2 + (bassOffset * 30));
  else
    image(bassImg, 650, 250, 0, 0);
  if (guitarLevel > 1)
    image(guitarImg, width/8+150, height/2+100, guitarLevel * 2 + (guitarOffset * 30), guitarLevel * 2 + (guitarOffset * 30));
  else
    image(guitarImg, width/8+150, height/2+100, 0, 0);
  if (keysLevel > 1)
    image(keysImg, 650, height/2+100, keysLevel * 2 + (keysOffset * 30), keysLevel * 2 + (keysOffset * 30));
  else
    image(keysImg, 650, height/2+100, 0, 0);
}

void AudioBook() {
  fill(0);
  strokeWeight(2);
  textFont(BeatsBook);
  text("Beats Book!", width/2+100, height/2-300);

  textFont(InstrumentsFont);
  text("Drums:", width/2+50, height/2-200);
  text("Bass:", width/2+50, height/2-50);
  text("Guitar:", width/2+50, height/2+100);
  text("Keys:", width/2+50, height/2+250);

  stroke(0, 0, 0);
  strokeWeight(4);

  beginShape();
  fill(#D6A965);
  vertex(width/2, 100);
  bezierVertex(width/2, 10, width/6, 100, width/8, 100);
  vertex(width/8, 100);
  vertex(width/8, height-100);
  bezierVertex(width/6, height-100, width/2, height-180, width/2, height-50);
  endShape();

  line(width/2, 100, width/2, height-50);
}

void AudioUISetup() {
  drumB1 = audioController.addButton("DrumBeat1")
    .setPosition(width/2+200, height/2-235)
    .setCaptionLabel("D1")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  drumB2 = audioController.addButton("DrumBeat2")
    .setPosition(width/2+300, height/2-235)
    .setCaptionLabel("D2")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  drumB3 = audioController.addButton("DrumBeat3")
    .setPosition(width/2+400, height/2-235)
    .setCaptionLabel("D3")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  drumsOut = audioController.addKnob("drumsControl")
    .setPosition(width/2+490, height/2-275)
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(#4B2448)
    .setSize(100, 100)
    .setRange(-50, 50);
  drumsOut.getValueLabel().setVisible(false);
  drumsOut.getCaptionLabel().setVisible(false);

  bassB1 = audioController.addButton("BassBeat1")
    .setPosition(width/2+200, height/2-85)
    .setCaptionLabel("B1")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  bassB2 = audioController.addButton("BassBeat2")
    .setPosition(width/2+300, height/2-85)
    .setCaptionLabel("B2")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  bassB3 = audioController.addButton("BassBeat3")
    .setPosition(width/2+400, height/2-85)
    .setCaptionLabel("B3")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  bassOut = audioController.addKnob("bassControl")
    .setPosition(width/2+490, height/2-125)
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(#4B2448)
    .setSize(100, 100)
    .setRange(-50, 50);
  bassOut.getValueLabel().setVisible(false);
  bassOut.getCaptionLabel().setVisible(false);

  guitarB1 = audioController.addButton("GuitarBeat1")
    .setPosition(width/2+200, height/2+60)
    .setCaptionLabel("G1")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  guitarB2 = audioController.addButton("GuitarBeat2")
    .setPosition(width/2+300, height/2+60)
    .setCaptionLabel("G2")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  guitarB3 = audioController.addButton("GuitarBeat3")
    .setPosition(width/2+400, height/2+60)
    .setCaptionLabel("G3")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  guitarOut = audioController.addKnob("guitarControl")
    .setPosition(width/2+490, height/2+25)
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(#4B2448)
    .setSize(100, 100)
    .setRange(-50, 50);
  guitarOut.getValueLabel().setVisible(false);
  guitarOut.getCaptionLabel().setVisible(false);

  keysB1 = audioController.addButton("KeysBeat1")
    .setPosition(width/2+200, height/2+210)
    .setCaptionLabel("K1")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  keysB2 = audioController.addButton("KeysBeat2")
    .setPosition(width/2+300, height/2+210)
    .setCaptionLabel("K2")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  keysB3 = audioController.addButton("KeysBeat3")
    .setPosition(width/2+400, height/2+210)
    .setCaptionLabel("K3")
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(0)
    .setFont(AudioSelectorFont)
    .setSize(75, 50);

  keysOut = audioController.addKnob("keysControl")
    .setPosition(width/2+490, height/2+175)
    .setColorForeground(#E06DD9)
    .setColorBackground(#833E7F)
    .setColorActive(#4B2448)
    .setSize(100, 100)
    .setRange(-50, 50);
  keysOut.getValueLabel().setVisible(false);
  keysOut.getCaptionLabel().setVisible(false);

  audioBack = audioController.addButton("AudioBack")
    .setPosition(225, height - 200)
    .setColorBackground(#D6A965)
    .setColorForeground(0xffaa0000)
    .setColorActive(0xffff0000)
    .setFont(Bahnschrift)
    .setCaptionLabel("BACK TO MENU")
    .setSize(150, 75);
}

void keysControl() {
  if (keysOut!=null)
    keysLevel = keysOut.getValue()+50;
}

void bassControl() {
  if (bassOut!=null)
    bassLevel = bassOut.getValue()+50;
}

void guitarControl() {
  if (guitarOut!=null)
    guitarLevel = guitarOut.getValue()+50;
}

void drumsControl() {
  if (drumsOut!=null)
    drumsLevel = drumsOut.getValue()+50;
}

void DrumBeat1() {
  drums1.pause(false);
  drums2.pause(true);
  drums3.pause(true);
  drums1.setToLoopStart();
}
void DrumBeat2() {
  drums1.pause(true);
  drums2.pause(false);
  drums3.pause(true);
  drums2.setToLoopStart();
}
void DrumBeat3() {
  drums1.pause(true);
  drums2.pause(true);
  drums3.pause(false);
  drums3.setToLoopStart();
}

void BassBeat1() {
  bass1.pause(false);
  bass2.pause(true);
  bass3.pause(true);
  bass1.setToLoopStart();
}
void BassBeat2() {
  bass1.pause(true);
  bass2.pause(false);
  bass3.pause(true);
  bass2.setToLoopStart();
}
void BassBeat3() {
  bass1.pause(true);
  bass2.pause(true);
  bass3.pause(false);
  bass3.setToLoopStart();
}

void GuitarBeat1() {
  guitar1.pause(false);
  guitar2.pause(true);
  guitar3.pause(true);
  guitar1.setToLoopStart();
}
void GuitarBeat2() {
  guitar1.pause(true);
  guitar2.pause(false);
  guitar3.pause(true);
  guitar2.setToLoopStart();
}
void GuitarBeat3() {
  guitar1.pause(true);
  guitar2.pause(true);
  guitar3.pause(false);
  guitar3.setToLoopStart();
}

void KeysBeat1() {
  keys1.pause(false);
  keys2.pause(true);
  keys3.pause(true);
  keys1.setToLoopStart();
}
void KeysBeat2() {
  keys1.pause(true);
  keys2.pause(false);
  keys3.pause(true);
  keys2.setToLoopStart();
}
void KeysBeat3() {
  keys1.pause(true);
  keys2.pause(true);
  keys3.pause(false);
  keys3.setToLoopStart();
}
void AudioBack() {
  background(255);
  hideAudioUI();
  drawBook();
  pauseInstruments();
  showUI();
  AudioMode = false;
}

void pauseInstruments()
{
  keys1.pause(true);
  keys2.pause(true);
  keys3.pause(true);
  guitar1.pause(true);
  guitar2.pause(true);
  guitar3.pause(true);
  bass1.pause(true);
  bass2.pause(true);
  bass3.pause(true);
  drums1.pause(true);
  drums2.pause(true);
  drums3.pause(true);
}

void unpauseInstruments() {
  DrumBeat1();
  BassBeat1();
  KeysBeat1();
  GuitarBeat1();
}

void hideAudioUI() {
  drumB1.hide();
  drumB2.hide();
  drumB3.hide();
  drumsOut.hide();
  bassB1.hide();
  bassB2.hide();
  bassB3.hide();
  bassOut.hide();
  guitarB1.hide();
  guitarB2.hide();
  guitarB3.hide();
  guitarOut.hide();
  keysB1.hide();
  keysB2.hide();
  keysB3.hide();
  keysOut.hide();
  audioBack.hide();
}

void showAudioUI() {
  drumB1.show();
  drumB2.show();
  drumB3.show();
  drumsOut.show();
  bassB1.show();
  bassB2.show();
  bassB3.show();
  bassOut.show();
  guitarB1.show();
  guitarB2.show();
  guitarB3.show();
  guitarOut.show();
  keysB1.show();
  keysB2.show();
  keysB3.show();
  keysOut.show();
  audioBack.show();
}
