double xCornerLAst[] = {-7,-5,-3,0,3,5,7,5,3,0,-3,-5};
double yCornerLAst[] = {0,2,5,7,5,2,0,-2,-5,-7,-5,-2};
class Asteroids extends Floater {
  private int rotationSpeed;
  private boolean split;
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
  public boolean getSplit() { return split; }
  public Asteroids() {
    split = true;
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < 12; i++) {
      xCorners[i] = (int)(1.5*xCornerLAst[i]);
      yCorners[i] = (int)(1.5*yCornerLAst[i]);
    }
    myColor = #CE7A0A;
    myCenterX = Math.random()*500+1;
    myCenterY = Math.random()*500+1;
    myDirectionX = Math.random()*1.3;
    myDirectionY = Math.random()*1.3;
    myPointDirection = 90;
    rotationSpeed = (int)(Math.random()*5+1);
  }
  public Asteroids(Asteroids joe) {
    split = false;
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < 12; i++) {
      xCorners[i] = (int)(0.75*xCornerLAst[i]);
      yCorners[i] = (int)(0.75*yCornerLAst[i]);
    }
    myColor = #CE7A0A;
    myCenterX = joe.getX();
    myCenterY = joe.getY();
    myDirectionX = Math.random()*1.3;
    myDirectionY = Math.random()*1.3;
    myPointDirection = 90;
    rotationSpeed = (int)(Math.random()*5+1);
  }
  public void move() {
    turn(rotationSpeed);
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    if(myCenterX > 500) { myCenterX = 0; }  
    else if (myCenterX<0) { myCenterX = 500; }
    if(myCenterY > 500) { myCenterY = 0; }
    else if (myCenterY < 0) { myCenterY = 500; }
  }
}