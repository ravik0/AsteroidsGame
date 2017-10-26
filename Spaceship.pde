double xCornListSpace[] = {-3,-2,-1,0,1,3,6,3,1,0,-1,-2};
double yCornListSpace[] = {0,1,3,4,3,2,0,-2,-3,-4,-3,-1};
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
  public void setColor(color value) { myColor = value; }
  public Spaceship() {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];    
    for (int i = 0; i < 12; i++) {
      xCorners[i] = (int)(xCornListSpace[i]*1.6);
      yCorners[i] = (int)(yCornListSpace[i]*1.6);
    }
    myColor = #3EA9EA;
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void rocketCreater() {
    translate((float)myCenterX,(float)myCenterY);
    rotate((float)myPointDirection*PI/180);
    stroke(#3EA9EA);
    line(-10,2,-5,2);
    line(-10,0,-5,0);
    line(-10,-2,-5,-2);
    rotate(-1*(float)myPointDirection*PI/180);
  }
  public void shoot() {
    bull.add(new Bullets(bob));
  }
  public void move() {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    if(myCenterX > 500) { myCenterX = 0; }  
    else if (myCenterX<0) { myCenterX = 500; }
    if(myCenterY > 500) { myCenterY = 0; }
    else if (myCenterY < 0) { myCenterY = 500; }
  }
}