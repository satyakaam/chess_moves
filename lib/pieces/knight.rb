require './lib/position'

module Knight
	def self.find_moves(position)
    x = position.x
    y = position.y
		possible_moves = []
    possible_moves << Position.new(x - 1, y - 2) if (x-1).between?(1,8) && (y-2).between?(97,104)
    possible_moves << Position.new(x - 2, y - 1) if (x-2).between?(1,8) && (y-1).between?(97,104)
    possible_moves << Position.new(x - 2, y + 1) if (x-2).between?(1,8) && (y+1).between?(97,104)
    possible_moves << Position.new(x - 1, y + 2) if (x-1).between?(1,8) && (y+2).between?(97,104)
    possible_moves << Position.new(x + 1, y - 2) if (x+1).between?(1,8) && (y-2).between?(97,104)
    possible_moves << Position.new(x + 2, y - 1) if (x+2).between?(1,8) && (y-1).between?(97,104)
    possible_moves << Position.new(x + 2, y + 1) if (x+2).between?(1,8) && (y+1).between?(97,104)
    possible_moves << Position.new(x + 1, y + 2) if (x+1).between?(1,8) && (y+2).between?(97,104)
    possible_moves
	end
end
