

class Planet {
  float radius;
  float distance;
  Planet[] planets;
  float angle;
  float orbitspeed;
  PVector v;
  
  float counter = 0;
  int c = 0;

  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    // Align planets 
    v = new PVector(-0.8820074, -0.45320854, 0.12909274);
    
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(10);
    orbitspeed = o;

    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void drawBelts()
  {
    rotateX(344);
    strokeWeight(1);
    stroke(255, 105, 0);
    noFill();
    // Mercury
    ellipse(0,0,232,232);
    
    stroke(200, 0, 0);
    // Venus    
    ellipse(0,0,310,310);
 
    // Earth
    stroke(0,0,255);
    ellipse(0,0,405, 405);
    //Mars
    stroke(255, 20, 93);
    ellipse(0,0,490, 490);
    //Jupiter
    stroke(255, 255, 0);
    ellipse(0,0,635, 635);
    //Saturn
    stroke(255, 20, 0);
    ellipse(0,0,840, 840);
    //Uranus
    stroke(255);
    ellipse(0,0,1020, 1020);
    //Neptune
    stroke(173,216,230);
    ellipse(0,0,1110, 1110);
    // Pluto
    stroke(238, 130, 238);
    ellipse(0,0,1290, 1290);
    
  }

  void orbit() {
    
    

    // How fast the planets orbit around the sun.    
    angle = angle + 0.001;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
        
      }
    }
  }

  
  void spawnPlanets(int total, int level) {
    planets = new Planet[total];
    for (int i = 2; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = (radius+r)*2;//random((radius + r), (radius+r)*2);
      float o = 1;//random(-0.1, 0.1);
      //int index = int(random(0,textures.length));
  
      planets[0] = new Planet(3, d + 5, o, textures[0]);
      planets[1] = new Planet(10, d + 50, o, textures[1]);
      planets[2] = new Planet(12, d + 100, o, textures[2]);
      planets[3] = new Planet(4, d + 150, o, textures[3]);
      planets[4] = new Planet(35, d + 230, o, textures[4]);
      planets[5] = new Planet(26, d + 350, o, textures[5]);
      planets[6] = new Planet(r, d + 450, o, textures[6]);
      planets[7] = new Planet(r, d + 500, o, textures[7]);
      planets[8] = new Planet(10, d + 600, o, textures[8]);
      //planets[9] = new Planet(20, d + 500, o, textures[9]);
      //planets[i] = new Planet(r, d * i, o, textures[i]);
      
      
      
      if (level < 2) {
        int num = int(random(0,3));
        planets[i].spawnPlanets(num, level+1);
      }
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    //PVector v2 = new PVector(1, 1, 1);
    //PVector p = v.cross(v2);
    rotate(angle, 0, 1, 0);
    //rotate(angle, p.x, p.y, p.z);
    stroke(255);
    //line(0, 0, 0, v.x, v.y, v.z);
    //line(0, 0, 0, p.x, p.y, p.z);

    translate(v.x, 0, v.z);
    noStroke();
    fill(255);
    shape(globe);
    //sphere(radius);
    //ellipse(0, 0, radius*2, radius*2);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}
