/* 
Name: Begum Oglakci
Date: 2025-08-30
Description: This sketch creates moving circles in shades of orange and blue that bounce around the screen. The system begins
with only a few circles, but whenever two intersect, a new one is generated. The properties of each circle, such as position,
size, color, and speed, are determined by randomness,  which ensures that every run of the sketch produces different results.
The rules (movement, bouncing, and reproduction through intersections) allow the piece to evolve  without direct human control,
and over time emergent patterns appear as the circles interact. This makes the sketch a generative piece because it relies on
a system of randomness and rules that  produces unique and unpredictable outcomes beyond direct control.
Place of production: Barcelona, Spain
*/

ArrayList<Circle> circles;
int initialCircles = 7;

void setup() {
  size(800, 600);
  frameRate(20);
  circles = new ArrayList<Circle>();
  
  for (int i = 0; i < initialCircles; i++) {
    circles.add(new Circle());
  }
}

void draw() {
  background(0);
  
  for (Circle c : circles) {
    c.move();
    c.display();
  }
  
  ArrayList<Circle> newCircles = new ArrayList<Circle>();
  for (int i = 0; i < circles.size(); i++) {
    for (int j = i + 1; j < circles.size(); j++) {
      Circle c1 = circles.get(i);
      Circle c2 = circles.get(j);
      float d = dist(c1.x, c1.y, c2.x, c2.y);
      if (d < c1.r + c2.r) {
        // when two circles intersect, prepare a new circle
        newCircles.add(new Circle());
      }
    }
  }
  
  // add only one new circle per frame
  if (newCircles.size() > 0) {
    circles.add(newCircles.get(0));
  }
}
