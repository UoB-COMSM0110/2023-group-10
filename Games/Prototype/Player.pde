class Player
{
  int score;
  String name;
  Tank internalTank;
  public Player(String inputName){
    name = inputName;
    score = 0;
  }
  public int getScore(){
    return score;
  }
  public void addToScore(int val){
    score+=val;
  }
  public void setTank(Tank inPlayTank){
    internalTank=inPlayTank;
  }
  public Tank getTank(){
    return internalTank;
  }
}
