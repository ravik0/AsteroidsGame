double xCornerL[] = {-7,-5,-3,0,3,5,7,5,3,0,-3,-5};
double yCornerL[] = {0,2,5,7,5,2,0,-2,-5,-7,-5,-2};
class Asteroids extends Floater {
  private int rotationSpeed;
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
  
  public Asteroids() {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < 12; i++) {
      xCorners[i] = (int)(1.8*xCornerL[i]);
      yCorners[i] = (int)(1.8*yCornerL[i]);
    }
    myColor = #CE7A0A;
    myCenterX = Math.random()*400+1;
    myCenterY = Math.random()*400+1;
    myDirectionX = Math.random()*1.3;
    myDirectionY = Math.random()*1.3;
    myPointDirection = 90;
    rotationSpeed = (int)(Math.random()*5+1);
  }
  public void move() {
    turn(rotationSpeed);
    super.move();
  }
}