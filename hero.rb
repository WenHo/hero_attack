class Hero
	@@heroes = []
	attr_accessor :name, :hp
	def initialize(name, hp, ap)
		@name = name
		@hp = hp
		@ap = ap
		@alive = true

		#把自己加入heros陣列
		@@heroes << self
		
  end
  def self.count
  	return @@heroes.length
  end
  def self.all
  	return @@heroes
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