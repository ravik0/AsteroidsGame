Spaceship bob;
ArrayList <Asteroids> joe;
ArrayList <Bullets> bull;
Stars[] bill = new Stars[(int)(Math.random()*40)+12];
boolean forward, back, turnl, turnr = false; //movement variables
boolean invulnerability = false; //when teleporting, make sure doesn't get killed
boolean shooter = false; //is bob shooting or not
boolean shooterAdd = true; //ammo regen
int timeInvul = 0; //how long invulnerability lasts
int timeRegen = 0; //variable to let me control how fast ammo regens
int asteroidAmount = 10; //how many asteroids
int bulletAmount = 12; //ammo
int timeShoot = 0; //how often you can shoot
int health = 7; //health
int score = 0; //score, + if you destroy asteroid, - if you get hit
color invulColor = #FF0000; //color when invulnerable
color spaceshipInitialColor = #3EA9EA; //color when doing usual stuff
public void setup() {
  bob = new Spaceship();
  size(500,600);
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
  ammoRegen();
  infoArea();
  for(int i = 0; i < bull.size(); i++) {
    bull.get(i).show();
    bull.get(i).move();
    if(bull.get(i).getX() > width || bull.get(i).getX() < 0 || bull.get(i).getY() > 500 || bull.get(i).getY() < 0) {
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
    if (bulletAmount > 0 && timeShoot%7 == 0) {
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
    shooterAdd = false;
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
    shooterAdd = true;
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
      if(invulnerability == true) {
        joe.remove(i);
      }
      if (invulnerability == false) {
        joe.remove(i);
        health--;
        score--;
      }
    }
  }
  for(int i = 0; i < bull.size(); i++) {
    for(int j = 0; j < joe.size(); j++) {
      if(dist(joe.get(j).getX(),joe.get(j).getY(),bull.get(i).getX(),bull.get(i).getY()) <= 8) {
        bull.remove(i);
        joe.remove(j);
        score++;
        break;
      }
    }
  }
  if (joe.size() == 0) {
    for (int i = 0; i <= asteroidAmount; i++) {
      joe.add(i, new Asteroids());
    }
    asteroidAmount++;
  }
  //1st function: asteroid & player
  //2nd function: bullet & asteroid
  //3rd function: respawn asteroids
}

public void ammoRegen() {
  if (shooterAdd == true) {
    timeRegen++;
    if (bulletAmount < 12 & timeRegen%8 == 0) {
      bulletAmount++;
    } 
  }
  if (shooterAdd == false) {
    timeRegen = 0;
  }
}

public void infoArea() {
  fill(#D1B685);
  stroke(#D1B685);
  rect(0,500,500,100);
  textAlign(CENTER);
  fill(#0423DE);
  text("Ammo", 40, 520);
  fill(#DE04D3);
  text(bulletAmount,40,530);
  fill(255,0,0);
  rect(36,570,5,-3*bulletAmount);
  fill(#0423DE);
  text("Health", 100, 520);
  fill(#DE04D3);
  text(health,100,530);
  fill(255,0,0);
  rect(96,555,5,-3*health);
}