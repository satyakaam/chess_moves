module FarthestTile
	def self.find_tile(position)
    x = position.x
    y = position.y
		target = if x.between?(1,4) && y.between?(97,100)
            Position.new(8,104)
      		elsif x.between?(1,4) && y.between?(101,104)
      			Position.new(8,97)
      		elsif x.between?(5,8) && y.between?(97,100)
      			Position.new(1,104)
      		elsif x.between?(5,8) && y.between?(101,104)
      			Position.new(1,97)
      		else
      			nil
      		end
	end
end