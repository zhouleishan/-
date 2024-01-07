import controlP5.*;
ControlP5 cp;

void setup() {
  size(800, 800);
  background(0);
  UI();
}
float angle = 0;
float addAngle = 1;
int depth = 12;
boolean depthSign = true;
int dragonNum = 15;
int dragonLenAdd = 0;
int dragonLen = 800;
int dltDepth = 1;
float space = 1.4;
int strokeWei = 3;

void draw() {
  cp.draw();
  noStroke();
  fill(0,50);
  rect(0, 0, width, height);
  for(int i=0 ; i<dragonNum ; i++){
    dragon(400, 400, dragonLen - dragonLenAdd*i, angle +i * (360/dragonNum), depth);
  }
  angle += addAngle;
  if (depth<12-dltDepth){
    depthSign = true;
  }
  if (depth>12){
    depthSign = false;
  }
  if(depthSign){
        depth += 1;
  }
  else{
    depth -= 1;
  }
}

float add = 0.01;
float red = 0;
float green = 100;
float blue = 200;
boolean redSign = true;
boolean greenSign = true;
boolean blueSign = true;

void dragon(float x, float y, float len, float angle, int depth) {
  if (depth == 0) {
    float x2 = x + len * cos(radians(angle));
    float y2 = y + len * sin(radians(angle));
    stroke(red,green,blue,10);
    strokeWeight(strokeWei);
    line(x, y, x2, y2);
    if (red<10){
      redSign = true;
    }
    if (red>250){
      redSign = false;
    }
    if(redSign){
          red += add;
    }
    else{
      red -= add;
    }
    
    if (green<10){
      greenSign = true;
    }
    if (green>250){
      greenSign = false;
    }
    if(greenSign){
          green += add;
    }
    else{
      green -= add;
    }
    
    if (blue<10){
      blueSign = true;
    }
    if (blue>250){
      blueSign = false;
    }
    if(blueSign){
          blue += add;
    }
    else{
      blue -= add;
    }

    
    
  } else {
    len /= space;
    dragon(x, y, len, angle, depth - 1);
    dragon(x + len * cos(radians(angle + 90)), y + len * sin(radians(angle + 90)), len, angle - 90, depth - 1);
  }
}

void keyPressed() {
  if (key == 'c' || key == 'C'){
    // 点击鼠标左键时切换值
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
  }
}
