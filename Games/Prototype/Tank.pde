class Tank
{
  private float stepSize = 5;
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
    this.angle = planetPosition.getPerpendicularAngle(this.position, this.direction);
    tankBarrel = new Barrel(this);
  }
  
  public Tank(float initWidth, float initHeight, Point intiPosition, DIRECTION direction, Planet initPlanet){
    this.planet = initPlanet;
    this.tankWidth = initWidth;
    this.tankHeight = initHeight;
    Point planetPosition = this.planet.getPosition();
    this.position = planetPosition.interpolate(intiPosition, initPlanet.getRadius());
    this.direction = direction;
    this.angle = planetPosition.getPerpendicularAngle(this.position, DIRECTION.CLOCKWISE);
    tankBarrel = new Barrel(this);
  }

  public Planet getNearestPlanet(ArrayList<Planet> planets, Point position){
    planets.sort((p1, p2) -> (int) (p1.getPosition().getDistance(position) - p2.getPosition().getDistance(position)));
    return planets.get(0);
  }
  
  public void moveLeft(){
    this.direction = DIRECTION.COUNTERCLOCKWISE;
    Point planetPosition = this.planet.getPosition();
    Vector vPerpendicular = planetPosition.getPerpendicularVector(this.position, this.direction);
    Vector vPerpendicularUnit = vPerpendicular.devide(vPerpendicular.getAbsolute()).multiply(stepSize);
    Point positionNew = this.position.add(vPerpendicularUnit); 
    this.position = planetPosition.interpolate(positionNew, this.planet.getRadius());
    this.angle = planetPosition.getPerpendicularAngle(this.position, DIRECTION.CLOCKWISE);
  }
  
  public void moveRight(){
    this.direction = DIRECTION.CLOCKWISE;
    Point planetPosition = this.planet.getPosition();
    Vector vPerpendicular = planetPosition.getPerpendicularVector(this.position, this.direction);
    Vector vPerpendicularUnit = vPerpendicular.devide(vPerpendicular.getAbsolute()).multiply(stepSize);
    Point positionNew = this.position.add(vPerpendicularUnit); 
    this.position = planetPosition.interpolate(positionNew, this.planet.getRadius());
    this.angle = planetPosition.getPerpendicularAngle(this.position, DIRECTION.CLOCKWISE);
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
