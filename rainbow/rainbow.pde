OPC opc;
float hue = 0;
int numOfStrips = 50;
Strip[] strips;

void setup()
{
  size(600, 400);
  //fullScreen();
  colorMode(HSB,360);
  
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map 8 strips of 15 pixels
  
  for (int i=0; i<8; i++){
    opc.ledStrip(i*64, 15, width/2, (i*30)+50, 30, 0, false); 
  }
  
  strips = new Strip[numOfStrips];
  
  for (int i=0; i <numOfStrips; i++){
    strips[i] = new Strip(i*(360/numOfStrips), i*width/(numOfStrips)) ; 
  }
  
  noStroke();
  

}

void draw()
{
  background(0);
  
  for (int i=0; i <numOfStrips; i++){
    strips[i].move();
    strips[i].display();   
  }
}
