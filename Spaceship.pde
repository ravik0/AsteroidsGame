int xCornList[] = {-3,-2,-1,0,1,3,6,3,1,0,-1,-2};
int yCornList[] = {0,1,3,4,3,2,0,-2,-3,-4,-3,-1};
class Spaceship extends Floater  {  
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
  Spaceship() {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < 12; i++) {
      xCorners[i] = xCornList[i];
      yCorners[i] = yCornList[i];
    }
    myColor = 0;
    myCenterX = 200;
    myCenterY = 200;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = -90;
  }
}