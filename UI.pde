void UI() {
  cp = new ControlP5(this, createFont("微软雅黑", 16));
  cp.addSlider("red", 0, 255, 235, 50, 50, 200, 30).setLabel("红");
  cp.addSlider("green", 0, 255, 255, 50, 50+(30+10)*1, 200, 30).setLabel("绿");
  cp.addSlider("blue", 0, 255, 45, 50, 50+(30+10)*2, 200, 30).setLabel("蓝");
  cp.addSlider("forceMagnitude", 0.0000001, 0.01, 0.000001, 50, 50+(30+10)*3, 200, 30).setLabel("吸引力");
  cp.setAutoDraw(false);
}
