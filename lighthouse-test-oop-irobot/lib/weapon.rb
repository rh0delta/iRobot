class Weapon < Item
  attr_reader :damage, :range
  def initialize(name, weight, damage, range)
    super(name, weight)
    @damage = damage
    @range = range
  end

  def hit(robot)
    robot.wound(@damage)
  end
end
