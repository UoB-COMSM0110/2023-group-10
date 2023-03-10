class Bomb
{
  private Velocity velocity;
  private Point position;
  private float k = 5;
  private int bombRadius = 10;
  private float fuse = 5*frameRate;
  private float explosionRadius = 10;
  private boolean exploded = false;
  
  // Bomb is created with velocity already at a specific x and y coordinate
  public Bomb(Velocity initVelocity, Point initPosition)
  {
    this.velocity = initVelocity;
    this.position = initPosition;
  }
  
  private void stepPosition()
  {
    this.position = this.position.add(this.velocity);
  }
  
  private void stepVelocity(Planet p)
  {
    float planetDistance = p.position.getDistance(this.position);
    float planetAngle = p.position.getAngle(this.position);
    
    float velocityToPlanet = k*p.getRadius()/sq(planetDistance);
    
    float xVelToPlanet = cos(planetAngle)*velocityToPlanet;
    float yVelToPlanet = sin(planetAngle)*velocityToPlanet;
          
    // work out the sign (+1 or -1) seperately to reduce confusion
    float xDistance =  p.position.x - this.position.x;
    float yDistance =  p.position.y - this.position.y;
    int xSign = round(xDistance/abs(xDistance));
    int ySign = round(yDistance/abs(yDistance));
    
    this.velocity = this.velocity.add(new Velocity(xSign*abs(xVelToPlanet), ySign*abs(yVelToPlanet)));
  }
  
  private void checkImpacted(Planet p)
  {
    float planetDistance = p.position.getDistance(this.position);
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
    ellipse(this.position.x, this.position.y, bombRadius, bombRadius);
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
