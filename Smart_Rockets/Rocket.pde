class Rocket {
PVector position, velocity, acceleration;
DNA dna;
float fitness = 0; 
boolean completed = false;
boolean crashed = false;

Rocket(){
position = new PVector(width/2,height);
velocity = new PVector(0,0);
acceleration = new PVector(0,0);
dna = new DNA();
}

Rocket(DNA dna){
position = new PVector(width/2,height);
velocity = new PVector(0,0);
acceleration = new PVector(0,0);
this.dna = dna;
}

void applyForce(PVector force){
acceleration.add(force);
}

void calcFitness(){
float distance = dist(target.x,target.y,position.x,position.y);
fitness = map(distance, 0, width, width,0);
if(this.completed){
fitness *= 10;
}
if(this.crashed){
fitness /= 10 ;
}

}
void update(){
float distance = dist(position.x, position.y, target.x,target.y);
if(distance< 15){
this.completed = true;
this.position = target.copy();
}

if(position.x > rx - (rw/2) && position.x < rx + (rw/2) && position.y > ry - (rh/2) && position.y < ry + (rh/2)){
crashed = true;
}
if(position.x > rx2 - (rw/2) && position.x < rx2 + (rw/2) && position.y > ry2 - (rh/2) && position.y < ry2 + (rh/2)){
crashed = true;
}
if(position.x > width || position.x < 0){
crashed = true;
}

if(position.y > height || position.y < 0){
crashed = true;
}

applyForce(dna.genes[count]);
 if(!this.completed && !crashed){
velocity.add(acceleration);
position.add(velocity);
acceleration.mult(0);
}
}

void show(){
  pushMatrix();
  noStroke();
  fill(200,70);
translate(position.x,position.y);
rotate(velocity.heading());
rectMode(CENTER);
rect(0,0,30,5);
popMatrix();

}


}
