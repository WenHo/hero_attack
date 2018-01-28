class Monster

	attr_accessor :name, :hp, :ap
	MAX_HP = 100
	MAX_AP = 50
	def initialize(name, hp, ap)
		@name = name
		if MAX_HP < hp
			@hp = MAX_HP
		else
			@hp = hp
		end

		if MAX_AP < hp
			@ap = MAX_AP
		else
			@ap = ap
		end
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