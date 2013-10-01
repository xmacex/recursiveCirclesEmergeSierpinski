// by Mace, as teached by Daniel Shiffman author of Nature of
// Code, on his video at https://vimeo.com/channels/543239 

void setup() {
  size(500, 500);
  background(0);
  // noFill();
  fill(255, 30);
  stroke(255);
  strokeWeight(0.01);
  smooth();
  noLoop();
}

void draw() {
  drawCircle(width/2, height/2, 250);
}

void drawCircle(float x, float y, float d) {
  // stroke(50+((255-50)/(d % 9)));
  ellipse(x, y, d, d);
  if(d > 3) {
    drawCircle(x + d/2, y, d - d/2);
    drawCircle(x - d/2, y, d - d/2);
    drawCircle(x, y + d/2, d - d/2);
  }
}
