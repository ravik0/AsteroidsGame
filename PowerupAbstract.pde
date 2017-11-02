abstract class Powerup {
  protected int myX, myY;
  protected color myColor;
  public int getX() { return myX; }
  public int getY() { return myY; }
  public void setX(int x) { myX = x; }
  public void setY(int y) { myY = y; }
  public void show() {
    fill(myColor);
    rect(myX,myY,30,30);
    //this will be super.move(), put own design ontop in extended class
  }
  abstract public void effect();
}