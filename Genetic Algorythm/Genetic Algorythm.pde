Population population;
Goal goal = new Goal(400, 10);
Obstacles OGrp = new Obstacles(5);
Labyrinth Lab1 = new Labyrinth();
boolean Obstacles = false;
boolean Labyrinth = true;
boolean freezeAtEnd = true;
float mutationRate = 0.01;
boolean freeze;
void setup() {
  size(800, 800);
  population = new Population(1000);
  freeze = false;
}

void draw() {
  background(255);
  goal.show();
  if (Obstacles) OGrp.show();
  if (Labyrinth) Lab1.show();
  if (population.allDotsDead()) {
    if(freezeAtEnd){
      population.show();
      String out = "\n" + "Generation:"+ population.Gen+ "\n"+ "step:"+ population.minSteps+ "\n"+ "Mutationrate: "+ mutationRate;
      fill(0,0,150);
      textSize(30);
      text(out,0,30);
      noLoop();
      freeze = true; 
    }
    population.calculateFitness();
    population.naturalSelection();
    population.mutate(mutationRate);
    //background(255);
  } else {
    String out = "\n" + "Generation:"+ population.Gen+ "\n"+ "step:"+ population.minSteps+ "\n"+ "Mutationrate: "+ mutationRate;
    fill(0,0,150);
    textSize(30);
    text(out,0,30);
    population.update();
    population.show();
  }
}
void mousePressed(){
  if(!freeze){
    noLoop();
    freeze = true;
  }else{
    loop();
    freeze = false;
  }
}
void keyPressed(){
  if(key == 'f' || key == 'F'){
    freezeAtEnd = false;
  }else{
    if(key == 'e' || key == 'E'){
      freezeAtEnd = true; 
    }
  }
}
