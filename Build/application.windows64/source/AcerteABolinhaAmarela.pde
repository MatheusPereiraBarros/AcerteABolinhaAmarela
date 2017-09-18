int xPos;                      
int velocidadeBola=1;                   
int xDir=1;                    
int pontos=0;                   
int vidas=5;                   
boolean gameOver=false;           

void setup(){
  size (400,400);
  smooth();
  xPos=width/2;                
  fill(255,255,0);              
  textSize(13);                
}

void draw(){
  background (0);                               
  ellipse(xPos, height/2,40,40);                
  xPos=xPos+(velocidadeBola*xDir);                        
  if (xPos > width-20 || xPos<20){
    xDir=-xDir;                                  
  }
  text("Pontos = "+pontos,10,10);                 
  text("Vidas = "+vidas,width-80,10);         
  if (vidas<=0){
    textSize(20);
    text("Aperte com o mouse\n para reiniciar o jogo", 125,100);
    noLoop();                                   
    gameOver=true;
    textSize(10);
  }
}

void mousePressed(){
  if (dist(mouseX, mouseY, xPos, 200)<=20){
    pontos=pontos+velocidadeBola;                           
    velocidadeBola=velocidadeBola+1;                             
  }
  else{
    if (velocidadeBola<1){
    velocidadeBola=velocidadeBola-1;
    }
    vidas=vidas-1;                              
  }
  if (gameOver==true){
    velocidadeBola=1;                                     
    vidas=5;
    pontos=0;
    xPos=width/2;
    xDir=1;
    gameOver=false;
    loop();                                     
  }
}