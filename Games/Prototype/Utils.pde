import java.lang.Math;

class Velocity
{
    public float x, y; 
    public Velocity(float x, float y){
        this.x = x;
        this.y = y;
    }
    
    public void add(Velocity v){
        this.x += v.x;
        this.y += v.y;
    }
}

class Point
{
    public float x, y; 
    public Point(float x, float y){
        this.x = x;
        this.y = y;
    }

    public Point(Point p){
        this.x = p.x;
        this.y = p.y;
    }
    
    public void add(Velocity v){
        this.x += v.x;
        this.y += v.y;
    }
    
    public float getDistance(Point p2){
        return (float)Math.sqrt((sq(this.x - p2.x) + sq(this.y - p2.y)));
    }
    
    public Point interpolate(Point p2, float targetDistance){
        float distance_percentage = targetDistance / this.getDistance(p2);
        float x_new = this.x + (p2.x - this.x) * distance_percentage; 
        float y_new = this.y + (p2.y - this.y) * distance_percentage; 
        return new Point(x_new, y_new);
    }
    
    public float getAngle(Point p2){
        float angle;
        if((this.x - p2.x) == 0){ // panet - bomb 
          angle = 0;
        }
        else{
          angle = tan((this.y - p2.y)/(this.x - p2.x)); // panet - bomb
        }
        return angle;
    }
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

//public static class Utils
//{
//    //public static float getDistance(Point p1, Point p2){
//    //    return (float)Math.sqrt((sq(p1.x - p2.x) + sq(p1.y - p2.y)));
//    //}
    
//    //static public double getDistance(float x1, float y1, float x2, float y2){
//    //    return Math.sqrt((Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2)));
//    //}
    
//    //public static Point interpolate(Point p1, Point p2, float target_distance){
//    //    float distance_percentage = target_distance / getDistance(p1, p2);
//    //    float x_new = p1.x + (p2.x - p1.x) * distance_percentage; 
//    //    float y_new = p1.y + (p2.y - p1.y) * distance_percentage; 
//    //    return new Point(x_new, y_new);
//    //}
 
//    //public static float getAngle(Point p1, Point p2){
//    //    float angle;
//    //    if((p1.x - p2.x) == 0){ // panet - bomb 
//    //      angle = 0;
//    //    }
//    //    else{
//    //      angle = tan((p1.y - p2.y)/(p1.x - p2.x)); // panet - bomb
//    //    }
//    //    return angle;
//    //}
//}
