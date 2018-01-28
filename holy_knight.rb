require_relative "hero.rb"

class HolyKnight < Hero
  def attack(enemy)
		damage = rand(@ap..@ap*2)
		enemy.hp = enemy.hp - damage
		puts "#{@name}攻擊, 傷害：#{damage} 怪物血量：#{enemy.hp} 英雄生命：#{@hp}"
		if enemy.hp < 1
			enemy.die
		end
	end
end