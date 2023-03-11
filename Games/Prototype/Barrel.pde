class Barrel
{
  // power goes from 0 to 1
  private float power;
  // constant to multiply power by
  private float k = 5;
  // angle goes from 0 to 2*Pi (radians)
  // difficulties with angles in processing as it sees down is up so 45 degrees points south-east not north-east
  private float angle;
  // integers for the coordinates for the barrel line
  private int lineLen = 15;
  private int lineThickness = 4;
  // The barrel is put onto a specific tank, t
  private Tank tank;
  
  // the tank provides the (x,y) coordinates for the barrel
  public Barrel(Tank aTank){
      this.tank = aTank;
      power = 0.5;
      angle = QUARTER_PI;
  }
  
  public void angleUp(){
      angle+=PI/100;
      angle = angle%TWO_PI;
  }
  
  public void angleDown(){
      angle-=PI/100;
      if(angle<0){
        angle+=TWO_PI;
      }
  }
  
  public void powerUp(){
      if(power<=1){
        power+=0.05;
      }
  }
  
  public void powerDown(){
      if(power>0.05){
        power-=0.05;
      }
  }
  
  public float getPower(){
    return power;
  }
  
  public float getAngle(){
    return angle;
  }
  
  private Point getLineStart(boolean tankCentered){ //tankCentered bool: decide the start coordinate (0, 0) or this.tank.getPosition().
    Point lineStart = new Point(0, -this.tank.tankHeight);  
    if (!tankCentered){
      lineStart = lineStart.add(this.tank.getPosition());  
    }
    return lineStart; 
  }
  
  private Point getLineEnd(boolean tankCentered){ //tankCentered bool: decide the start coordinate (0, 0) or this.tank.getPosition(). 
    Point lineStart = getLineStart(tankCentered);
    float lineEndX = (this.tank.direction == DIRECTION.CLOCKWISE)? lineLen*cos(angle): -lineLen*cos(angle);
    Point lineEnd = lineStart.add(new Point(lineEndX, lineLen*sin(-angle)));
    return lineEnd;
  }
  
  // Creates and returns a bomb with initial velocities decided by power and angle
  public Bomb shoot(){
    float bombVel = k * power;
    float bombXVel = cos(angle)*bombVel;
    float bombYVel = sin(-angle)*bombVel;
    return new Bomb(new Velocity(bombXVel, bombYVel), getLineEnd(false)); // TODO apply transform matrix
  }
  
  // displays barrel onto the screen
  public void displayBarrel(){
    beginShape();
    pushMatrix();
    translate(this.tank.getPosition().x, this.tank.getPosition().y);
    rotate(this.tank.angle);
    stroke(100, 100, 100);
    strokeWeight(lineThickness);
    Point lineStart = getLineStart(true);
    Point lineEnd = getLineEnd(true);
    line(lineStart.x, lineStart.y, lineEnd.x, lineEnd.y);
    popMatrix();
    endShape();
  }
}
