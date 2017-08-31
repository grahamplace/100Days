//GLOBALS
int w = 800;
float r = (.9 * w) / 2;
int frame_count = 0;
int period = 3000;
float num_divisions = 30;
float loop_split = r / num_divisions;
float loop_period, x_val, y_val;
boolean show_guides = false;

void setup() {
  frameRate(60);
  size(800, 800);
  smooth();
}

void draw() {
  background(8, 35, 48);
  translate(w/2, w/2);
  drawCircles(); //<>//
  frame_count++;
}

void drawCircles() {
  for (float i = num_divisions; i > 0; i--) {
    float loop_r = i * loop_split;

    // Draw each path if show_guides is on
    if (show_guides) {
      stroke(150);
      fill(8, 35, 48);
      ellipse(0, 0, 2 * loop_r, 2 * loop_r);
    }

    // Draw each rotation marking circle
    stroke(255);
    fill(255);
    strokeWeight(2);
    loop_period = period / (2*(num_divisions - i + 1));
    x_val = loop_r * cos(TWO_PI / loop_period * frame_count);
    y_val = loop_r * sin(TWO_PI / loop_period * frame_count);
    ellipse(x_val, y_val, loop_split, loop_split);
  }
}
