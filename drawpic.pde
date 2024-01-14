void drawpic() {
  
  element1 = 0;
  element2 = 0;
  element3 = 0;
  element4 = 0;
  
  float sum1 = 0;
  for (float number1 : numbers1) {
    sum1 += number1;
  }
  float sum2 = 0;
  for (float number2 : numbers2) {
    sum2 += number2;
  }
  
  ArrayList<Integer> ratio1 = new ArrayList<Integer>();
  ArrayList<Integer> ratio2 = new ArrayList<Integer>();
  
  for (float number1 : numbers1) {
    int sanLength1 =int(400*number1/sum1);
    ratio1.add(sanLength1);
  }
  for (float number2 : numbers2) {
    int sanLength2 = int(400*number2/sum2);
    ratio2.add(sanLength2);
  }
  for(int i=0;i<numberCount-1;i++){
    element3 = element1;
    element4 = element2;
    
    element1 += ratio1.get(i);
    element2 += ratio2.get(i);
    if(colorNum<colors.length){
    colorNum++; 
    }
    if(colorNum>=colors.length){
      colorNum=0; 
    }
    for(int j=element3;j<element1;j++){
      int k = int(map(j,element3,element1,element4,element2));
      
      String label = labels1.get(i);
      text(label, 350, 300+(element3+element1)/2);
      
      label = labels2.get(i);
      text(label, 950, 300+(element4+element2)/2);
      drawSmoothCurve(400,300+j,900,300+k,500,300+j,800,300+k);
    }
  }
}
