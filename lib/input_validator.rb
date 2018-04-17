require './lib/position'

class InputValidator
	VALID_PIECES = ['knight', 'bishop', 'rock', 'queen']

	attr_accessor :piece, :position

	def initialize(piece,position,target)
    if target
      raise InvalidInputError.new() unless VALID_PIECES.include?(piece.downcase) && position.length == 2 && piece.downcase != 'bishop'
    else
		  raise InvalidInputError.new() unless VALID_PIECES.include?(piece.downcase) && position.length == 2
    end
		@piece = piece.capitalize

    temp = position.split('')
    @x = temp[1].to_i
    @y = temp[0].downcase.to_sym.to_s.ord
    @position = Position.new(@x, @y)
	end
end
