class Tank
{
  private float tankWidth, tankHeight; 
  private Point position;
  private float angle;
  private DIRECTION direction; 
  private Planet planet;
  private boolean exploded;
  private Barrel tankBarrel;

  public Tank(float initWidth, float initHeight, Point intiPosition, DIRECTION direction, ArrayList<Planet> planets){
    //this(initWidth, initHeight, intiPosition, this.getNearestPlanet(planets, intiPosition))
    this.planet = this.getNearestPlanet(planets, intiPosition);
    this.tankWidth = initWidth;
    this.tankHeight = initHeight;
    Point planetPosition = this.planet.getPosition();
    this.position = planetPosition.interpolate(intiPosition, this.planet.getRadius()); 
    this.direction = direction;
    this.angle = planetPosition.getPerpendicularAngle(this.position);
    tankBarrel = new Barrel(this);
  }
  
  public Tank(float initWidth, float initHeight, Point intiPosition, DIRECTION direction, Planet initPlanet){
    this.planet = initPlanet;
    this.tankWidth = initWidth;
    this.tankHeight = initHeight;
    Point planetPosition = this.planet.getPosition();
    this.position = planetPosition.interpolate(intiPosition, initPlanet.getRadius());
    this.direction = direction;
    this.angle = planetPosition.getPerpendicularAngle(this.position);
    tankBarrel = new Barrel(this);
  }

  public Planet getNearestPlanet(ArrayList<Planet> planets, Point position){
    planets.sort((p1, p2) -> (int) (p1.getPosition().getDistance(position) - p2.getPosition().getDistance(position)));
    return planets.get(0);
  }
  
  public void moveLeft(){
    // TODO: using Point.getPerpendicularAngle to implemen this
    // TODO: use `this.angle = planetPosition.getPerpendicularAngle(this.position);` to update position
    // TODO: use `this.angle = planetPosition.getPerpendicularAngle(this.position);` to update angle
  }
  
  public void moveRight(){
    // TODO: using Point.getPerpendicularAngle to implemen this
    // TODO: use `this.angle = planetPosition.getPerpendicularAngle(this.position);` to update position
    // TODO: use `this.angle = planetPosition.getPerpendicularAngle(this.position);` to update angle
  }
  
  // returns true if it has exploded
  public boolean hasExploded(){
    return exploded;
  }
  
  public void changeExploded(boolean exp){
    exploded = exp;
  }

  public float getWidth(){
    return this.tankWidth;
  }  
  
  public float getHeight(){
    return this.tankHeight;
  }
  
  public Point getPosition(){
    return this.position;
  }
  
  public Barrel getBarrel(){
    return tankBarrel;
  }
  
  // displays tank onto the screen
  public void displayTank(){
    if (!this.exploded){
      // TODO: The direction of the tank should be considered.
      beginShape();
      pushMatrix();
      translate(this.getPosition().x, this.getPosition().y);
      rotate(this.angle);
      noStroke();  
      fill(255, 0, 0);
      rect(-this.tankWidth/2, -this.tankHeight, this.tankWidth, this.tankHeight);
      popMatrix();
      endShape();
    }
  }
}
