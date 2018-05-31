void setup() {
  size(480, 120);
}

void draw() {
  if (mousePressed) {
    fill(254);
  } else {
    fill(142);
  }
  ellipse(mouseX, mouseY, 72, 80);
ellipse(50,50,80,80);
line(436,15,72,-124);


};