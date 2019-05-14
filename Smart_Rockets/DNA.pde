class DNA{
  
  PVector [] genes;

  DNA(){
    genes = new PVector[lifespan];
    for(int i = 0; i<lifespan;i++){
      genes[i] = PVector.random2D();
      genes[i].setMag(0.1);
    }
  }

  DNA crossover(DNA dna){
    DNA newdna = new DNA();
    int mid = floor(random(genes.length));
    for(int i=0; i<genes.length;i++){
      if(i > mid){
        newdna.genes[i] = this.genes[i];
      }
      else{
        newdna.genes[i] = dna.genes[i];
}
}
return newdna;
}

void mutation(){
for(int i= 0; i< genes.length;i++){
if(random(1) < 0.001){
genes[i] = PVector.random2D();
genes[i].setMag(0.1);
}
}

}
}
