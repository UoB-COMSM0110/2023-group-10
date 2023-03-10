import java.util.List;
import java.util.Collections;

class Tank
{
  private float tankWidth, tankHeight; 
  private Point position; // TODO: angle
  private boolean exploded;
  private Barrel tankBarrel;
  
  //public Tank(Point intiPosition, List<Planet> planets){
  //  //planets.sort((p1, p2) -> Utils.getDistance(p1, intiPosition) > Utils.getDistance(p2, intiPosition));
  //  //for (Planet planet: planets){
      
  //  //}
  //}

  public Tank(float initWidth, float initHeight, Point intiPosition, Planet initPlanet){
    //this.position = intiPosition;
    this.tankWidth = initWidth;
    this.tankHeight = initHeight;
    Point planetPosition = initPlanet.getPosition();
    this.position = planetPosition.interpolate(intiPosition, initPlanet.getRadius()); 
    tankBarrel = new Barrel(this);
  }

  //public Tank(Point intiPosition){
  //  this.position = intiPosition; 
  //  tankBarrel = new Barrel(this);
  //}
  
  public void moveLeft(){
    
  }
  
  public void moveRight(){
    
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
      beginShape();
      //translate(this.position.x, this.position.y);
      //rotate(30);
      noStroke();  
      fill(255, 0, 0);
      //rect(-this.tankWidth/2, -this.tankHeight, this.tankWidth, this.tankHeight);
      rect(this.position.x-this.tankWidth/2, this.position.y-this.tankHeight, this.tankWidth, this.tankHeight);
      endShape();
      
    //  Line l = t.getBarrelLine();
    //  line(l.x1, l.y1, l.x2, l.y2);
      
    //  if (t.showBarrelTrajactory){
    //    for (Point pt: t.getBarreltrajectory()){
    //      circle(pt.x, pt.y, 1); 
    //    }
    //  }
    }

  }
}
