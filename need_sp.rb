class Monster

	attr_accessor :name, :hp, :ap
	def initialize(name, hp, ap )
		@name = name
		@hp = hp
		@ap = ap
		@sp = 3
		@alive = true

		puts "怪獸:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap},  體力: #{@sp}"
  end
	def is_alive?
		return @alive
	end
	def use_sp
		@sp = @sp - 1
	end
	def attack(enemy)
		if @sp > 0
			damage = rand(@ap/2..@ap)
			enemy.hp = enemy.hp - damage
			use_sp
			puts "#{@name}攻擊, 傷害：#{damage} 對手血量：#{enemy.hp} 生命：#{@hp}"
		else
			@sp = @sp + 2
			puts "#{@name}無法攻擊, 休息一回合，恢復 2 sp"
			return
		end
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
	attr_accessor :name, :hp
	def initialize(name, hp, ap )
		@name = name
		@hp = hp
		@ap = ap
		@sp = 3
		@alive = true

		puts "英雄:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap},  體力: #{@sp}"
  end
  
	def is_alive?
		return @alive
		puts "#{@name}被打倒了"
	end
	def use_sp
		@sp = @sp - 1
	end
	def attack(enemy)
		if @sp > 0
			damage = rand(@ap/2..@ap)
			enemy.hp = enemy.hp - damage
			use_sp
			puts "#{@name}攻擊, 傷害：#{damage} 對手血量：#{enemy.hp} 生命：#{@hp}"
		else
			@sp = @sp + 2
			puts "#{@name}無法攻擊, 休息一回合，恢復 2 sp"
			return
		end
		if enemy.hp < 1
			enemy.die
		end
	end

	def die
		@alive = false
		puts "#{@name}被打倒了"
	end
end



  

hero = Hero.new("Tim", 100, 30)
monster = Monster.new("Bigfoot", 100, 30)






while hero.is_alive? && monster.is_alive? 
	hero.attack(monster)
	if !monster.is_alive?
	  break
	end
	monster.attack(hero)
end

