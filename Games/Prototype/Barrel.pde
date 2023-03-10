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
  
  private Point getLineEnd(){
    Point lineStart = new Point(this.tank.getPosition());
    lineStart.y -= this.tank.tankHeight;
    Point lineEnd = new Point(lineStart.x+lineLen*cos(angle), lineStart.y+lineLen*sin(-angle));
    return lineEnd;
  }
  
  // Creates and returns a bomb with initial velocities decided by power and angle
  public Bomb shoot(){
    float bombVel = k * power;
    float bombXVel = cos(angle)*bombVel;
    float bombYVel = sin(-angle)*bombVel;
    return new Bomb(new Velocity(bombXVel, bombYVel), getLineEnd()); // TODO apply transform matrix
  }
  
  // displays barrel onto the screen
  public void displayBarrel(){
    beginShape();
    pushMatrix();
    translate(this.tank.getPosition().x, this.tank.getPosition().y);
    rotate(this.tank.angle);
    stroke(100, 100, 100);
    strokeWeight(lineThickness);
    line(0, -this.tank.tankHeight, lineLen*cos(angle), -this.tank.tankHeight+lineLen*sin(-angle));
    popMatrix();
    endShape();
  }
}
