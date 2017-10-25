class Stars {
  private int myX, myY;
  public Stars() {
    myX = (int)(Math.random()*400)+1;
    myY = (int)(Math.random()*400)+1;
  }
  public void show() {
    fill(255);
    stroke(255);
    ellipse(myX,myY,3,3);
  }
}