class Monster

	attr_accessor :name, :hp, :ap
	def initialize(name, hp, ap)
		@name = name
		@hp = hp
		@ap = ap
		@alive = true

  end
	def is_alive?
		return @alive
	end

	def attack(enemy)
		damage = rand(@ap/2..@ap)
		enemy.hp = enemy.hp - damage
		puts "#{@name}攻擊, 傷害：#{damage} 敵人血量：#{enemy.hp} 怪物生命：#{@hp}"
		if enemy.hp < 1
			enemy.die
		end
	end

	def die
		@alive = false
		puts "#{@name}被打倒了"
	end

end

class Hero
	@@heroes = []
	attr_accessor :name, :hp
	def initialize(name, hp, ap)
		@name = name
		@hp = hp
		@ap = ap
		@alive = true
		
  end
 
	def is_alive?
		return @alive
	end

	def attack(enemy)
		damage = rand(@ap/2..@ap)
		enemy.hp = enemy.hp - damage
		puts "#{@name}攻擊, 傷害：#{damage} 敵人血量：#{enemy.hp} 生命：#{@hp}"
		if enemy.hp < 1
			enemy.die
		end
	end

	def die
		@alive = false
		puts "#{@name}被打倒了"
	end

end

class Mage < Hero
  def initialize(name, hp, ap ,mp)
		@mp = mp
    super(name, hp, ap)
		puts "英雄:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap}, 魔力：#{@mp}"
  end
  def fireball
    @mp = @mp - 3
    return @ap + 10
  end
  def attack(enemy)
    if @mp >= 3
      damage = fireball
      enemy.hp = enemy.hp - damage
      if enemy.hp < 1
			  enemy.die
		  end
      puts "#{@name}火球攻擊, 傷害：#{damage} 敵人血量：#{enemy.hp} 生命：#{@hp} mp :#{@mp}"
    else
    	super(enemy)
		end
		
		
	end
  
end

class DarkMage < Monster
  def initialize(name, hp, ap ,mp)
		@mp = mp
    super(name, hp, ap)
    puts "怪獸:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap}, 魔力：#{@mp}"
  end
  def dark_force
    @mp = @mp - 3
    return @ap + 10
  end
  def attack(enemy)
    if @mp >= 3
      damage = dark_force
      enemy.hp = enemy.hp - damage
      if enemy.hp < 1
			  enemy.die
		  end
      puts "#{@name}暗力攻擊, 傷害：#{damage} 敵人血量：#{enemy.hp} 生命：#{@hp} mp :#{@mp}"
    else
    	super(enemy)
		end
		
		
	end
  
end

dark_mage = DarkMage.new("Morgana", 100, 30, 8)
mage = Mage.new("Merlin", 100, 20, 7)




while mage.is_alive? && dark_mage.is_alive? 
	mage.attack(dark_mage)
	if !dark_mage.is_alive?
	  break
	end
	dark_mage.attack(mage)
end

