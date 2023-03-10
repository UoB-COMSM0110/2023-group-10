import java.lang.Math;
import java.util.Arrays;

enum DIRECTION {CLOCKWISE, COUNTERCLOCKWISE};

class Vector
{
  public float x, y; 
  public Vector(float x, float y){
      this.x = x;
      this.y = y;
  }
  
  public Vector(Vector v){
      this.x = v.x;
      this.y = v.y;
  }
  
  public Vector add(Vector v){
      return new Vector(this.x + v.x, this.y + v.y);
  }
  
  public Vector minus(Vector v){
      return new Vector(this.x - v.x, this.y - v.y);
  }
  
  public Vector rot90Clockwise(){ 
    return new Vector(-this.y, this.x);    
  }
  
  public float dot(Vector v){
    return this.x * v.x + this.y * v.y;   
  }
  
  public float getDistance(Vector v2){
    return (float)Math.sqrt((sq(this.x - v2.x) + sq(this.y - v2.y)));
  }

  public float getAbsolute(){
    return getDistance(new Vector(0.0, 0.0));
  }
  
  public float getIncludedAngle(Vector v2){
    return acos(this.dot(v2) / (this.getAbsolute() * v2.getAbsolute()));
  }
  
  public String toString(){
    return "Vector(" + this.x + ", " + this.y + ")";
  }
}

class Velocity extends Vector{
  public Velocity(float x, float y){
    super(x, y); 
  }

  public Velocity(Velocity v){
    super(v);
  }
  
  public Velocity add(Velocity v){
    return new Velocity(this.x + v.x, this.y + v.y); 
  }
};

class Point extends Vector
{
  public Point(float x, float y){
    super(x, y); 
  }

  public Point(Point p){
    super(p);
  }

  //public float x, y; 
  //public Point(float x, float y){
  //    this.x = x;
  //    this.y = y;
  //}

  //public Point(Point p){
  //    this.x = p.x;
  //    this.y = p.y;
  //}
  
  //public float getDistance(Point p2){
  //  return (float)Math.sqrt((sq(this.x - p2.x) + sq(this.y - p2.y)));
  //}

  public Point add(Velocity v){
    return new Point(this.x + v.x, this.y + v.y); 
  }

  public String toString(){
    return "Point(" + this.x + ", " + this.y + ")";
  }
    
  public Point interpolate(Point p2, float targetDistance){
    float distance_percentage = targetDistance / this.getDistance(p2);
    float x_new = this.x + (p2.x - this.x) * distance_percentage; 
    float y_new = this.y + (p2.y - this.y) * distance_percentage; 
    return new Point(x_new, y_new);
  }
  
  public float getAngle(Point p2){
    // used for calculating the bomb init velocity 
    // TODO: should modified, just consider the relationship between planet and tank, not the angle of tank.
    float angle;
    if((this.x - p2.x) == 0){ // panet - bomb 
      angle = 0;
    }
    else{
      angle = tan((this.y - p2.y)/(this.x - p2.x)); // panet - bomb
    }
      return angle;
  }
  
  public float getPerpendicularAngle(Point p2){
    // This function returns the Radian not degree
    // It is also valid to get the angle by this, but it may be difficult to debug
    // return atan((p2.y - this.y) / (p2.x - this.x));
    Vector v = new Vector(p2.minus(this));
    Vector vPerpendicular = v.rot90Clockwise();
    float angle = vPerpendicular.getIncludedAngle(new Vector(1.0, 0.0));
    return angle;
  }

  //public static void main(){
  //    Point p = new Point((float)1.0, (float)1.0);
  //    System.out.println(p);
  //}
}

class Color
{
    public int r, g, b;
    public Color(int r, int g, int b){
        this.r = r;
        this.g = g;
        this.b = b;
    }
}

//// TODO: Calculate the bomb start point
//class TransformMatrix
//{
//  ArrayList<ArrayList<Double>> M;
//  public TransformMatrix(double a00, double a01, double a10, double a11){
//    M = new ArrayList<ArrayList<Double>>();
//    this.M.add(new ArrayList<>(Arrays.asList(a00, a10)));
//    this.M.add(new ArrayList<>(Arrays.asList(a01, a11)));
//  }
    
//  public Point multiply(Point p){
//    Point p_new = new Point(p);
//    p_new.x = (float)(((double)p.x) * M.get(0).get(0) + ((double)p.x) * M.get(0).get(1));
//    p_new.y = (float)(((double)p.x) * M.get(1).get(0) + ((double)p.x) * M.get(1).get(1));
//    return p_new;
//  }
    
//  public String toString(){
//      String output = String.format("[[%.2f, %.2f]\n [%.2f, %.2f]", M.get(0).get(0), M.get(0).get(1), M.get(1).get(0), M.get(1).get(1));  
//      return output;
//  }
    
//  //public static void main(){
//  //  double degree = 30;
//  //  double radian = degree*PI/180;
//  //  double cos_radian = Math.cos(radian);
//  //  double sin_radian = Math.sin(radian);
//  //  TransformMatrix M = new TransformMatrix(cos_radian, sin_radian, -sin_radian, cos_radian);
//  //  System.out.println(M);
//  //}
//}

//class BasesTransform
//{
//  private TransformMatrix M;
//  public BasesTransform(double degree){
//    this.M = getTransform(degree);
//  }
  
//  public TransformMatrix getTransform(double degree){
//    double radian = degree*PI/180;
//    double cos_radian = Math.cos(radian);
//    double sin_radian = Math.sin(radian);
//    return new TransformMatrix(cos_radian, sin_radian, -sin_radian, cos_radian);
//  }
    
//  public ArrayList<Point> applyTransform(ArrayList<Point> points){
//    ArrayList<Point> points_trans = new ArrayList<Point>(points.stream().map((Point p) -> this.M.multiply(p)).toList());
//    return points_trans;
//  }
    
//  //public static void main(){
//  //  BasesTransform baseTransform = new BasesTransform(30.0);
//  //  ArrayList<Point> points = new ArrayList<Point>(Arrays.asList(new Point((float)1.0, (float)2.0)));
//  //  baseTransform.applyTransform(points);
//  //}
//}
