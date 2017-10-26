Spaceship bob;
ArrayList <Asteroids> joe;
ArrayList <Bullets> bull;
Stars[] bill = new Stars[(int)(Math.random()*20)+12];
boolean forward, back, turnl, turnr = false;
boolean invulnerability = false; //when teleporting, make sure doesn't get killed
boolean shooter = false;
int timeInvul = 0; //how long invulnerability lasts
int asteroidAmount = 10;
int bulletAmount = 10;
int timeShoot = 0;
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
  bull = new ArrayList <Bullets>();
}
public void draw() {
  background(0);
  bob.show();
  bob.move();
  collisionDetection();
  dealWithInvulnerability();
  for(int i = 0; i < bull.size(); i++) {
    bull.get(i).show();
    bull.get(i).move();
    if(bull.get(i).getX() > width || bull.get(i).getX() < 0 || bull.get(i).getY() > height || bull.get(i).getY() < 0) {
      bull.remove(i);
    }
  }
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
  if (shooter == true) {
    timeShoot++;
    if (bulletAmount > 0 && timeShoot%5 == 0) {
      bob.shoot();
      bulletAmount-=1;
    }
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
  else if (key == ' ') {
    shooter = true;
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
  else if (key == ' ') {
    shooter = false;
    bulletAmount+=10;
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
  //if you press h, you'll be invulnerable for a bit.
}
public void collisionDetection() {
  for(int i = 0; i < joe.size(); i++) {
    if(dist(bob.getX(),bob.getY(),joe.get(i).getX(),joe.get(i).getY()) <= 20) {
      joe.remove(i);
    }
  }
  if (joe.size() == 0) {
    for (int i = 0; i <= asteroidAmount; i++) {
      joe.add(i, new Asteroids());
    }
    asteroidAmount++;
  }
  //this function is built for collision btwn asteroid & player
  //also built so whenever all asteroids gone, new ones spawn.
}