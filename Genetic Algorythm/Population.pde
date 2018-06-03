class Population {
  Dot[] dots;
  float fitnessSum;
  int Gen = 0;

  int bestDot = 0;

  int minSteps = 400;

  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }

  //-----------------------------------------------------------------------------------------

  void show() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
  }

  //-------------------------------------------------------------------------------------------

  void update() {
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].brain.step>minSteps) {
        dots[i].dead = true;
      }
      dots[i].update();
    }
  }

  //-----------------------------------------------------------------------------------------------

  void calculateFitness() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].calculateFitness();
    }
  }

  //-------------------------------------------------------------------------------------------

  boolean allDotsDead() {
    for (int i = 0; i < dots.length; i++) {
      if (!dots[i].dead && !dots[i].reachedGoal) {
        return false;
      }
    }
    return true;
  }

  //--------------------------------------------------------------------------------------------

  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length]; 
    setBestDot();
    calculateFitnessSum();

    newDots[0] = dots[bestDot].createBaby();
    newDots[0].isBest = true;
    for (int i = 1; i < newDots.length; i++) {
      Dot parent = selectParent();
      newDots[i] = parent.createBaby();
    }
    dots = newDots.clone();
    Gen++;
  }

  //--------------------------------------------------------------------------------------------

  void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i < dots.length; i++) {
      fitnessSum = fitnessSum + dots[i].fitness;
    }
  }

  //-------------------------------------------------------------------------------------------

  Dot selectParent() {
    float rand = random(fitnessSum);
    float runningSum = 0;
    for (int i = 0; i < dots.length; i++) {
      runningSum = runningSum + dots[i].fitness;
      if (runningSum > rand) {
        return dots[i];
      }
    }
    return null;
  }

  //---------------------------------------------------------------------------------------------------

  void mutate(float mutationRate) {
    for (int i = 1; i < dots.length; i++) {
      dots[i].brain.mutate(mutationRate);
    }
  }

  //------------------------------------------------------------------------------------------------

  void setBestDot() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].fitness > max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDot = maxIndex;
    if (dots[bestDot].reachedGoal) {
      minSteps = dots[bestDot].brain.step;
    }
  }
}
