// by Mace, as teached by Daniel Shiffman author of Nature of
// Code, on his video at https://vimeo.com/channels/543239

import processing.serial.*;

Serial myPort;
int fractalSize = 250;

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  size(500, 500);
  background(0);
  // noFill();
  fill(255, 30);
  stroke(255);
  strokeWeight(0.01);
  smooth();
}

void draw() {
  if (myPort.available() > 0) {
    fractalSize = myPort.read() * 10;
    println("Received data " + fractalSize);
  }
  drawCircle(width/2, height/2, fractalSize);
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
