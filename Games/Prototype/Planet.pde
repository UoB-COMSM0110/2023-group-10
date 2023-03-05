class Planet{
  private Point position;
  private float radius; 
  private Color planet_color;
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
      position = new Point(random(radius, width-radius), random(radius, height-radius));
    //} while(checkImpact(centreX, centreY, radius));
    planet_color = new Color(int(random(256)), int(random(256)), int(random(256))); 
  }
  
  // Constructor with exact centre coordinates and radius
  public Planet(Point initPosition, float setR){
    position = initPosition;
    radius = setR;
    planet_color = new Color(int(random(256)), int(random(256)), int(random(256))); 
  }
  
  //private boolean checkOverlap(x, y, r){
    
  //  return false;
  //}
  
  public float getRadius(){
    return radius;
  }
  
  public Point getPosition(){
    return position;
  }
  
  // draws a randomly coloured circle to show the planet
  private void displayPlanet(){
    beginShape();
    noStroke();
    fill(planet_color.r, planet_color.g, planet_color.b);
    ellipse(position.x, position.y, radius*2, radius*2);
    endShape();
  }
}
