void UI() {
  cp = new ControlP5(this, createFont("微软雅黑", 16));
  cp.addSlider("radiu1", 0, 500, 100, 50, 50, 200, 30).setLabel("直径");
  cp.addSlider("layer", 5, 200, 100, 50, 50+(30+10)*1, 200, 30).setLabel("层数");
  cp.addSlider("sectionOr", 0, 50, 18, 50, 50+(30+10)*2, 200, 30).setLabel("段数");
  cp.addSlider("spaceAngle1", -PI/5, PI/5, PI/50, 50, 50+(30+10)*3, 200, 30).setLabel("凸起旋转角度");
  cp.addSlider("spaceAngle2", -PI/5, PI/5, PI/50, 50, 50+(30+10)*4, 200, 30).setLabel("凸起大小角度");
  cp.addSlider("space1", 0, 50, 20, 50, 50+(30+10)*5, 200, 30).setLabel("凸起一侧距离");
  cp.addSlider("space2", 0, 50, 25, 50, 50+(30+10)*6, 200, 30).setLabel("凸起另一侧距离");
  cp.addSlider("rotateAngleBody", -PI/5, PI/5, PI/80, 50, 50+(30+10)*7, 200, 30).setLabel("倾斜角度");
  cp.addSlider("cyHigth", 10, 200, 20, 50, 50+(30+10)*8, 200, 30).setLabel("层高");
  cp.setAutoDraw(false);
}
