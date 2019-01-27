class Population{
ArrayList<Rocket> rockets;
ArrayList<Rocket> matingpool;
int popsize = 200;
Population(){
rockets  = new ArrayList<Rocket>(popsize); 
matingpool  = new ArrayList<Rocket>(); 
for(int i=0;i<popsize;i++){
rockets.add(new Rocket());
}
}

void evaluate(){
 float maxfit = 0;
for(int i=0;i<popsize;i++){
Rocket rocket = rockets.get(i);
rocket.calcFitness();
if(rocket.fitness > maxfit){
maxfit = rocket.fitness;
}
}

for(int i=0;i<popsize;i++){
Rocket rocket = rockets.get(i);
rocket.fitness = rocket.fitness/maxfit;
}
for(int i = 0;i<matingpool.size();i++){
matingpool.remove(i);
}
for(int i=0; i< popsize;i++){
Rocket rocket = rockets.get(i);
int n = int(rocket.fitness * 100);
for(int j =0;j <n ;j++){
matingpool.add(rocket);
}
}
}

void selection(){
ArrayList<Rocket> newrockets  = new ArrayList<Rocket>(); 
for(int i=0; i< rockets.size();i++){
DNA parentA = matingpool.get(int(random(matingpool.size()))).dna;
DNA parentB = matingpool.get(int(random(matingpool.size()))).dna;
DNA child = parentA.crossover(parentB);
child.mutation();
newrockets.add(new Rocket(child));
}
this.rockets = newrockets;
}
void run(){
for(int i=0;i<popsize;i++){
  Rocket rocket = rockets.get(i);
  rocket.update();
  rocket.show();
}
}



}
