import controlP5.*;

ControlP5 cp5;
Textfield inputNumberField, inputTextField;
Textfield multiplyNumberField, multiplyTextField;

Textlabel promptLabel1, promptLabel2, promptLabel3, promptLabel4;

Button addButton, saveButton;
Button drawButton;

ArrayList<Float> numbers1 = new ArrayList<Float>();
ArrayList<String> labels1 = new ArrayList<String>();

ArrayList<Float> numbers2 = new ArrayList<Float>();
ArrayList<String> labels2 = new ArrayList<String>();

color[] colors; 

int numberCount = 1;
boolean button = false;

int element1 = 0;
int element2 = 0;
int element3 = 0;
int element4 = 0;

void setup() {
  size(1000, 800);
  colorMode(HSB, 360, 100, 100);
   // 创建具有三个元素的颜色数组
  
  cp5 = new ControlP5(this);
  
  promptLabel1 = cp5.addTextlabel("prompt1")
                  .setText("第" + numberCount + "个品牌关键词:")
                  .setPosition(50, 50)
                  .setColorValue(0)
                  .setFont(createFont("微软雅黑", 20));

  promptLabel2 = cp5.addTextlabel("prompt2")
                  .setText("第" + numberCount + "个品牌关键词的占比:")
                  .setPosition(50, 100)
                  .setColorValue(0)
                  .setFont(createFont("微软雅黑", 20));
                  

  
  inputNumberField = cp5.addTextfield("inputNumber")
                        .setPosition(300, 95)
                        .setSize(100, 30)
                        .setFont(createFont("微软雅黑", 20))
                        .setFocus(true);
  
  inputTextField = cp5.addTextfield("inputText")
                      .setPosition(300, 45)
                      .setSize(100, 30)
                      .setFont(createFont("微软雅黑", 20));
  
  addButton = cp5.addButton("add")
                .setPosition(450, 150)
                .setSize(100, 30)
                .setCaptionLabel("ADD");

  
  promptLabel3 = cp5.addTextlabel("prompt3")
                  .setText("第" + numberCount + "个用户形容词:")
                  .setPosition(500, 50)
                  .setColorValue(0)
                  .setFont(createFont("微软雅黑", 20));
                  
  promptLabel4 = cp5.addTextlabel("prompt4")
                  .setText("第" + numberCount + "个用户形容词的人数:")
                  .setPosition(500, 100)
                  .setColorValue(0)
                  .setFont(createFont("微软雅黑", 20));
  
  multiplyNumberField = cp5.addTextfield("multiplyNumber")
                          .setPosition(750, 95)
                          .setSize(100, 30)
                          .setFont(createFont("微软雅黑", 20));
  
  multiplyTextField = cp5.addTextfield("multiplyText")
                        .setPosition(750, 45)
                        .setSize(100, 30)
                        .setFont(createFont("微软雅黑", 20));
  
  drawButton = cp5.addButton("tureFalse")
                       .setPosition(600, 150)
                       .setSize(100, 30)
                       .setCaptionLabel("DRAW");
                              
  saveButton = cp5.addButton("savePic")
                  .setPosition(750, 150)
                  .setSize(100, 30)
                  .setCaptionLabel("SAVE");
}

void draw() {
  background(0,0,100);
  frameRate(30);
  colors = new color[numberCount-1];
  if(button){
    
    drawpic();
  }
  
  // 显示加法得到的数字和标注
  textAlign(CENTER, CENTER);
  textSize(16);
  fill(0);
  for (int i = 0; i < numbers1.size(); i++) {
    float number = numbers1.get(i);
    String label = labels1.get(i);
    text(label + ": " + number, 100, 200 + i * 30);
  }
  
  // 显示加法计算结果
  textSize(20);
  
  // 显示乘法得到的数字和标注
  textAlign(CENTER, CENTER);
  textSize(16);
  fill(0);
  for (int i = 0; i < numbers2.size(); i++) {
    float number = numbers2.get(i);
    String label = labels2.get(i);
    text(label + ": " + number, 250, 200 + i * 30);
  }
  
  // 显示乘法计算结果
  textSize(20);
}

void add() {
  String numberInput1 = inputNumberField.getText();
  float number1 = Float.parseFloat(numberInput1);
  numbers1.add(number1);
  
  String label1 = inputTextField.getText();
  labels1.add(label1);
  
  numberCount++;
  promptLabel1.setText("第" + numberCount + "个品牌关键词:");
  
  promptLabel2.setText("第" + numberCount + "个品牌关键词的占比:");
  
  inputNumberField.clear();
  inputTextField.clear();

  String numberInput2 = multiplyNumberField.getText();
  float number2 = Float.parseFloat(numberInput2);
  numbers2.add(number2);

  String label2 = multiplyTextField.getText();
  labels2.add(label2);

  promptLabel3.setText("第" + numberCount + "个用户形容词:");
  promptLabel4.setText("第" + numberCount + "个用户形容词的人数:");

  multiplyNumberField.clear();
  multiplyTextField.clear();
}
