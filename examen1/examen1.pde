
class Dashboard{
  int[] c = new int[4];
  float per[] = new float[4], grad[] = new float[4];
  boolean porcentaje;
  
  boolean rebotaX=false,rebotaY=false;
  int x,y;
  
  Dashboard(){
    /*c[0] = 158;
    c[1] = 24;
    c[2] = 84;
    c[3] = 33;*/
    for(int i=0;i<4;i++){
      c[i] = (int)random(150);
    }
    porcentaje = false;
    x = 0;
    y = 720/2;
  }
  
  Dashboard(int[] num){
    for(int i=0;i<4;i++){
      c[i] = num[i];
    }
  }
  
  void DashRect(int x,int y){
     noStroke();
     fill(25);
     rect(x,y,15,c[0]*-3);
     rect(x+35,y,15,c[1]*-3);
     rect(x+70,y,15,c[2]*-3);
     rect(x+110,y,15,c[3]*-3);
     
     fill(255);
     
     rect(x-10,y,150,3);
     rect(x-10,y,3,100*-3);
     
     textSize(18);
     text("C1",x,y-20);
     text(c[0],x,y);
     
     text("C2",x+35,y-20);
     text(c[1],x+35,y);
     
     text("C3",x+70,y-20);
     text(c[2],x+70,y);
     
     text("C4",x+110,y-20);
     text(c[3],x+110,y);
     
  }
  
  void DashCake(int x,int y,int radio){
    stroke(1);
    if(!porcentaje){
      Porcentajes();
    }
    
    fill(#E515E5);
    arc(x,y,radio,radio,radians(0),radians(grad[0]),PIE);
    rect(x-120,y+120,10,10);
    fill(255);
    textSize(14);
    text("C1: "+per[0]+"%",x-100,y+130);
    
    fill(#156DE5);
    arc(x,y,radio,radio,radians(grad[0]),radians(grad[1]+grad[0]),PIE);
    rect(x+10,y+120,10,10);
    fill(255);
    textSize(14);
    text("C2: "+per[1]+"%",x+30,y+130);
    
    fill(#8BFF83);
    arc(x,y,radio,radio,radians(grad[1]+grad[0]),radians(grad[2]+grad[1]+grad[0]),PIE);
    rect(x-120,y+150,10,10);
    fill(255);
    textSize(14);
    text("C3: "+per[2]+"%",x-100,y+160);
    
    fill(#FFA283);
    arc(x,y,radio,radio,radians(grad[2]+grad[1]+grad[0]),radians(grad[3]+grad[2]+grad[1]+grad[0]),PIE);
    rect(x+10,y+150,10,10);
    fill(255);
    textSize(14);
    text("C4: "+per[3]+"%",x+30,y+160);
  }
  
  void DashDonut(int x,int y,int radio,int bkg){
    stroke(1);
    if(!porcentaje){
      Porcentajes();
    }
    
    DashCake(x,y,radio);
    
    fill(bkg);
    //circle(x,y,(int)random(radio/4,radio/1.05));
    //tint(255, 255);
    circle(x,y,radio/1.5);
  }
  
  void Porcentajes(){
    //En este metodo se hacen los porcentajes para cada C
    float suma = 0;
    for(int i=0;i<4;i++){
      suma += c[i];
    }
    
    for(int i=0;i<4;i++){
      per[i] = (c[i]*100)/suma;
      print(" >>C"+i+": "+per[i]+"%<< ");
    }
    
    print("-------------------------------------------");
    
    // aqui saca los grados equivalentes de los porcentajes
    for(int i=0;i<4;i++){
      grad[i] = (per[i]*360)/100;
      print(" >>C"+i+": "+grad[i]+"<< ");
    }
    
    porcentaje = true;
  }
  
  void GeneraAleatorio(){
    for(int i=0;i<4;i++){
      c[i] = (int)random(150);
    }
    
    porcentaje = false;
  }
  
}


class BotaTodo{
  int x,y;
  int despX,despY;
  boolean rebotaX,rebotaY;
  //Dashboard obj1 = new Dashboard();
  
  BotaTodo(int x,int y,int despX,int despY){
    this.x = x;
    this.y = y;
    this.despX = despX;
    this.despY = despY;
    rebotaX = false;
    rebotaY = false;
  }
  
  float MoveX(){
    if(x >= width){
      rebotaX = true;
    }
    
    if(x <= 0){
      rebotaX = false;
    }
    
    if(!rebotaX){
      x+=despX;
    }else{
      x-=despX;
    }
    
    return x;
  }
  
  float MoveY(){
    if(y >= height){
      rebotaY = true;
    }
    
    if(y <= 0){
      rebotaY = false;
    }
    
    if(!rebotaY){
      y+=despY;
    }else{
      y-=despY;
    }
    
    return y;
  }
}

BotaTodo pastel = new BotaTodo(550,200,10,10);
BotaTodo donut = new BotaTodo(550,500,15,15);
BotaTodo rect = new BotaTodo(100,100,10,15);
Dashboard graph = new Dashboard();

void setup(){
  size(1200,720);
}


void draw(){
  background(180);
  frameRate(60);
  //graph.GeneraAleatorio();
  graph.DashRect((int)rect.MoveX(),(int)rect.MoveY());
  graph.DashCake((int)pastel.MoveX(),(int)pastel.MoveY(),200);
  
  graph.DashDonut((int)donut.MoveX(),(int)donut.MoveY(),200,180);
  //graph.Rebota(20);
}
