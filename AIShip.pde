/*
Move: Will want to keep a distance of about 50-60 with bob, no asteroids will spawn in the level. Accelerates/decel to keep up with bob. Move forward/back/left/right. Attempt to suicide bomb at 5-10hp? Randomize movement, but keep within 50-60.
Turn: Turn based on x & y position vectors. Use atan2() for angle, have separate variable for the radian argument.. May need to deal with the range of arctan.
Accelerate: Accelerate will be simple add. Nothing fancy most likely.
Shoot: Build the shoot function into the class itself.
Make him come out of the side of the screen. 
*/
class SpaceAI {
  private int corners;  
  private int[] xCorners;   
  private int[] yCorners;   
  private int myColor;   
  private int health;
  private int ammo;
  private double myCenterX, myCenterY; 
  private double myDirectionX, myDirectionY; 
  private double myPointDirection;
  public void setX(int x) { myCenterX = x; }
  public int getX() { return (int)myCenterX; }
  public void setY(int y) { myCenterY = y; }
  public int getY() { return (int)myCenterY; }
  public void setDirectionX(double x) { myDirectionX = x; }
  public double getDirectionX() { return myDirectionX; }
  public void setDirectionY(double y) { myDirectionY = y; }
  public double getDirectionY() { return myDirectionY; }
  public void setPointDirection(int degrees) { myPointDirection = degrees; }
  public double getPointDirection() { return myPointDirection; }
  public void setColor(color value) { myColor = value; }
  public int getHealth() { return health; }
  public void setHealth(int healthSet) { health = healthSet; }
  public void setAmmo(int ammoAmount) { ammo = ammoAmount; }
  public SpaceAI(Spaceship heartOfGold) {
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
}