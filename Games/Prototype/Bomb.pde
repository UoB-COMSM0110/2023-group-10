class Bomb
{
  private float xVelocity;
  private float yVelocity;
  private float xPos;
  private float yPos;
  private float k = 5;
  private int bombRadius = 10;
  private float fuse = 5*frameRate;
  private float explosionRadius = 10;
  private boolean exploded = false;
  
  // Bomb is created with velocity already at a specific x and y coordinate
  public Bomb(float initXVel, float initYVel, float x, float y)
  {
    xVelocity = initXVel;
    yVelocity = initYVel;
    xPos = x;
    yPos = y;
  }
  
  private void stepPosition()
  {
    xPos+=xVelocity;
    yPos+=yVelocity;
  }
  private void stepVelocity(Planet p)
  {
    // change velocity for gravity pull from a planet
    float xDistance = p.getCentreX()-xPos;
    float yDistance = p.getCentreY()-yPos;
    float planetDistance = sqrt(sq(xDistance) + sq(yDistance));
    float planetAngle;
    if(xDistance == 0){
      planetAngle=0;
    }
    else{
      planetAngle = tan(yDistance/xDistance);
    }
    
    float velocityToPlanet = k*p.getRadius()/sq(planetDistance);
    
    float xVelToPlanet = cos(planetAngle)*velocityToPlanet;
    float yVelToPlanet = sin(planetAngle)*velocityToPlanet;
          
    // work out the sign (+1 or -1) seperately to reduce confusion
    int xSign = round(xDistance/abs(xDistance));
    int ySign = round(yDistance/abs(yDistance));
    
    xVelocity += xSign*abs(xVelToPlanet);
    yVelocity += ySign*abs(yVelToPlanet);
  }
  
  private void checkImpacted(Planet p)
  {
    float xDistance = p.getCentreX()-xPos;
    float yDistance = p.getCentreY()-yPos;
    float planetDistance = sqrt(sq(xDistance) + sq(yDistance));
    if(planetDistance < p.getRadius() + bombRadius){
      exploded = true;
    }
  }
  
  public void stepBomb(ArrayList<Planet> ps)
  {
    for(int i = 0; i<ps.size(); i++){
      this.stepVelocity(ps.get(i));
      this.checkImpacted(ps.get(i));
    }
    this.stepPosition();
    fuse-=1;
    if(fuse<=0){
      exploded = true;
    }
  }
  
  public void displayBomb(){
    noStroke();
    fill(255, 255, 255);
    ellipse(xPos, yPos, bombRadius, bombRadius);
  }
  
  public boolean getExploded()
  {
    return exploded;  
  }
  public float getExplosionRadius()
  {
    return explosionRadius;  
  }
}
