class Tank
{
  private int xPos, yPos;
  private boolean exploded;
  private Barrel tankBarrel;
  public Tank(int x, int y){
    xPos = x;
    yPos = y;
    tankBarrel = new Barrel(this);
  }
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
  public int getXPosition(){
    return xPos;
  }
  public int getYPosition(){
    return yPos;
  }
  public Barrel getBarrel(){
    return tankBarrel;
  }
  // displays tank onto the screen
  public void displayTank(){
    
  }
}
