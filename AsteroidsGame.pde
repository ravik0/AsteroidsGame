Spaceship bob;
Stars[] bill = new Stars[(int)(Math.random()*20)+7];
boolean forward, back, turnl, turnr = false;
public void setup() {
  bob = new Spaceship();
  size(400,400);
  for (int i = 0; i < bill.length; i++) {
    bill[i] = new Stars();
  }
}
public void draw() {
  background(255);
  bob.show();
  bob.move();
  for (int i = 0; i < bill.length; i++) {
    bill[i].show();
  }
  if (forward == true) {
    bob.accelerate(0.05);
    bob.rocketMan();
  }
  if (back == true) {
    bob.accelerate(-0.05);
  }
  if (turnl == true) {
    bob.turn(10);
  }
  if (turnr == true) {
    bob.turn(-10);
  }
}
public void keyPressed() {
  if (key == 'w') {
    forward = true;
  }
  else if (key == 's') {
    back = true;
  }
  else if (key == 'a') {
    turnl = true;
  }
  else if (key == 'd') {
    turnr = true;
  }
  else if (key == 'h') {
    bob.setX(((int)(Math.random()*400)));
    bob.setY(((int)(Math.random()*400)));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)Math.random()*361);
  }
}
public void keyReleased() {
  if (key == 'w') {
    forward = false;
  }
  else if (key == 's') {
    back = false;
  }
  else if (key == 'a') {
    turnl = false;
  }
  else if (key == 'd') {
    turnr = false;
  }
}