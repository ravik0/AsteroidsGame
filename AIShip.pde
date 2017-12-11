/*
Move: Will want to keep a distance of about 50-60 with bob, no asteroids will spawn in the level. Accelerates/decel to keep up with bob. Move forward/back/left/right. Attempt to suicide bomb at 5-10hp? Randomize movement, but keep within 50-60.
Accelerate: Accelerate will be simple add. Nothing fancy most likely.
Shoot: Build the shoot function into the class itself.
Make him come out of the side of the screen. 
INCOMPLETE
*/
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
  private double myCenterX, myCenterY; 
  private double myDirectionX, myDirectionY; 
  private int myPointDirection;
  private boolean suicideRun;
  private boolean lockOn;
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
    health = 50;
    ammo = 10;
    myCenterX = 600;
    myCenterY = 250;
    myPointDirection = 180;
    myDirectionX = 0;
    myDirectionY = 0;
    timeRegen = 0;
    timeShoot = 0;
    suicideRun = false;
    lockOn = false;
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
      else if (myCenterY < 0) { myCenterY = 500; }
      turn();
    }
  }
  public void show() {
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
    if (angle <= myPointDirection+5 && angle >= myPointDirection-5) {
      rot = 0; 
      lockOn = true;
    }
    else if (myPointDirection < angle) {
      rot = 5; 
      lockOn = false;
    }
    else if (myPointDirection > angle) {
      rot=-5;
      lockOn = false;
    }
    myPointDirection+=rot;
  }
  public void accelerate() {
    float dista = dist((float)bob.getX(),(float)myCenterX,(float)bob.getY(),(float)myCenterY);
    //accelerates to keep distance between bob and self
  }
  public void shoot() {
    //control shooting, when and where
  }
  public void modulate() {
    //control health & ammo
  }
}