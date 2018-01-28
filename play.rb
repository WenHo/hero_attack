require_relative "monster.rb"
require_relative "mage.rb"

monster = Monster.new("Berserker", 550, 55)
mage = Mage.new("Caster", 120, 29, 30)


while mage.is_alive? && monster.is_alive? 
	mage.attack(monster)
	if !monster.is_alive?
	  break
	end
	monster.attack(mage)
end