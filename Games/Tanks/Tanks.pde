import java.lang.Math;

int W = 500;
int H = 300;
float BARRELPOWER = 20; 
int currentBackground = 255;

Tank t1;
Tank t2;
ArrayList<Barrel> barrels;

void drawTank(Tank t){
  if (!t.explode){
    fill(0);
    rect(t.x-t.w/2, t.y-t.h, t.w, t.h);
    
    Line l = t.getBarrelLine();
    line(l.x1, l.y1, l.x2, l.y2);
    
    if (t.showBarrelTrajactory){
      for (Point pt: t.getBarreltrajectory()){
        circle(pt.x, pt.y, 1); 
      }
    }
  }
}

void initEnvironment(){
  background(currentBackground);
}

void initTanks(){
 t1 = new Tank(30, H, Direction.RIGHT);
 t2 = new Tank(W-30, H, Direction.LEFT);
 barrels = new ArrayList<>();
}

float distace(float x1, float y1, float x2, float y2){
    double sqx = Math.pow((double)x1 - (double)x2, 2);
    double sqy = Math.pow((double)y1- (double)y2, 2);
    return (float)Math.sqrt(sqx + sqy);
}

void checkTankExplode(Point lp1, Point lp2){
  float distThres = 6;
  
  float nsteps = 3;
  float xInit = lp1.x;
  float yInit = lp1.y;
  float xStepSize = (lp2.x - lp1.x)/nsteps;
  float yStepSize = (lp2.y - lp1.y)/nsteps;
  
  for (int i=0; i<nsteps; i++){
    xInit += xStepSize;
    yInit += yStepSize;
    if (distace(xInit, yInit, t1.x, t1.y) < distThres){
      t1.explode = true;
    }
    if (distace(xInit, yInit, t2.x, t2.y) < distThres){
      t2.explode = true;
    }
  }
}

void updateBarrels(){
  ArrayList<Integer> idxsExploded = new ArrayList<>();
  for (int i=0; i<barrels.size(); i++){
    // update barrel state
    Barrel b = barrels.get(i);
    b.updateState(H);
    if (b.explode){
      idxsExploded.add(i);
    }
    
    // check barrel explode the tank 
    ArrayList<Point> h = b.history;
    if (h.size() > 5){
      Point lp1 = h.get(h.size()-2);
      Point lp2 = h.get(h.size()-1);
      checkTankExplode(lp1, lp2);
    }
  }
  
  // remove exploded barrels 
  for (int idx: idxsExploded){
    barrels.remove(idx);
  }
}

void drawGameOver(){
  textSize(30);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text("Game Over", W/2, H/2-20);
  fill(0, 255, 0);
  text("Play Again", W/2, H/2+20);
  if (mousePressed){
    initTanks();
  }
}

void settings() {
  size(W, H);
}

void setup(){
  initTanks();
  initEnvironment();
}

void draw(){
  updateBarrels();
  initEnvironment();
  drawTank(t1);
  drawTank(t2);
  for (Barrel b: barrels){
    circle(b.x, b.y, b.r);
  }
  if (t1.explode || t2.explode){
    drawGameOver();
  }  
}

public void keyPressed()
{
    if (key == CODED && keyCode == LEFT){
      t2.moveLeft(0);
    }
    else if(key == CODED && keyCode == RIGHT){
      t2.moveRight(W);
    }
    else if(key == CODED && keyCode == UP){
      t2.increaseBarrelAngle();
    }
    else if(key == CODED && keyCode == DOWN){
      t2.decreaseBarrelAngle();
    }
    else if (key == 'l'){
      barrels.add(t2.getBarrel());
    }
    else if (key == 'p'){
      t2.showBarrelTrajactory = !t2.showBarrelTrajactory;
    }
    
    
    else if (key == 'a'){
      t1.moveLeft(0);
    }
    else if(key == 'd'){
      t1.moveRight(W);
    }
    else if(key == 'w'){
      t1.increaseBarrelAngle();
    }
    else if(key == 's'){
      t1.decreaseBarrelAngle();
    }
    else if (key == 'g'){
      barrels.add(t1.getBarrel());
    }
    else if (key == 't'){
      t1.showBarrelTrajactory = !t1.showBarrelTrajactory;
    }
}
