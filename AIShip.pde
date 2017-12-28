class SpaceAI {
  //similar to floater but a lot is different so I opted to not extend.
  private int corners;  
  private int[] xCorners;   
  private int[] yCorners;   
  private int myColor;   
  private int health;
  private int ammo;
  private int timeShoot;
  private int timeRegen;
  private int myPointDirection;
  private double myCenterX, myCenterY; 
  private double myDirectionX, myDirectionY; 
  private boolean lockOn;
  private boolean regenMode;
  public void setX(int x) { myCenterX = x; }
  public int getX() { return (int)myCenterX; }
  public void setY(int y) { myCenterY = y; }
  public int getY() { return (int)myCenterY; }
  public void setDirectionX(double x) { myDirectionX = x; }
  public double getDirectionX() { return myDirectionX; }
  public void setDirectionY(double y) { myDirectionY = y; }
  public double getDirectionY() { return myDirectionY; }
  public void setPointDirection(int degrees) { myPointDirection = degrees; }
  public int getPointDirection() { return myPointDirection; }
  public void setColor(color value) { myColor = value; }
  public int getHealth() { return health; }
  public void setHealth(int healthSet) { health = healthSet; }
  public int getAmmo() { return ammo; }
  public void setAmmo(int ammoAmount) { ammo = ammoAmount; }
  public SpaceAI() {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];    
    for (int i = 0; i < 12; i++) {
      xCorners[i] = (int)(xCornListSpace[i]*2.0);
      yCorners[i] = (int)(yCornListSpace[i]*2.0);
    }
    myColor = #75ED07;
    health = 24;
    ammo = 10;
    myCenterX = 600;
    myCenterY = 250;
    myPointDirection = 180;
    myDirectionX = 0;
    myDirectionY = 0;
    timeRegen = 0;
    timeShoot = 0;
    lockOn = false;
    regenMode = false;
  }
  public void move() {
    if (canShoot == false) {
      //entering screen
      myCenterX-=2;
      if (myCenterX <= 450) {
        myCenterX+=2;
      }
    }
    if (canShoot == true) {
      myCenterX+=myDirectionX;
      myCenterY+=myDirectionY;
      if(myCenterX > 500) { myCenterX = 0; }  
      else if (myCenterX<0) { myCenterX = 500; }
      if(myCenterY > 500) { myCenterY = 0; }
      else if (myCenterY<0) { myCenterY = 500; }
      turn();
      accelerate();
      shoot();
    }
  }
  public void show() {
    //thanks mr. simon
    fill(myColor);   
    stroke(myColor);    
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void turn() {
    //turns to keep in line with bob
    int rot = 0;
    if (Math.abs(myPointDirection) >= 360) {
      myPointDirection = 0; //resets angle to 0 if goes to 360
    } 
    int angle = (int)(Math.toDegrees(Math.atan2(myCenterY-bob.getY(),myCenterX-bob.getX())-PI));
    //math :(
    if (angle <= myPointDirection+5 && angle >= myPointDirection-5) {
      rot = 0; 
    }
    else if (myPointDirection < angle) {
      rot = 5; 
      lockOn = false;
    }
    else if (myPointDirection > angle) {
      rot=-5;
      lockOn = false;
    }
    if (angle <= myPointDirection+13 && angle >= myPointDirection-13) {
      //if the angle of ship is +- 13 degrees away, is locked on and rdy to shoot you
      lockOn = true;
    }
    myPointDirection+=rot;
  }
  public void accelerate() {
    float dista = dist((float)bob.getX(),(float)bob.getY(),(float)myCenterX, (float)myCenterY);
    if (dista > 140) {
      //inspired by chemotaxis. instant velocity change; easier to code in.
      myDirectionX = Math.cos(Math.toRadians(myPointDirection))+(bob.getX()-myCenterX)/80;
      myDirectionY = Math.sin(Math.toRadians(myPointDirection))+(bob.getY()-myCenterY)/80;
    }
    else if (dista <= 140) { 
      //if you're at 140 or less, depending on sign of directionX and Y it will go to 0.
      if (myDirectionX > 0) {
        myDirectionX-=0.05;
        if (myDirectionX < 0) {
          myDirectionX = 0;
        }
      }
      else if (myDirectionX < 0) {
        myDirectionX+=0.05;
        if (myDirectionX > 0) {
          myDirectionX = 0;
        }
      }
      if (myDirectionY > 0) {
        myDirectionY-=0.05;
        if (myDirectionY < 0) {
          myDirectionY = 0;
        }
      }
      else if (myDirectionY < 0) {
        myDirectionY+=0.05;
        if (myDirectionY > 0) {
          myDirectionY = 0;
        }
      }
    }
  }
  public void shoot() {
    if (lockOn == true && regenMode == false) {
      //if its locked on and forced regen is off
      timeRegen = 0;
      timeShoot++;
      if (ammo <= 0) {
        //if ammo becomes 0, forced regen is turned on
        regenMode = true;
      }
      else if (timeShoot%15 == 0 && ammo > 0 && canShoot == true && regenMode == false) {
        //every 15 ticks it shoots.
        for (int i = 0; i < bio.size(); i++) {
          AIBullets.add(new Bullets(bio.get(i)));
        }
        ammo--;
      }
    }
    else if (lockOn == true && regenMode == true) {
      //forced regen, every 7 ticks it regens
      timeShoot = 0;
      timeRegen++;
      if (timeRegen%7 == 0 && ammo < 10) {
        ammo++;
      }
      if (ammo == 10) {
        //resets regen timer and turns off forced regen
        regenMode = false;
        timeRegen = 0;
      }
    }
    else if (lockOn == false) {
      //if false, normal 7 tick regen
      regenMode = false;
      timeShoot = 0;
      timeRegen++;
      if (timeRegen%7 == 0 && ammo < 10) {
        ammo++;
      }
    }
  }
}