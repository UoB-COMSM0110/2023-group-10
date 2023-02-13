
public enum Direction{
  LEFT, 
  RIGHT;
}

public class Tank{
  public float x; 
  public float y;
  public float w = 20;
  public float h = 8;
  public boolean explode = false;
  public Direction direction;
  public float barrelAngle = 30;
  public float barrelVelocity = 10;
  public boolean showBarrelTrajactory = false;

  public Tank(float x, float y, Direction d){
    this.x = x;
    this.y = y;
    this.direction = d;
  }
  
  public Line getBarrelLine(){
    float bl = 10;
    float x1 = this.x;
    float y1 = this.y-this.h;
    float sinx = bl * cos(this.barrelAngle*PI/180);
    float x2 = (this.direction == Direction.RIGHT)? this.x + sinx : this.x - sinx;
    float y2 = this.y - this.h - bl * sin(this.barrelAngle*PI/180);  
    Line l = new Line(x1, y1, x2, y2);
    return l;
  }
  
  public Barrel getBarrel(){
    Line l = this.getBarrelLine();
    float vx = BARRELPOWER * cos(this.barrelAngle * PI /180);
    float vy = BARRELPOWER * sin(this.barrelAngle * PI /180);
    vx = (this.direction == Direction.LEFT)? -vx: vx;
    Barrel b = new Barrel(l.x1, l.y1, vx, vy); 
    return b;
  }
  
  public Point[] getBarreltrajectory(){
    Barrel b = getBarrel();

    float init_vy = b.vy; 
    float steps = 100;
    float step_size = 0.4;
    Point[] pts = new Point[(int)steps];
    for (int i=0; i<steps; i++){
      b.x += step_size*b.vx;
      b.y -= step_size*init_vy;
      init_vy -= step_size*Barrel.vg;
      pts[i] = new Point(b.x, b.y);
    }
    return pts;
  }
  
  public void moveLeft(float leftBoundary){
    if (this.x-2 > leftBoundary){
      this.x-=2;
    }
    this.direction = Direction.LEFT;
  }
  
  public void moveRight(float rightBoundary){
    if (this.x+2 < rightBoundary){
      this.x+=2;
    }
    this.direction = Direction.RIGHT;
  }
  
  public void increaseBarrelAngle(){
    if (this.barrelAngle+2 < 90){
      this.barrelAngle += 2;  
    }
  }
  
  public void decreaseBarrelAngle(){
    if (this.barrelAngle-2 > 0){
      this.barrelAngle -= 2;  
    }
  }
}
