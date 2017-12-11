/*
all code will be inside functions at the bottom 
this is to allow for better transitions between the states of the program
*/
//title screen variables
Stars[] starsTitle = new Stars[30];
ArrayList <Asteroids> asteroidsTitle;
//rule screen variables
Powerup powerLife;
Powerup powerAmmo;
Powerup powerTeleport;
//game variables
Spaceship bob;
SpaceAI bio;
ArrayList <Asteroids> joe; 
ArrayList <Bullets> bull; 
ArrayList <Spaceship> lives; //lives mechanic.
ArrayList <Powerup> powerups; //powerup spawn mechanic.
Stars[] bill = new Stars[(int)(Math.random()*40)+12];
boolean forward, back, turnl, turnr = false; //movement variables
boolean invulnerability = false; //when teleporting, make sure doesn't get killed
boolean shooter = false; //is bob shooting or not
boolean shooterAdd = true; //ammo regen
boolean powerCollected = false; //have you gotten a powerup this round?
boolean canShoot = false; //can you shoot rn?
boolean asteroidMove = false; //can asteroids move?
boolean showTime = true; //countdown
boolean splitAllowed = false; //when can we split asteroids
int timeRound = 0; //time between rounds
int timeInvul = 0; //how long invulnerability lasts
int timeRegen = 0; //variable to let me control how fast ammo regens
int asteroidAmount = 11; //how many asteroids
int bulletAmount = 12; //ammo
int timeShoot = 0; //how often you can shoot
int health = 7; //health
int score = 0; //score, + if you destroy asteroid, - if you get hit
int resetAmount = 3; //how many times can you teleport
int gameState = 0; //what section of the game are we on? title, gameover, etc
int round = 1; //what round of the game are on?
int maxAmmo = 12; //necessary for ammo powerup to change.
int powerupLivesAmount = 0; //how many lives have been collected
color invulColor = #FF0000; //color when invulnerable
color spaceshipInitialColor = #3EA9EA; //color when doing usual stuff
public void setup() {
  //title setup
  for (int i = 0; i < starsTitle.length; i++) {
    starsTitle[i] = new Stars();
  }
  asteroidsTitle = new ArrayList <Asteroids>();
  for (int i = 0; i < 10; i++) {
    asteroidsTitle.add(i, new Asteroids());
  }
  //rule setup, so it shows what they look like in the rules. just uses any old asteroid doesnt matter
  powerLife = new PowerupLives(asteroidsTitle.get(0));
  powerAmmo = new PowerupMoreAmmo(asteroidsTitle.get(1));
  powerTeleport = new PowerupTeleport(asteroidsTitle.get(0));
  //game setup 
  bio = new SpaceAI(); //AI, nonfunctional as of now
  bob = new Spaceship(1.6);
  size(500,600);
  for (int i = 0; i < bill.length; i++) {
    bill[i] = new Stars();
  }
  joe = new ArrayList <Asteroids>();
  for (int i = 0; i < 10; i++) {
    joe.add(i, new Asteroids());
  }
  bull = new ArrayList <Bullets>();
  lives = new ArrayList <Spaceship>();
  lives.add(0, new Spaceship(1.6)); //initial extra lives.
  powerups = new ArrayList <Powerup>();
}
public void draw() {
  //if we are in a certain gamestate, go to that function. the functions are all at the bottom
  if (gameState == 0) {
    titleScreen();
  }
  if (gameState == 1) {
    ruleScreen();
  }
  if (gameState == 2) {
    asteroidGame();
  }
  if (gameState == 3) {
    gameOver();
  }
}
public void keyPressed() {
  //if certain key is pressed, the movement keys become active
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
  else if (key == 'h' && resetAmount > 0) {
    //if you have teleports remaining and press h, you teleport to new place and become invulnerable for some time.
    bob.setX(((int)(Math.random()*400)));
    bob.setY(((int)(Math.random()*400)));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setPointDirection((int)Math.random()*361);
    invulnerability = true;
    resetAmount-=1;
  }
  else if (key == ' ') {
    //can shoot, stop regen ammo
    shooter = true;
    shooterAdd = false;
  }
}
public void keyReleased() {
  //key released, movement keys turn off
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
    //stop shooting, start regen ammo
    shooter = false;
    shooterAdd = true;
  }
}
public void mousePressed() {
  if (gameState == 0) {
    if (mouseX >= 180 && mouseX <= 330 && mouseY >= 200 && mouseY <= 250) {
      gameState = 2; 
    }
    else if (mouseX >= 200 && mouseX <= 310 && mouseY >= 300 && mouseY <= 340) {
      gameState = 1;
    }
  }
  if (gameState == 1) {
    if (mouseX >= 210 && mouseX <= 290 && mouseY >= 540 && mouseY <= 580) {
      gameState = 2;
    }
  }
  if (gameState == 3) {
    if (mouseX >= 50 && mouseX <= 150 && mouseY >= 530 && mouseY <= 570) {
      gameState = 0;
      timeInvul = 0; 
      timeRegen = 0; 
      asteroidAmount = 10; 
      bulletAmount = 12; 
      timeShoot = 0; 
      health = 7; 
      score = 0; 
      resetAmount = 3; 
      round = 1; 
      maxAmmo = 12;
      joe.clear();
      for (int i = 0; i < 10; i++) {
        joe.add(i, new Asteroids());
      }
      lives.add(0, new Spaceship(1.6));
      powerups.clear();
      bull.clear();
      bob.setX(250);
      bob.setY(250);
      bob.setPointDirection(0);
      bob.setDirectionX(0);
      bob.setDirectionY(0);
      powerCollected = false;
      canShoot = false;
      asteroidMove = false;
    }
    if (mouseX >= 350 && mouseX <= 450 && mouseY >= 530 && mouseY <= 570) {
      gameState = 2;
      timeInvul = 0; 
      timeRegen = 0; 
      asteroidAmount = 10; 
      bulletAmount = 12; 
      timeShoot = 0; 
      health = 7; 
      score = 0; 
      resetAmount = 3; 
      round = 1; 
      maxAmmo = 12;
      joe.clear();
      for (int i = 0; i < 10; i++) {
        joe.add(i, new Asteroids());
      }
      lives.add(0, new Spaceship(1.6));
      powerups.clear();
      bull.clear();
      bob.setX(250);
      bob.setY(250);
      bob.setPointDirection(0);
      bob.setDirectionX(0);
      bob.setDirectionY(0);
      powerCollected = false;
      canShoot = false;
      asteroidMove = false;
    }
  }
}
//game functionality functions
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
public void beginRound() {
  //deals with transitions
  if (canShoot == false) {
    timeRound++;
    showTime = true;
  }
  if (timeRound >= 180) {
    canShoot = true;
    asteroidMove = true;
  }
  if (canShoot == true) {
    timeRound = 0;
    showTime = false;
  }
}
public void detectionFunction() {
  for(int i = 0; i < joe.size(); i++) {
    if(dist(bob.getX(),bob.getY(),joe.get(i).getX(),joe.get(i).getY()) <= 20) {
      if(canShoot == true) {
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
  }
  for(int i = 0; i < bull.size(); i++) {
    for(int j = 0; j < joe.size(); j++) {
      if(dist(joe.get(j).getX(),joe.get(j).getY(),bull.get(i).getX(),bull.get(i).getY()) <= 12) {
        double probability = Math.random();
        bull.remove(i);
        if (powerups.size() < 3 && probability < 0.10 && powerCollected == false) {
          double powerupProb = Math.random();
          if (powerupProb < 0.33 && lives.size() < 3 && powerupLivesAmount < 2) {
            powerups.add(new PowerupLives(joe.get(j)));
            powerCollected = true;
            powerupLivesAmount++;
          }
          if (powerupProb >= 0.33 && powerupProb < 0.66 && maxAmmo < 42) {
            powerups.add(new PowerupMoreAmmo(joe.get(j)));
            powerCollected = true;
          }
          if (powerupProb >= 0.66 && resetAmount < 5) {
            powerups.add(new PowerupTeleport(joe.get(j)));
            powerCollected = true;
          }  
        }
        if (joe.get(j).getSplit() == true && splitAllowed == true) {
          joe.add(new Asteroids(joe.get(j)));
          joe.add(new Asteroids(joe.get(j)));
          joe.remove(j);
        }
        else {
          joe.remove(j);
        }
        score++;
        break;
      }
    }
  }
  if (joe.size() == 0) {
    powerups.clear();
    bull.clear();
    powerCollected = false;
    for (int i = 0; i <= asteroidAmount; i++) {
      joe.add(i, new Asteroids());
    }
    asteroidAmount++;
    round++;
    asteroidMove = false;
    canShoot = false;
    if (round >= 3) {
      splitAllowed = true;
    }
  }
  if (health <= 0) {
    if (lives.size() > 0) {
      health = 7;
      lives.remove(lives.size()-1);
    }
    else if (lives.size() == 0) {
      gameState = 3;
    }
  }
  for (int i = 0; i < bull.size(); i++) {
    for (int j = 0; j < powerups.size(); j++) {
      if(dist(powerups.get(j).getX(),powerups.get(j).getY(),bull.get(i).getX(),bull.get(i).getY()) <= 12) {
        powerups.get(j).effect();
        powerups.remove(j);
        break;
      }
    }
  }
  
  //1st function: asteroid & player
  //2nd function: bullet & asteroid & powerup spawning & splitting asteroids
  //3rd function: respawn asteroids
  //4th function: game over
  //5th function: bullet & powerup
}

public void ammoRegen() {
  if (shooterAdd == true) {
    timeRegen++;
    if (bulletAmount < maxAmmo & timeRegen%8 == 0) {
      bulletAmount++;
    } 
  }
  if (shooterAdd == false) {
    timeRegen = 0;
  }
}
//gamestate functions
public void titleScreen() {
  //gamestate 0
  background(0);
  for (int i = 0; i < starsTitle.length; i++) {
    starsTitle[i].show();
  }
  fill(0);
  noStroke();
  rect(190,20,130,50); //so stars dont go behind the title
  for (int i = 0; i < asteroidsTitle.size(); i++) {
    asteroidsTitle.get(i).show();
    asteroidsTitle.get(i).move();
  }
  textSize(20);
  fill(255,0,0);
  text("ASTEROIDS", 200,50);
  noStroke();
  fill(#3E6DEA);
  rect(180,200,150,50);
  fill(255);
  textSize(18);
  text("Play the Game", 190, 233);
  fill(#348911);
  rect(200,300,110,40);
  fill(255);
  textSize(13);
  text("Rules & Controls", 205, 325);
  //change colors later, maybe put like a throttle to give feeling of ship interior? could do for real game too
  stroke(#E6F289);
  fill(#E6F289);
  rect(0,500,500,100);
}
public void ruleScreen() {
  //gamestate 1
  background(0);
  for (int i = 0; i < starsTitle.length; i++) {
    starsTitle[i].show();
  }
  for (int i = 0; i < asteroidsTitle.size(); i++) {
    asteroidsTitle.get(i).show();
    asteroidsTitle.get(i).move();
  }
  noStroke();
  fill(255);
  rect(40,90,420,420);
  textSize(15);
  fill(#FF0011);
  textAlign(250,250);
  text("CONTROLS",200,115);
  text("RULES", 200, 210);
  fill(0);
  textSize(12);
  text("To move, use WASD. Shoot with the spacebar", 100, 140);
  text("W forward, A left, S backwards, and D right", 100, 160);
  text("Press H to teleport somewhere else and reset velocity", 100, 180);
  text("The game starts with 10 asteroids", 100, 230);
  text("As you progress, more and more asteroids will spawn", 100, 250);
  text("You have 7 health to start, get hit 7 times and you're dead", 100, 270);
  text("Your score will increase as you destroy asteroids",100,290);
  text("It will also decrease as you get hit",100,310);
  text("You can also only teleport 3 times, so make good use of it", 100, 330);
  text("You are invulnerable for a short time after teleportation.", 100, 350);
  text("Powerups have a chance to pop out of asteroids", 100, 370);
  powerLife.setX(100);
  powerLife.setY(380);
  powerLife.showRule(100,380);
  fill(0);
  text("This is your life powerup, +1 extra life, max 2 extra", 120, 390);
  powerAmmo.setX(100);
  powerAmmo.setY(400);
  powerAmmo.showRule(100,400);
  fill(0);
  text("This is your ammo powerup, +6 max ammo, max 42", 120, 410);
  powerTeleport.setX(100);
  powerTeleport.setY(420);
  powerTeleport.showRule(100,420);
  fill(0);
  text("This is your teleport powerup, +1 teleport, max 5", 120, 430);
  text("At the end of every round, all powerups not collected are lost", 100, 450);
  text("You can only collect (max) one powerup per round.", 100, 470);
  text("Asteroids split into two starting round 3.", 100, 490);
  fill(#DB5069);
  rect(210,540,80,40);
  fill(#1EDFE8);
  textSize(20);
  text("Play", 230,570);
}
public void asteroidGame() {
  //gamestate 2
  background(0);
  //creation of objects
  bob.show();
  /*bio.show();
  bio.move();*/
  bob.move();
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
  for (int i = 0; i < powerups.size(); i++) {
    powerups.get(i).show();
  }
  for (int i = 0; i < joe.size(); i++) {
    joe.get(i).show();
    if (asteroidMove == true) {
      joe.get(i).move();
    }
  }
  //function calling
  infoArea();
  detectionFunction();
  dealWithInvulnerability();
  ammoRegen();
  beginRound();
  //defining movement
  if (forward == true) {
    bob.accelerate(0.037);
    bob.rocketCreater();
  }
  if (back == true) {
    bob.accelerate(-0.037);
  }
  if (turnl == true) {
    bob.turn(-5);
  }
  if (turnr == true) {
    bob.turn(5);
  }
  if (shooter == true) {
    timeShoot++;
    if (bulletAmount > 0 && timeShoot%7 == 0 && canShoot == true) {
      bob.shoot();
      bulletAmount-=1;
    }
  }
}
public void gameOver() {
  //gamestate 3
  int roundSurvived = round-1;
  background(0);
  for (int i = 0; i < starsTitle.length; i++) {
    starsTitle[i].show();
  }
  for (int i = 0; i < asteroidsTitle.size(); i++) {
    asteroidsTitle.get(i).show();
    asteroidsTitle.get(i).move();
  }
  stroke(#E6F289);
  fill(#E6F289);
  rect(0,500,500,100);
  fill(#9908C6);
  rect(50,530,100,40);
  fill(#B94A09);
  rect(350,530,100,40);
  fill(255);
  textSize(13);
  textAlign(LEFT);
  text("Return to Title",55,555);
  text("Play Again",370,555);
  fill(255);
  rect(150,150,200,200);
  fill(0);
  textSize(20);
  text("YOU DIED", 200,180);
  textSize(11);
  if (round == 1) {
    text("-You survived 0 rounds",155,220);
  }
  if (round == 2) {
    text("-You survived 1 round",155,220);
  }
  if (round > 2) {
    text("-You survived " + roundSurvived + " rounds",155,220);
  }
  text("-Your final score was " + score + " points", 155, 240);
  if (joe.size() == 1) {
    text("-There was 1 asteroid remaining",155,260);
  }
  if (joe.size() > 1) {
    text("-There were " + joe.size() + " asteroids remaining",155,260);
  }
  if (score <= 80) {
    text("Better luck next time!", 190, 300);
  }
  if (score > 80 && score <= 200) {
    text("You did great!", 210,300);
  }
  if (score > 200) {
    text("Amazing work!", 210, 300);
  }
}
public void infoArea() {
  //own function cause looks cleaner on the titlescreen function
  textSize(12);
  fill(#D1B685);
  stroke(#D1B685);
  rect(0,500,500,100);
  textAlign(CENTER);
  fill(#0423DE);
  text("Ammo", 40, 520);
  fill(#DE04D3);
  text(bulletAmount,40,530);
  fill(255,0,0);
  rect(36,570,5,-36*bulletAmount/maxAmmo);
  fill(#0423DE);
  text("Health", 100, 520);
  fill(#DE04D3);
  text(health,100,530);
  fill(255,0,0);
  rect(96,555,5,-3*health);
  fill(#0423DE);
  text("Score",160,520);
  text("Round Number", 160, 550);
  fill(#DE04D3);
  text(score,160,530);
  text(round,160,560);
  fill(#0423DE);
  text("Lives Remaining", 280, 520);
  for(int i = 0; i < lives.size(); i++) {
    lives.get(i).setX(280);
    lives.get(i).setY(i*21+530);
    lives.get(i).show();
  }
  if (lives.size() == 0) {
    text("None",280,540);
  }
  fill(#0423DE);
  text("Teleports Remaining",400,520);
  fill(#DE04D3);
  text(resetAmount,400,535);
  if (showTime == true) {
    textSize(30);
    fill(255);
    text((int)((180-timeRound)/60+1),250,250);
  }
}