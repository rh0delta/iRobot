class Robot
  attr_reader :items, :health, :x, :y
  attr_accessor :equipped_weapon

  ATTACK_POWER = 5
  MIN_HEALTH = 100
  MAX_DAMAGE = 0

  def initialize
    @x = 0
    @y = 0
    @items = []
    @health = 100
  end

  def position
    @position = [@x, @y]
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y += 1
  end

  def move_down
    @y -= 1
  end

  def pick_up(item)
    can_pick_up = items_weight + item.weight <= 250 

    if can_pick_up
      
      if health <= 80 && item.is_a?(BoxOfBolts) 
        item.feed(self)
      end
      @items << item 
      @equipped_weapon = item if item.is_a?(Weapon)
    end

    can_pick_up
  end
  
  def items_weight  
    @items.inject(0){|sum, item| sum += item.weight} 
  end

  def heal(amount)
    @health += amount
    @health = [@health, MIN_HEALTH].min 
  end

  def heal!
    if health <= 0
      raise "I'm dead..."
    end
  end

  def wound(damage)
    @health -= damage
    @health = [@health, MAX_DAMAGE].max
  end

  def attack(other_robot)
    pos_difference_x = other_robot.x - @x
    pos_difference_y = other_robot.y - @y
    if pos_difference_y.between?(-1,1) && pos_difference_x.between?(-1,1) 
      unless equipped_weapon
        other_robot.wound(ATTACK_POWER)
      else
        equipped_weapon.hit(other_robot)
      end
    elsif equipped_weapon.is_a?(Grenade) && pos_difference_x.between?(-2,2) && pos_difference_y.between?(-2,2)
      equipped_weapon.hit(other_robot)
      @equipped_weapon = nil
    end

  end

  def attack!(other_defender)
    if other_defender.class != Robot
      raise StandardError, "Bitch you can't attack me..."
    end
  end

end
