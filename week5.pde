import peasy.*;
import controlP5.*;
PVector[][] vp1;
PVector[][] vp2;
PVector[][] vp3;

int layer = 20;
int section = 36;
float radiu1 = 200;
float cyHigth = 20;
float space1 = 20;
float radiu2 = 220;
float space2 = 30;
float radiu3 = 230;
int sectionOr = 18;
float spaceAngle1 = PI/50;
float spaceAngle2 = PI/30;
float rotateAngle = 0;
float rotateAngleBody = PI/80;

PeasyCam cam;
ControlP5 cp;

void setup(){
  size(1600, 800, P3D);
  background(0);
  cam = new PeasyCam(this, 400);
  UI();
  
  //buildCylinder();
}

void draw(){
  background(0);
  //strokeWeight(sw);
  //stroke(200,200,0);
  //ellipse(0, 0, dia, dia);
  
  radiu2 = radiu1+space1;
  radiu3 = radiu1+space2;
  
  buildCylinder();
  
  displayCylinder();
  keyPressed();
  
  cam.beginHUD();
  cp.draw();
  cam.endHUD();
  
  if (mouseX<300 && mouseY<600) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void buildCylinder(){
  section = 2*sectionOr;
    
  vp1 = new PVector[layer][section];
  vp2 = new PVector[layer][section/2];
  vp3 = new PVector[layer][section/2];

  float angle1 = TWO_PI/section;
  float angle2 = 2*TWO_PI/section;
  
  for(int i = 0; i < layer; i ++){
    for(int j = 0; j < section; j ++){
      vp1[i][j] = new PVector(radiu1*cos(angle1*j + rotateAngleBody*i), radiu1*sin(angle1*j + rotateAngleBody*i), cyHigth*i);
    }
  }

  for(int i = 0; i < layer; i ++){
    for(int j = 0; j < section/2; j ++){
      vp2[i][j] = new PVector(radiu2*cos(angle2*j + rotateAngle + spaceAngle1 + rotateAngleBody*i), radiu2*sin(angle2*j + rotateAngle + spaceAngle1 + rotateAngleBody*i), cyHigth*i);
      vp3[i][j] = new PVector(radiu3*cos(angle2*j + spaceAngle1 + spaceAngle2 + rotateAngle + rotateAngleBody*i), radiu3*sin(angle2*j + spaceAngle1 + spaceAngle2 + rotateAngle + rotateAngleBody*i), cyHigth*i);
    }
    rotateAngle = rotateAngle + angle1;
  }
  rotateAngle = 0;
}

void displayCylinder(){
  //fill(200);
  strokeWeight(1);
  stroke(255);
  fill(0);
  for(int j = 0; j < vp1[0].length; j ++){
      beginShape(TRIANGLES);
      vertex(vp1[0][j].x, 
             vp1[0][j].y, 
             vp1[0][j].z);
      vertex(vp1[0][(j+1)%vp1[0].length].x, 
             vp1[0][(j+1)%vp1[0].length].y, 
             vp1[0][(j+1)%vp1[0].length].z); 
      vertex(0, 
             0, 
             0);
      endShape();
    }
    for(int j = 0; j < vp1[0].length; j = j + 2){
      beginShape(TRIANGLES);
      vertex(vp1[0][j].x, 
             vp1[0][j].y, 
             vp1[0][j].z);
      vertex(vp1[0][(j+1)%vp1[0].length].x, 
             vp1[0][(j+1)%vp1[0].length].y, 
             vp1[0][(j+1)%vp1[0].length].z); 
      vertex(vp1[1][j].x, 
             vp1[1][j].y, 
             vp1[1][j].z);
             
      vertex(vp1[1][j].x, 
             vp1[1][j].y, 
             vp1[1][j].z);
      vertex(vp1[1][(j+1)%vp1[0].length].x, 
             vp1[1][(j+1)%vp1[0].length].y, 
             vp1[1][(j+1)%vp1[0].length].z); 
      vertex(vp1[0][(j+1)%vp1[0].length].x, 
             vp1[0][(j+1)%vp1[0].length].y, 
             vp1[0][(j+1)%vp1[0].length].z); 
      endShape();
    }
    fill(255);
    for(int j = 0; j < vp1[0].length; j ++){
      beginShape(TRIANGLES);
      vertex(vp1[vp1.length-1][j].x, 
             vp1[vp1.length-1][j].y, 
             vp1[vp1.length-1][j].z);
      vertex(vp1[vp1.length-1][(j+1)%vp1[0].length].x, 
             vp1[vp1.length-1][(j+1)%vp1[0].length].y, 
             vp1[vp1.length-1][(j+1)%vp1[0].length].z); 
      vertex(0, 
             0, 
             cyHigth*(layer-1));
      endShape();
    }
    
  for(int j = 0; j < vp1[0].length; j = j + 2){
      beginShape(TRIANGLES);
      vertex(vp1[vp1.length-1][j].x, 
             vp1[vp1.length-1][j].y, 
             vp1[vp1.length-1][j].z);
      vertex(vp1[vp1.length-1][(j-1+vp1[0].length)%vp1[0].length].x, 
             vp1[vp1.length-1][(j-1+vp1[0].length)%vp1[0].length].y, 
             vp1[vp1.length-1][(j-1+vp1[0].length)%vp1[0].length].z); 
      vertex(vp1[vp1.length-2][j].x, 
             vp1[vp1.length-2][j].y, 
             vp1[vp1.length-2][j].z);
             
      vertex(vp1[vp1.length-2][j].x, 
             vp1[vp1.length-2][j].y, 
             vp1[vp1.length-2][j].z);
      vertex(vp1[vp1.length-2][(j-1+vp1[0].length)%vp1[0].length].x, 
             vp1[vp1.length-2][(j-1+vp1[0].length)%vp1[0].length].y, 
             vp1[vp1.length-2][(j-1+vp1[0].length)%vp1[0].length].z); 
      vertex(vp1[vp1.length-1][(j-1+vp1[0].length)%vp1[0].length].x, 
             vp1[vp1.length-1][(j-1+vp1[0].length)%vp1[0].length].y, 
             vp1[vp1.length-1][(j-1+vp1[0].length)%vp1[0].length].z); 
      endShape();
    }
    
  float c = 255/(vp1.length-2);
  int k = 1;
  for(int i = 0; i < vp1.length-1; i ++){
    fill(i*c);
    for(int j = 0; j < vp1[0].length; j = j + 2){
      beginShape(TRIANGLES);
      vertex(vp1[i][(j+k)%vp1[0].length].x, 
             vp1[i][(j+k)%vp1[0].length].y, 
             vp1[i][(j+k)%vp1[0].length].z);
      vertex(vp1[i][(j+1+k)%vp1[0].length].x, 
             vp1[i][(j+1+k)%vp1[0].length].y, 
             vp1[i][(j+1+k)%vp1[0].length].z);
      vertex(vp2[i][(j/2)%vp1[0].length].x, 
             vp2[i][(j/2)%vp1[0].length].y, 
             vp2[i][(j/2)%vp1[0].length].z);
      
      vertex(vp1[i][(j+1+k)%vp1[0].length].x, 
             vp1[i][(j+1+k)%vp1[0].length].y, 
             vp1[i][(j+1+k)%vp1[0].length].z);
      vertex(vp2[i][(j/2)%vp1[0].length].x, 
             vp2[i][(j/2)%vp1[0].length].y, 
             vp2[i][(j/2)%vp1[0].length].z);
      vertex(vp3[i][(j/2)%vp1[0].length].x, 
             vp3[i][(j/2)%vp1[0].length].y, 
             vp3[i][(j/2)%vp1[0].length].z);
             
      endShape();
    }
    k++;
  }
  k=1;
  for(int i = 0; i < vp1.length-2; i ++){
    fill(i*c);
    for(int j = 0; j < vp1[0].length; j = j + 2){
      beginShape(TRIANGLES);
      vertex(vp1[i][(j+k)%vp1[0].length].x, 
             vp1[i][(j+k)%vp1[0].length].y, 
             vp1[i][(j+k)%vp1[0].length].z);
      vertex(vp2[i][(j/2)%vp1[0].length].x, 
             vp2[i][(j/2)%vp1[0].length].y, 
             vp2[i][(j/2)%vp1[0].length].z);
      vertex(vp1[i+2][(j+k)%vp1[0].length].x, 
             vp1[i+2][(j+k)%vp1[0].length].y, 
             vp1[i+2][(j+k)%vp1[0].length].z);
             
      vertex(vp2[i][(j/2)%vp1[0].length].x, 
             vp2[i][(j/2)%vp1[0].length].y, 
             vp2[i][(j/2)%vp1[0].length].z);
      vertex(vp1[i+2][(j+k)%vp1[0].length].x, 
             vp1[i+2][(j+k)%vp1[0].length].y, 
             vp1[i+2][(j+k)%vp1[0].length].z);
      vertex(vp2[i+2][(j/2-1+vp2[0].length)%vp2[0].length].x, 
             vp2[i+2][(j/2-1+vp2[0].length)%vp2[0].length].y, 
             vp2[i+2][(j/2-1+vp2[0].length)%vp2[0].length].z);
             
      vertex(vp1[i][(j+k)%vp1[0].length].x, 
             vp1[i][(j+k)%vp1[0].length].y, 
             vp1[i][(j+k)%vp1[0].length].z);
      vertex(vp1[i][(j+k+1)%vp1[0].length].x, 
             vp1[i][(j+k+1)%vp1[0].length].y, 
             vp1[i][(j+k+1)%vp1[0].length].z);
      vertex(vp1[i+2][(j+k)%vp1[0].length].x, 
             vp1[i+2][(j+k)%vp1[0].length].y, 
             vp1[i+2][(j+k)%vp1[0].length].z);
             
      vertex(vp1[i][(j+k+1)%vp1[0].length].x, 
             vp1[i][(j+k+1)%vp1[0].length].y, 
             vp1[i][(j+k+1)%vp1[0].length].z);
      vertex(vp1[i+2][(j+k)%vp1[0].length].x, 
             vp1[i+2][(j+k)%vp1[0].length].y, 
             vp1[i+2][(j+k)%vp1[0].length].z);
      vertex(vp1[i+2][(j+k+1)%vp1[0].length].x, 
             vp1[i+2][(j+k+1)%vp1[0].length].y, 
             vp1[i+2][(j+k+1)%vp1[0].length].z);
             
      vertex(vp1[i][(j+k+1)%vp1[0].length].x, 
             vp1[i][(j+k+1)%vp1[0].length].y, 
             vp1[i][(j+k+1)%vp1[0].length].z);
      vertex(vp1[i+2][(j+k+1)%vp1[0].length].x, 
             vp1[i+2][(j+k+1)%vp1[0].length].y, 
             vp1[i+2][(j+k+1)%vp1[0].length].z);
      vertex(vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].x, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].y, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].z);
             
      vertex(vp1[i][(j+k+1)%vp1[0].length].x, 
             vp1[i][(j+k+1)%vp1[0].length].y, 
             vp1[i][(j+k+1)%vp1[0].length].z);
      vertex(vp3[i][(j/2+vp2[0].length)%vp2[0].length].x, 
             vp3[i][(j/2+vp2[0].length)%vp2[0].length].y, 
             vp3[i][(j/2+vp2[0].length)%vp2[0].length].z);
      vertex(vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].x, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].y, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].z);
             
      vertex(vp2[i][(j/2)%vp1[0].length].x, 
             vp2[i][(j/2)%vp1[0].length].y, 
             vp2[i][(j/2)%vp1[0].length].z);
      vertex(vp3[i][(j/2+vp2[0].length)%vp2[0].length].x, 
             vp3[i][(j/2+vp2[0].length)%vp2[0].length].y, 
             vp3[i][(j/2+vp2[0].length)%vp2[0].length].z);
      vertex(vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].x, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].y, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].z);
             
      vertex(vp2[i][(j/2)%vp1[0].length].x, 
             vp2[i][(j/2)%vp1[0].length].y, 
             vp2[i][(j/2)%vp1[0].length].z);
      vertex(vp2[i+2][(j/2-1+vp2[0].length)%vp2[0].length].x, 
             vp2[i+2][(j/2-1+vp2[0].length)%vp2[0].length].y, 
             vp2[i+2][(j/2-1+vp2[0].length)%vp2[0].length].z);
      vertex(vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].x, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].y, 
             vp3[i+2][(j/2-1+vp2[0].length)%vp2[0].length].z);
             
      endShape();
    }
    k++;
  }

  for(int i = 0; i < vp1.length; i ++){
    for(int j = 0; j < vp1[0].length; j = j + 2){
      point(vp1[i][j].x, vp1[i][j].y, vp1[i][j].z);
    }
  }
  
  for(int i = 0; i < vp2.length; i ++){
    for(int j = 0; j < vp2[0].length; j ++){
      point(vp2[i][j].x, vp2[i][j].y, vp2[i][j].z);
      point(vp3[i][j].x, vp3[i][j].y, vp3[i][j].z);
    }
  }
}
