//maurice fulton guided with 

int w = 340;
int mingap = 2;//min gap between bars
int maxgap = 12;//max gap between bars
int marginX = 100;
int marginY = 130;
float dMouse = 25;
ArrayList<Bar> bars;

void setup() {
  size(550, 450, P2D);
  strokeCap(SQUARE);
  stroke(0);
  noFill();
  initalize();
}

void initalize() {
  bars = new ArrayList<Bar>();
  boolean isGap = false;
  int i = 0;
  while (i < w) {
    float r = random(1);
    int l = 1;
    for (int j = 1; j < (maxgap - mingap); j++) {
      if (r > 1 / float(j)) {
        l = j;
        break;
      }
    }
    if (!isGap) {
      for (int j = 0; j < l; j ++) {
        float k = bars.size()%2 == 0 ? 1 : -1;
        k *= 5;//map(l, mingap, maxgap, 5, 2);
        bars.add(new Bar(i+j, 1, k));
      }
      //      float k = bars.size()%2 == 0 ? 1 : -1;
      //      k *= 5;//map(l, mingap, maxgap, 5, 2);
      //      bars.add(new Bar(i, l, k));
    }
    i += l;
    isGap = !isGap;
  }
}

void mousePressed() {
  initalize();
}

void keyPressed() {
  maxgap = maxgap == 12 ? 2 : 12;
  initalize();
}

void draw() {
  background(220);
  for (Bar b : bars) {
    b.update();
    b.display();
  }
}

class Bar {
  int nb = 30;
  int str;
  PVector[] pos;
  int dPoints = 6;
  float k;

  Bar(int x, int _strokeWeight, float _k) {
    str = _strokeWeight;
    k = _k;
    pos = new PVector[nb];
    for (int i = 0; i < nb; i ++) {
      pos[i] = new PVector(x + marginX, i*dPoints + marginY);
      if (k < 1) {
        pos[i].y = marginY + (nb-1) * dPoints - i*dPoints;
      }
    }
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
      for (int i = 1; i < nb; i ++) {
        //mouse interaction
        pos[i].y += k;
        float d = PVector.dist(mouse, pos[i]);
        if (d < dMouse) {
          PVector tmpPV = mouse.get();       
          tmpPV.sub(pos[i]);
          tmpPV.normalize();
          tmpPV.mult(dMouse);
          tmpPV = PVector.sub(mouse, tmpPV);
          pos[i] = tmpPV.get();
        }
      }
      for (int i = 1; i < nb; i ++) {
        PVector tmp = PVector.sub(pos[i-1], pos[i]);
        tmp.normalize();
        tmp.mult(dPoints);
        pos[i] = PVector.sub(pos[i-1], tmp);
      }      
  }

  void display() {
    strokeWeight(str);
    beginShape();
    for (int i = 0; i < nb; i ++) {
      vertex(pos[i].x, pos[i].y);
    }
    endShape();
  }
}
