class BoxOfBolts < Item

  HEAL_VALUE = 20

  def initialize
    super("box of bolts", 25)
  end

  def feed(robot)
    robot.heal(HEAL_VALUE)
  end

end
