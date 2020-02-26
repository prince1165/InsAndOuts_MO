PImage ping;
float lastX;
float lastY;
int amount = 2;

void setup() {
  size(700,700);
  frameRate(1);
  //ellipse(300,300,600,600);
  fill(0);
  ping = loadImage ("ping.jpg");
  create(amount);
}

void draw(){
  

  
  
  image(ping,0,3);
  
    textSize(50);
text("RANDOM MO",199, 350);
  
  
  create(amount);
}






void create(int amountOP){
  fill(255);
  //background(200);
  //ellipse(300,300,600,600);
  fill(255);
  
  for(int i = 0; i < amountOP; i++){
    if(i == 0){
      float radius = random(300);
      float a = random(TWO_PI);
      
      float x = width / 2 + cos(a) * radius;
      float y = height / 2 + sin(a) * radius;
      
      ellipse(x,y,5,5);
      
      lastX = x;
      lastY = y;
    }else{
      float radius = random(300);
      float a = random(TWO_PI);
      
      float x = width / 2 + cos(a) * radius;
      float y = height / 2 + sin(a) * radius;
      
      ellipse(x,y,5,5);
      
      line(x,y,lastX,lastY);
      
      lastX = x;
      lastY = y; 
    }
  }
  amount++;
}
