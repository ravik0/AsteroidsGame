abstract class Powerup {
  //decided to make own abstract class, doesnt act like a floater
  protected int myX, myY;
  protected color myColor;
  public int getX() { return myX; }
  public int getY() { return myY; }
  public void setX(int x) { myX = x; }
  public void setY(int y) { myY = y; }
  public void show() {
    noStroke();
    fill(myColor);
    rect(myX,myY,11,11);
    //this will be super.move(), put own design ontop in extended class
  }
  abstract public void showRule(int x, int y);
  abstract public void effect();
}