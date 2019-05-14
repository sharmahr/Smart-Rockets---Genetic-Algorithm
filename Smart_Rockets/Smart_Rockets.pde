Population population; // populations of rockets
// obstacle 1
int rx = 450, ry = 300, rw = 300, rh = 10;
// obstacle 2
int rx2 = 200, ry2 = 550;
//lifespan of rockets
int lifespan = 550; // 700 frames
int count = 0;  // life of the rocket
PVector target;  // target position to be reached by the rockets 
int generation = 1;  // number of generations produced
boolean start = false;

void setup(){
  size(800,800,P3D);
  population = new Population();
  target = new PVector(width/2,100);
  background(0);
}


void draw(){
  if(start){
  background(0);
  population.run(); 
  count += 1;
  
  if(count == lifespan){
    population.evaluate();
    population.selection();
    count = 0;
    generation += 1;
  }
  
  fill(255);
  rect(rx,ry,rw,rh);
  rect(rx2,ry2,rw,rh);
  ellipse(target.x,target.y,70,70);
  textSize(30);
  text("Generation:"+generation,0, height- 60);
  text("LifeSpan:"+count,0,height - 30);
}
}

void mousePressed(){

start = true;
}
