ArrayList<Mondrian> Arects;

void setup() {
  size(1000,1000);
  Arects = new ArrayList<Mondrian>();
    //divide(0,0,width,height,randomcolor1());
    strokeWeight(5);
}

void draw() {
  background(255);

  for (int i = Arects.size() - 1; i >= 0; i--) {
    Mondrian r = Arects.get(i);
    r.update();
    r.display();
    if (r.isTransparent()) {
      Arects.remove(i);
    }
  }

  if (Arects.isEmpty()) {
    // 如果所有的矩形都已经消失，那么生成新的矩形
    divideRect(0, 0, width, height,randomcolor());
  }
}




void divideRect(float x, float y, float w, float h, color c) {
  float minSize = 50; // 设置矩形的最小尺寸
  float maxSize = 300; // 设置矩形的最大尺寸

  if (w > minSize && h > minSize) {
    if (w > maxSize && h > maxSize) {
      // 如果宽度和高度都大于最大尺寸，那么按照最大尺寸来划分区域
      divideRect(x, y, maxSize, maxSize, c);
      divideRect(x + maxSize, y, w - maxSize, h, c);
      divideRect(x, y + maxSize, w, h - maxSize, c);
    } else if (random(1) > 0.5) {
      // 水平划分
      float h1 = random(minSize, h);
      Arects.add(new Mondrian(x, y, w, h1, c));
      divideRect(x, y + h1, w, h - h1, randomcolor());
    } else {
      // 垂直划分
      float w1 = random(minSize, w);
      Arects.add(new Mondrian(x, y, w1, h, c));
      divideRect(x + w1, y, w - w1, h, randomcolor());
    }
  } else {
    // 绘制矩形
    Arects.add(new Mondrian(x, y, w, h, c));
  }
}

color randomcolor() {
  float r = random(1);
  if (r < 2.0 / 15.0) {
    return color(255,0,0); 
  } else if (r < 4.0 / 15.0) {
    return color(255,255,0); 
  } else if (r < 6.0 / 15.0) {
    return color(0,0,255); 
  } else if (r < 14.0 / 15.0) {
    return color(255,255,255);
  } else {
    return color(200,200,200);
  }
}
