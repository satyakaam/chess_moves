module Queen
	def self.find_moves(position)
		(Rock.find_moves(position) + Bishop.find_moves(position)).flatten
	end
end
