//class specifically for all the audio data vis things
AudioContext ac;
SamplePlayer drums1, drums2, drums3, bass1, bass2, bass3, guitar1, guitar2, guitar3, keys1, keys2, keys3;
WavePlayer drums1A;
Gain drumsGain, bassGain, guitarGain, keysGain;
Glide drumsValue, bassValue, guitarValue, keysValue;

PImage drumsImg, bassImg, guitarImg, keysImg;
//audio specific controller
ControlP5 audioController;
Button drumB1, drumB2, drumB3, bassB1, bassB2, bassB3, guitarB1, guitarB2, guitarB3, keysB1, keysB2, keysB3;

void setupAudio() {
  ac = new AudioContext();
  audioController = new ControlP5(this);
}
