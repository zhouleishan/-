PImage img;

//设定变量
int smallPoint, largePoint;

//开始设置
void setup() {
  size(1920, 1080);
  smallPoint = 4;
  largePoint = 8;
  imageMode(CENTER);
  noStroke();
  background(0);
}

//开画
void draw() {
  noStroke();
  fill(0,10);
  rect(0, 0, width, height);
  
  //画蒙娜丽莎
  img = loadImage("monalisa.png");
  drawPicture(1);
  
  //画达芬奇
  img = loadImage("Vinci.png");
  drawPicture(-1);
  
  //存画画每一帧
  String filename = "zls" + frameCount + ".png";
  saveFrame(filename);

  frameCount++;

}

//画画函数
void drawPicture(int cch){
  for(int i=0;i<5000;i++){
    float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);
    fill(pix, 100);
    ellipse(x+cch*2*(mouseX-width/2)+width/2-265, y+mouseY-315, pointillize, pointillize);
  }
}
