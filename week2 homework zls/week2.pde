//设立背景
void setup(){
  size(1000,1000);
  background(0);
  frameRate(30);
  //noLoop();
}

//设定参数
int num = 100000;
int i = 1000;
int valSpace = 100;
float x,y;
float d=0;
float lineWid = 0.2;
float pointSize = 0.15;
float sPointSize = 0.2;
float alpVel = 0.2;
color c;
int alpha;

//主要步骤
void draw(){
  background(0);
  for(int lis = 1;lis<=num;lis++){
    x = random(width);
    y = random(height);
    
//参数计算    
    float dstCen = sqrt((x-500)*(x-500)+(y-500)*(y-500))+i;
    float dstCir = dstCen % valSpace;
    float size1 = map(lineWid*valSpace-dstCir,0,lineWid*valSpace,sPointSize*100,100);
    float size2 = map(dstCir-(1-lineWid)*valSpace,0,lineWid*valSpace,sPointSize*100,100);
    float size3 = map(lineWid*valSpace-dstCir,0,lineWid*valSpace,alpVel*100,100);
    float size4 = map(dstCir-(1-lineWid)*valSpace,0,lineWid*valSpace,alpVel*100,100);
    int downColor1 = 255-int(map(lineWid*valSpace-dstCir,0,lineWid*valSpace,255,0));
    int downColor2 = 255-int(map(dstCir-(1-lineWid)*valSpace,0,lineWid*valSpace,255,0));
    
//分类绘画    
    if(dstCir < lineWid*valSpace){
      d=pointSize*size1;
      alpha = int(size3);
      c = color(random(downColor1,255),random(downColor1,255),random(downColor1,255));
    }
    if(dstCir >= lineWid*valSpace && dstCir <= (1-lineWid)*valSpace){
      d=0;
    }
    if(dstCir > (1-lineWid)*valSpace){
      d=pointSize*size2;
      alpha = int(size4);
      c = color(random(downColor2,255),random(downColor2,255),random(downColor2,255));
    }
    drawPoint(x,y,d,c);
  }
  
//循环扩张
  i=i-5;
  //saveFrame();
}
//drawPoint()函数
float cX,cY,dia;
void drawPoint(float x,float y,float d,color fC){
  cX = x;
  cY = y;
  dia = d;
  fC = c;
  fill(fC,alpha);
  noStroke();
  ellipse(cX,cY,dia,dia);
}
