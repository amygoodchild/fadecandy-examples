class Strip{

  float hue;
  float x;
  float w;

  Strip(float hue_, int x_){
    
    hue = hue_;
    x = x_;
    w = width/numOfStrips+5;
  }
  
  
  void display(){
    fill(hue%360, 260, 200);
    noStroke();
    rect(x, 0, w, height);

  } 
  
  void move(){
    hue +=1;
    

    
  }
  

}
