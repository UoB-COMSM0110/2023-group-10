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
  private float lineStartX, lineStartY, lineEndX, lineEndY;
  private int lineLen = 15;
  private int lineThickness = 4;
  
  // The barrel is put onto a specific tank, t
  private Tank t;
  // the tank provides the (x,y) coordinates for the barrel
  public Barrel(Tank aTank){
      t = aTank;
      power = 0.5;
      angle = QUARTER_PI;
      this.updateLinePositions();
  }
  public void angleUp(){
      angle+=PI/100;
      angle = angle%TWO_PI;
      this.updateLinePositions();
  }
  public void angleDown(){
      angle-=PI/100;
      if(angle<0){
        angle+=TWO_PI;
      }
      this.updateLinePositions();
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
  // Creates and returns a bomb with initial velocities decided by power and angle
  public Bomb shoot(){
    float bombVel = k * power;
    float bombXVel = cos(angle)*bombVel;
    float bombYVel = sin(-angle)*bombVel;
    return new Bomb(bombXVel, bombYVel, lineEndX, lineEndY);
  }
  public void updateLinePositions(){
    lineStartX = t.getXPosition();
    lineStartY = t.getYPosition();
    lineEndX = lineStartX+lineLen*cos(angle);
    lineEndY = lineStartY+lineLen*sin(-angle);
  }
  // displays barrel onto the screen
  public void displayBarrel(){
    this.updateLinePositions();
    stroke(100, 100, 100);
    strokeWeight(lineThickness);
    line(lineStartX, lineStartY, lineEndX, lineEndY);
  }
}
