

import peasy.*;
Planet sun;

PeasyCam cam;

PImage sunTexture;
PImage bg;
PImage[] textures = new PImage[9];

void setup() {
  size(450, 450, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  textures[5] = loadImage("saturn.jpg");
  textures[6] = loadImage("uranus.jpg");
  textures[7] = loadImage("neptune.jpg");
  textures[8] = loadImage("pluto.jpg");
          
  bg = loadImage("space.jpg");
          
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnPlanets(9, 2);
}

void draw() {
  background(bg);
  ambientLight(255,255,255);
  pointLight(255, 255, 255, 0, 0, 0);
  sun.show();
  sun.orbit();
  sun.drawBelts();
}
