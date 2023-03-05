private ArrayList<Planet> planets;
private ArrayList<Player> players;
private int currPlayerNum;
private Bomb b;
private Tank testTank;
private Barrel testBarrel;
void setup(){
  frameRate(60);
  size(1000, 600);
  background(0);
  testTank = new Tank(width/2, height/2);
  
  planets = new ArrayList<>();
  planets.add(new Planet(100, 300, 150));
  planets.add(new Planet(900, 300, 150));
  
  players = new ArrayList<>();
  players.add(new Player("One"));
  players.add(new Player("Two"));
  players.get(0).setTank(new Tank(100, 150));
  players.get(1).setTank(new Tank(900, 150));
  currPlayerNum = 0;
}

void draw(){
  background(0);
  for(int i = 0; i<players.size(); i++){
    players.get(i).getTank().displayTank();
    players.get(i).getTank().getBarrel().displayBarrel();
  }
  for(int i = 0; i<planets.size(); i++){
    planets.get(i).displayPlanet();
  }
  if(b!=null){
    b.stepBomb(planets);
    b.displayBomb();  
    if(b.getImpacted() == true){
      println("Impact!");
      b = null;
    }  
  }
}

public void keyPressed()
{
  if(b==null){
    if (key == ' '){
      b = players.get(currPlayerNum).getTank().getBarrel().shoot();
      currPlayerNum++;
      currPlayerNum = currPlayerNum%players.size();
    }
    if (key == '='){
      players.get(currPlayerNum).getTank().getBarrel().powerUp();
    }
    if (key == '-'){
      players.get(currPlayerNum).getTank().getBarrel().powerDown();
    }
    if (key == CODED && keyCode == LEFT){
      players.get(currPlayerNum).getTank().moveLeft();
    }
    if (key == CODED && keyCode == RIGHT){
      players.get(currPlayerNum).getTank().moveRight();
    }
    if (key == CODED && keyCode == UP){
      players.get(currPlayerNum).getTank().getBarrel().angleUp();
    }
    if (key == CODED && keyCode == DOWN){
      players.get(currPlayerNum).getTank().getBarrel().angleDown();
    }
  }
}
