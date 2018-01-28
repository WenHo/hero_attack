class Monster

	attr_accessor :name, :hp, :ap
	def initialize(name, hp, ap)
		@name = name
		@hp = hp
		@ap = ap
		@alive = true

		puts "怪獸:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap}"
  end
	def is_alive?
		return @alive
	end

	def attack(enemy)
		damage = rand(@ap/2..@ap)
		enemy.hp = enemy.hp - damage
		puts "#{@name}攻擊, 傷害：#{damage} 英雄血量：#{enemy.hp} 怪物生命：#{@hp}"
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
  puts "英雄:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap}"
  end
  
	def is_alive?
		return @alive
		puts "#{@name}被打倒了"
	end

	def attack(enemy)
		damage = rand(@ap/2..@ap)
		enemy.hp = enemy.hp - damage
		puts "#{@name}攻擊, 傷害：#{damage} 怪物血量：#{enemy.hp} 英雄生命：#{@hp}"
		if enemy.hp < 1
			enemy.die
		end
	end

	def die
		@alive = false
		puts "#{@name}被打倒了"
	end

end
class Orc < Monster
  def attack(enemy)
		damage = rand(@ap..@ap*2)
		enemy.hp = enemy.hp - damage
		puts "#{@name}攻擊, 傷害：#{damage} 英雄血量：#{enemy.hp} 獸人生命：#{@hp}"
		if enemy.hp < 1
			enemy.die
		end
	end
end


  

orc = Orc.new("Berserker", 150, 31)
hero = Hero.new("Lancer", 150, 32,)






while hero.is_alive? && orc.is_alive? 
	hero.attack(orc)
	if !orc.is_alive?
	  break
	end
	orc.attack(hero)
end

