int[] xCornLBull = {-4,0,4,0};
int[] yCornLBull = {0,2,0,-2};
class Bullets extends Floater {
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
  public Bullets(Spaceship shipper) {
    myCenterX = shipper.getX();
    myCenterY = shipper.getY();
    myPointDirection = shipper.getPointDirection();
    myDirectionX = 5*Math.cos(myPointDirection*(Math.PI/180)) + shipper.getDirectionX();
    myDirectionY = 5*Math.sin(myPointDirection*(Math.PI/180)) + shipper.getDirectionY();  
    myColor = #28EA94;
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++) {
      xCorners[i] = xCornLBull[i];
      yCorners[i] = yCornLBull[i];
    }
  }
  public Bullets(SpaceAI shipper) {
    //necessary because AI does not extend off of floater.
    myCenterX = shipper.getX();
    myCenterY = shipper.getY();
    myPointDirection = shipper.getPointDirection();
    myDirectionX = 5*Math.cos(myPointDirection*(Math.PI/180)) + shipper.getDirectionX();
    myDirectionY = 5*Math.sin(myPointDirection*(Math.PI/180)) + shipper.getDirectionY();  
    myColor = #B6B721;
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++) {
      xCorners[i] = xCornLBull[i];
      yCorners[i] = yCornLBull[i];
    }
  }
  public Bullets() {
    //constructor for the powerup bullet.
    myCenterX = 0;
    myCenterY = 0;
    myPointDirection = 0;
    myDirectionX = 0;
    myDirectionY = 0;  
    myColor = #28EA94;
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++) {
      xCorners[i] = xCornLBull[i];
      yCorners[i] = yCornLBull[i];
    }
  }
  public void move() {
    myCenterX+=myDirectionX;
    myCenterY+=myDirectionY;
  
  }
}