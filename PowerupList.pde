class PowerupLives extends Powerup {
  public PowerupLives(Asteroids steven) {
    myX = steven.getX();
    myY = steven.getY();
    myColor = #EA1F37;
  }
  public void show() {
    super.show();
  }
  public void effect() {
    lives.add(new Spaceship());
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