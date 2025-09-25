class Circle {
  float x, y;
  float r;
  float speedX, speedY;
  color col;
  
  Circle() {
    x = random(width);
    y = random(height);
    r = random(15, 40);
    speedX = random(0.5, 1.5); // slower
    speedY = random(0.5, 1.5);
    
    if (random(1) < 0.5) {
      col = color(random(200, 255), random(100, 150), 0, 200); // orange
    } else {
      col = color(0, 0, random(150, 255), 200); // navy blue
    }
  }
  
  void move() {
    x += speedX;
    y += speedY;
    
    if (x < 0 || x > width) speedX *= -1;
    if (y < 0 || y > height) speedY *= -1;
  }
  
  void display() {
    noStroke();
    fill(col);
    ellipse(x, y, r, r);
  }
}
