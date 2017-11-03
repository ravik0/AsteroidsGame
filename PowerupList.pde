class PowerupLives extends Powerup {
  private Spaceship idiot;
  private int stevenX;
  private int stevenY;
  public PowerupLives(Asteroids steven) {
    stevenX = steven.getX();
    stevenY = steven.getY();
    myX = stevenX;
    myY = stevenY;
    myColor = #EA1F37;
    idiot = new Spaceship(1);
  }
  public void show() {
    super.show();
    idiot.setX(stevenX+3);
    idiot.setY(stevenY+5);
    idiot.show();
  }
  public void effect() {
    lives.add(new Spaceship(1.6));
  }
}
class PowerupMoreAmmo extends Powerup {
  public PowerupMoreAmmo() {
  }
  public void effect() {
  }
}
class PowerupTeleport extends Powerup {
  public void effect() {
  }
}
//maybe different ammo later