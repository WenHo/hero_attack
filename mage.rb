require_relative "hero.rb"
class Mage < Hero
  def initialize(name, hp, ap ,mp)
		@mp = mp
    super(name, hp, ap)
		puts "英雄:#{@name}, 生命力：#{@hp}, 攻擊力：#{@ap}, 魔力：#{@mp}"
  end
  def fireball
    @mp = @mp - 10
    return rand (@ap*2..@ap*3)
  end
  def attack(enemy)
    if @mp >= 10
      damage = fireball
      enemy.hp = enemy.hp - damage
    else
    	super(enemy)
		end
		
		puts "#{@name}攻擊, 傷害：#{damage} 怪物血量：#{enemy.hp} 英雄生命：#{@hp} mp :#{@mp}"
		if enemy.hp < 1
			enemy.die
		end
	end
  
end