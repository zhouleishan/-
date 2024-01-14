int colorNum = 0; // 将 j 的声明移动到循环外部

void drawSmoothCurve(float startX, float startY, float endX, float endY, float controlX1, float controlY1, float controlX2, float controlY2) {
  float t = 0;
  float hue = 3; // 随机选择一个色相值
  for (int i = 0; i < numberCount-1; i++) {
    float saturation1 = 60; // 随机选择第一个颜色的饱和度
    colors[i] = color(hue + (i * 99) % 360, saturation1, 100); // 亮度设置为 100，以确保颜色鲜明
  }
  

  while (t <= 1) {
    // 计算贝塞尔曲线上的点
    float x = bezierPoint(startX, controlX1, controlX2, endX, t);
    float y = bezierPoint(startY, controlY1, controlY2, endY, t);
    
    // 绘制贝塞尔曲线上的点
    noStroke();
    fill(colors[colorNum]);
    ellipse(x, y, 5, 5);
    
    // 增加参数 t 的值
    t += 0.005;
  }

  
}
