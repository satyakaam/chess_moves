require './lib/position'

module Rock
	def self.find_moves(position)
    x = position.x
    y = position.y
		possible_moves = []
    (1..8).each {|i| possible_moves << Position.new(x+i,y) if (x+i).between?(1,8) && (y).between?(97,104)}
    (1..8).each {|i| possible_moves << Position.new(x,y+i) if (x).between?(1,8) && (y+i).between?(97,104)}
    (1..8).each {|i| possible_moves << Position.new(x-i,y) if (x-i).between?(1,8) && (y).between?(97,104)}
    (1..8).each {|i| possible_moves << Position.new(x,y-i) if (x).between?(1,8) && (y-i).between?(97,104)}
    possible_moves
	end
end
