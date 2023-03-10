private ArrayList<Planet> planets;
private ArrayList<Player> players;
private int currPlayerNum;
private Bomb theBomb;
void setup(){
  frameRate(60);
  size(1000, 600);
  background(0);
  
  planets = new ArrayList<>();
  planets.add(new Planet(new Point(100.0, 300.0), 100.0));
  planets.add(new Planet(new Point(900.0, 300.0), 100.0));
  
  players = new ArrayList<>();
  players.add(new Player("One"));
  players.add(new Player("Two"));
  
  //define the planet for specific Tank
  players.get(0).setTank(new Tank(20, 8, new Point(200.0, 150.0), DIRECTION.CLOCKWISE, planets.get(0)));
  players.get(1).setTank(new Tank(20, 8, new Point(900.0, 150.0), DIRECTION.COUNTERCLOCKWISE, planets.get(1)));
  
  //// find the nearest planet for each Tank
  //players.get(0).setTank(new Tank(20, 8, new Point(200.0, 150.0), DIRECTION.CLOCKWISE, planets));
  //players.get(1).setTank(new Tank(20, 8, new Point(900.0, 150.0), DIRECTION.COUNTERCLOCKWISE, planets));
  currPlayerNum = 0;
}

void draw(){
  background(0);
  
  //beginShape();
  ////translate(50, 50);
  ////rotate(30);
  //noStroke();  
  //fill(255, 0, 0);
  //rect(50-25, 50-15, 50, 30);
  //endShape();
  
  //beginShape();
  //pushMatrix();
  //translate(50, 50);
  //rotate(10 * PI/180);
  //noStroke();  
  //fill(0, 0, 255);
  //rect(-25, -15, 50, 30);
  //popMatrix();
  //endShape();

  
  for(int i = 0; i<planets.size(); i++){
    planets.get(i).displayPlanet();
  }
  for(int i = 0; i<players.size(); i++){
    players.get(i).getTank().displayTank();
    players.get(i).getTank().getBarrel().displayBarrel();
  }
  if(theBomb!=null){
    theBomb.stepBomb(planets);
    theBomb.displayBomb();  
    if(theBomb.getExploded() == true){
      println("Impact!");
      theBomb = null;
    }  
  }
}

public void keyPressed()
{
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
