PImage cold;
Flyer[] flyers = new Flyer[5];
/////////////////void setup window sizez and the 1st for-statement////////////////////////////////////////////  
void setup() {
  size(800, 800);


  /////////////////////background Image////////////////////////////////
  cold = loadImage ("cold.jpg");
  /////////////////////background Image////////////////////////////////

  for (int i = 0; i < flyers.length; i++) {
    flyers[i] = new Flyer();
  }
}
/////////////////void draw with class flyer ////////////////////////////////////////////  

void draw() {
  background(0);
  /////////////////////background Image////////////////////////////////
  background (0);
  image (cold, 0, 0);
  /////////////////////background Image////////////////////////////////

  textSize(32); // Set text size to 32
  fill(255);
  text("Move the Mouse", 255, 40);
  text("And Watch the Balls Follow", 200, 70);
  text("Maurice Fulton", 255, 100);

  for (int i = 0; i < flyers.length; i++) {
    flyers[i].step();
    flyers[i].draw();
  }
}
/////////////////MO MO MO////////////////////////////////////////////  
class Flyer {

  float x = random(width);
  float y = random(height);
  float heading = random(TWO_PI);
  float speed = random(1, 3);  
  float radius = random(5, 20);
  ///////////////set up with float to follow mouse////////////////////////////////////////////  
  void step() {
    float angleToMouse = atan2(mouseY-y, mouseX-x);

    ///////////prevent case where heading is 350 and angleToMouse is 10//////
    if (heading-angleToMouse > PI) {
      angleToMouse += TWO_PI;
    } else if (angleToMouse-heading > PI) {
      angleToMouse -= TWO_PI;
    }

    ///////////turn towards mouse////////////////////////////////////////////
    if (heading < angleToMouse) {
      heading+=PI/50;
    } else {
      heading-=PI/50;
    }

    ///////////move in direction/////////////////////
    x += cos(heading)*speed;
    y += sin(heading)*speed;
    ///////////move in direction/////////////////////

    ////////////wrap around edges/////////////////////
    if (x < 0) {
      x = width;
    }
    if (x > width) {
      x = 0;
    }

    if (y < 0) {
      y = height;
    }
    if (y > height) {
      y = 0;
    }
  }
  /////////////////the balls///////////////////////  
  void draw() {
    ellipse(x, y, radius, radius);
  }
}
