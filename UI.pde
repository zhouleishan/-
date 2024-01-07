void UI() {
  cp = new ControlP5(this, createFont("微软雅黑", 16));
  cp.addSlider("dragonNum", 1, 15, 15, 50, 50, 200, 30).setLabel("龙曲线个数");
  cp.addSlider("dltDepth", 1, 7, 1, 50, 50+(30+10)*1, 200, 30).setLabel("迭代变化数");
  cp.addSlider("add", 0.001, 0.01, 0.01, 50, 50+(30+10)*2, 200, 30).setLabel("颜色变化速度");
  cp.addSlider("dragonLenAdd", 0, 100, 0, 50, 50+(30+10)*3, 200, 30).setLabel("长度差异量");
  cp.addSlider("addAngle", 0, 5, 1, 50, 50+(30+10)*4, 200, 30).setLabel("旋转速度");
  cp.addSlider("dragonLen", 100, 800, 800, 50, 50+(30+10)*5, 200, 30).setLabel("长度");
  cp.addSlider("space", 1, 2, 1.4, 50, 50+(30+10)*6, 200, 30).setLabel("分型间隔");
  cp.addSlider("strokeWei", 1, 15, 3, 50, 50+(30+10)*7, 200, 30).setLabel("线宽");
  cp.setAutoDraw(false);
}
