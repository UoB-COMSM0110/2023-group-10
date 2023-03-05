class Planet{
  private float centreX;
  private float centreY;
  private float radius; 
  private int colourR;
  private int colourG;
  private int colourB;
  // Constructor for random planet when passed no variables -- TO DO: add checks for no overlap, if overlap found, redo random numbers
  public Planet(){
    //do{
      // don't want any random planet to be any larger than a quarter of the smallest side
      if(width>height){
        radius = random(height/8);
      }
      else{
        radius = random(width/8);      
      }
      centreX = random(radius, width-radius);
      centreY = random(radius, height-radius);
    //} while(checkImpact(centreX, centreY, radius));
    colourR = int(random(256));
    colourG = int(random(256));
    colourB = int(random(256));
  }
  
  // Constructor with exact centre coordinates and radius
  public Planet(float setX, float setY, float setR){
    centreX = setX;
    centreY = setY;
    radius = setR;
    colourR = int(random(256));
    colourG = int(random(256));
    colourB = int(random(256));
  }
  
  //private boolean checkOverlap(x, y, r){
    
  //  return false;
  //}
  public float getRadius(){
    return radius;
  }
  public float getCentreX(){
    return centreX;
  }
  public float getCentreY(){
    return centreY;
  }
  
  // draws a randomly coloured circle to show the planet
  private void displayPlanet(){
    noStroke();
    fill(colourR, colourG, colourB);
    ellipse(centreX, centreY, radius*2, radius*2);
  }
}
