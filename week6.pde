import processing.core.*;
import peasy.*;
import controlP5.*;
import java.util.ArrayList;

int red = 235;
int green = 255;
int blue = 45;

PeasyCam cam;
ControlP5 cp;
  
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector pos) {
    position = pos.copy();
    velocity = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0, 0);
    lifespan = 255;
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2;
  }

  void display() {
    stroke(255, lifespan);
    fill(red,green,blue,lifespan);
    pushMatrix();
    translate(position.x, position.y, position.z);
    box(10); // Use a 3D box instead of a 2D ellipse
    popMatrix();
  }

  boolean isDead() {
    return lifespan < 0;
  }
  
  void applyAttraction(PVector attraction) {
    float forceMagnitude = 0.000001; // 可调整的力的大小
    float minDistance = 20; // 最小距离，小于此距离时不再施加力
    float distance = PVector.dist(position, attraction);

    if (distance > minDistance) {
      PVector force = PVector.sub(attraction, position);
      force.normalize();
      force.mult(forceMagnitude*distance);
      acceleration.add(force);
    }
  }
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector attraction;

  ParticleSystem(PVector pos, PVector attract) {
    origin = pos.copy();
    particles = new ArrayList<Particle>();
    attraction = attract.copy();
  }

  void addParticle() {
    PVector particlePos = origin.copy();
    particles.add(new Particle(particlePos));
  }

  void applyRepulsion(Particle particle, Particle other) {
    float forceMagnitude = 0.0000001; // Adjustable force magnitude
    float minDistance = 20; // Minimum distance at which the force is no longer applied
    float distance = PVector.dist(particle.position, other.position);

    if (distance > minDistance) {
      PVector force = PVector.sub(particle.position, other.position);
      force.normalize();
      force.mult(forceMagnitude /distance);
      particle.acceleration.add(force);
    }
  }

  void update() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle particle = particles.get(i);
      particle.update();

      // Apply repulsion to other particles
      for (int j = particles.size() - 1; j >= 0; j--) {
        if (i != j) {
          Particle other = particles.get(j);
          applyRepulsion(particle, other);
        }
      }

      // Apply attraction to the center point
      particle.applyAttraction(attraction);

      if (particle.isDead()) {
        particles.remove(i);
      }
    }
  }

  void display() {
    for (Particle particle : particles) {
      particle.display();
    }
  }
}

ParticleSystem ps;

void setup() {
  background(0);
  size(1600, 1000, P3D); // Set canvas size to 3D space
  cam = new PeasyCam(this, 400);
  UI();
  
  // Set initial position of the particle system and attraction point
  PVector origin = new PVector(0, 0, 0);
  PVector attraction = new PVector(0, 0, 0);

  ps = new ParticleSystem(origin, attraction);
}

void draw() {
  background(0);
  
  ps.addParticle();
  ps.update();
  ps.display();
  cam.beginHUD();
  cp.draw();
  cam.endHUD();
  
  if (mouseX<300 && mouseY<600) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }

}
