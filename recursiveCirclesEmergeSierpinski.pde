// by Mace, as teached by Daniel Shiffman author of Nature of
// Code, on his video at https://vimeo.com/channels/543239

import processing.serial.*;
final int MAXFRACTALDEPTH = 10;  // larger integer means less deep fractals

Serial myPort;
int fractalSize = 0;
int prevFractalSize = fractalSize;

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  size(500, 500);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(0.01);
  smooth();
}

void draw() {
  if (myPort.available() > 0) {
    fractalSize = myPort.read();
    println("Received data " + fractalSize);
    // clear canvas if the fractal will resize
    if(fractalSize != prevFractalSize) {
      clear();
    }
  }
  drawCircle(width/2, height/2, fractalSize);
  prevFractalSize = fractalSize;
}

void drawCircle(float x, float y, float d) {
  // stroke(50+((255-50)/(d % 9)));
  ellipse(x, y, d, d);
  if(d > MAXFRACTALDEPTH) {
    drawCircle(x + d/2, y, d - d/2);
    drawCircle(x - d/2, y, d - d/2);
    drawCircle(x, y + d/2, d - d/2);
  }
}
