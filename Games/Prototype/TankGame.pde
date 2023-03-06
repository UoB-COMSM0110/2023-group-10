private ArrayList<Planet> planets;
private ArrayList<Player> players;
private int currPlayerNum;
private Bomb theBomb;
void setup(){
  frameRate(60);
  size(1000, 600);
  background(0);
  
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
  if(theBomb!=null){
    theBomb.stepBomb(planets);
    theBomb.displayBomb();  
    if(theBomb.getExploded() == true){
      println("Exploded!");
      theBomb = null;
    }  
  }
}

public void keyPressed()
{
  // If statement stops inputs whilst a bomb is in play
  if(theBomb==null){
    if (key == ' '){
      theBomb = players.get(currPlayerNum).getTank().getBarrel().shoot();
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
