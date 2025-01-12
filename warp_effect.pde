// #######################################################
// Title: Warp effect
// Author: F0rno
// #######################################################

int numStars = 5000;
Star[] stars = new Star[numStars];
int starsSpeed = 16;
float starsBrightness = random(150, 255); 

void setup() {
  fullScreen();
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  for (Star s : stars) {
    s.update();
    s.show();
  }
}

class Star {
  float x, y, z, pz, speed;
  float brightness;

  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    pz = z;
    speed = starsSpeed;
    brightness = starsBrightness;
  }

  void update() {
    z -= speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
      //speed = random(5, 20); // Reset star speed on respawn
      brightness = random(150, 255); // Reset brightness on respawn
    }
  }

  void show() {
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);

    stroke(brightness); // Apply brightness
    strokeWeight(map(z, 0, width, 3, 0)); // Thickness decreases with distance
    line(px, py, sx, sy); // Trail effect
    pz = z;
  }
}
