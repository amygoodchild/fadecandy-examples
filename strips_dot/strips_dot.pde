OPC opc;
PImage dot;

void setup()
{
  size(600, 300);

  // Load a sample image
  dot = loadImage("color-dot.png");

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map 8 strips of 15 pixels each
  
  // Index of first pixel
  // number of pixels in the strip
  // x location of centre of strip
  // y location of centre of strip
  // spacing of pixels
  // angle (in radians, 0 is horizontal)
  // direction (false is left to right)
  
  for (int i = 0; i< 8; i++){
    opc.ledStrip(i*64, 15, width/2, i*15 + 30, 15, 0, false);
  }
}

void draw()
{
  background(0);

  float dotSize = width*0.2;
  image(dot, mouseX- dotSize/2, mouseY - dotSize -2, dotSize, dotSize);
}
