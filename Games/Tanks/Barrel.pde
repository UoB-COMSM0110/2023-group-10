public class Barrel{
  public static final float vg = 1;
  
  public float x; 
  public float y;
  public float vx; // positive right, negative left
  public float vy; // positive up, negative down
  public float r=3;
  public boolean explode=false; // positive up, negative down
  public ArrayList<Point> history = new ArrayList<>();
  
  public Barrel(float x, float y, float vx, float vy){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }
 
  public void updateState(float heightNBoundary){
    this.x += this.vx;
    this.y -= this.vy;
    this.vy -= Barrel.vg;
    this.history.add(new Point(this.x, this.y));
    // TODO: groundline may not alway zero; 
    if (this.y > heightNBoundary){
      this.explode = true;
    }
  }
}
