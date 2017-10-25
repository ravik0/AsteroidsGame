Spaceship bob;
ArrayList <Asteroids> joe;
Stars[] bill = new Stars[(int)(Math.random()*20)+12];
boolean forward, back, turnl, turnr = false;
boolean invulnerability = false; //when teleporting, make sure doesn't get killed
int timeInvul = 0; //how long invulnerability lasts
color invulColor = #FF0000;
color spaceshipInitialColor = #3EA9EA;
public void setup() {
  bob = new Spaceship();
  size(400, 400);
  for (int i = 0; i < bill.length; i++) {
    bill[i] = new Stars();
  }
  joe = new ArrayList <Asteroids>();
  for (int i = 0; i <= 10; i++) {
    joe.add(i, new Asteroids());
  }
}
public void draw() {
  background(0);
  bob.show();
  bob.move();
  bob.collisionDetector();
  dealWithInvulnerability();
  for (int i = 0; i < bill.length; i++) {
    bill[i].show();
  }
  for (int i = 0; i < joe.size(); i++) {
   joe.get(i).show();
   joe.get(i).move();
  }
  if (forward == true) {
    bob.accelerate(0.05);
    bob.rocketCreater();
  }
  if (back == true) {
    bob.accelerate(-0.05);
  }
  if (turnl == true) {
    bob.turn(-10);
  }
  if (turnr == true) {
    bob.turn(10);
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
    invulnerability = true;
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
public void dealWithInvulnerability() {
  if (invulnerability == true) {
    bob.setColor(invulColor);
    timeInvul++;
  }
  if (timeInvul >= 30) {
    invulnerability = false;
  }
  if (invulnerability == false) {
    bob.setColor(spaceshipInitialColor);
    timeInvul = 0;
  }
}