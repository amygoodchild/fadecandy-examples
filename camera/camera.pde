OPC opc;

import processing.video.*;

Capture video;
PImage prev;

float threshold = 25;

float motionX = 0;
float motionY = 0;

float lerpX = 0;
float lerpY = 0;


void setup()
{
  size(640, 360);

String[] cameras = Capture.list();
  printArray(cameras);
  
  // Check your camera list in the console to see what camera feed you need to grab (mine is 17)
  video = new Capture(this, cameras[17]);
  
  video.start();

 
  
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.showLocations(false);
  
  // Map 8 strips of 15 pixels each
  
  // Index of first pixel
  // number of pixels in the strip
  // x location of centre of strip
  // y location of centre of strip
  // spacing of pixels
  // angle (in radians, 0 is horizontal)
  // direction (false is left to right)
  
  for (int i = 0; i< 8; i++){
    opc.ledStrip(i*64, 15, width/2, i*40 + 30, 40, 0, false);
  }
  
  noStroke();
  
  fill(100,0,90);
  rect(0,0,width, height);
}

void captureEvent(Capture video) {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();
 
}

void draw()
{
  
  fill(100,0,90,20);
  rect(0,0,width, height);
  
  video.loadPixels();

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
     
     
      // If the red is over a certain brightness, draw this pixel as a pink colour
      // This works as a really basic way to two tone an image and make it nice and bold on the LEDs
      if  (r1 > 200){
       
        r1 = 200;
        g1 = 20;
        b1 = 255;
        
        fill(r1,g1,b1);
        rect(x,y,1,1);
      }
      
    }
  }
  
}
