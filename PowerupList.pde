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
  public void showRule(int x, int y) {
    super.show();
    idiot.setX(x+3);
    idiot.setY(y+5);
    idiot.show();
    //for rule screen
  }
  public void effect() {
    //effect is to add a new life
    lives.add(new Spaceship(1.6));
  }
}
class PowerupMoreAmmo extends Powerup {
  private int stevenX;
  private int stevenY;
  private Bullets MrPeewee;
  public PowerupMoreAmmo(Asteroids steven) {
    stevenX = steven.getX();
    stevenY = steven.getY();
    myX = stevenX;
    myY = stevenY;
    myColor = #EA1F37;
    MrPeewee = new Bullets();
  }
  public void show() {
    super.show();
    MrPeewee.setX(stevenX+5);
    MrPeewee.setY(stevenY+5);
    MrPeewee.show();
  }
  public void showRule(int x, int y) {
    super.show();
    MrPeewee.setX(x+5);
    MrPeewee.setY(y+5);
    MrPeewee.show();
  }
  public void effect() {
    //effect is add 6 to max ammo
    maxAmmo+=6;
  }
}
class PowerupTeleport extends Powerup {
  private Spaceship billyBob;
  private int stevenX;
  private int stevenY;
  public PowerupTeleport(Asteroids steven) {
    stevenX = steven.getX();
    stevenY = steven.getY();
    myX = stevenX;
    myY = stevenY;
    myColor = #0297F7;
    billyBob = new Spaceship(1);
  }
  public void show() {
    super.show();
    billyBob.setColor(invulColor);
    billyBob.setX(stevenX+3);
    billyBob.setY(stevenY+5);
    billyBob.show();
  }
  public void showRule(int x, int y) {
    super.show();
    billyBob.setColor(invulColor);
    billyBob.setX(x+3);
    billyBob.setY(y+5);
    billyBob.show();
  }
  public void effect() {
    //effect is add teleport
    resetAmount++;
  }
}