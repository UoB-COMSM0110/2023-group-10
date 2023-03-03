ArrayList<Planet> planets;
void setup(){
  size(1000, 600);
  background(0);
  planets = new ArrayList<>();
  planets.add(new Planet(100, 300, 50));
  planets.add(new Planet(900, 300, 50));
  for(int i = 0; i<3; i++){
    planets.add(new Planet());    
  }
}
