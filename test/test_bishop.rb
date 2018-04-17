require './lib/beautify_move'
require './lib/validate_move'
require './lib/bishop'
require 'minitest/autorun'

class BishopTest < Minitest::Test
	def test_find_moves
		assert_equal(["e5", "f6", "g7", "h8", "e3", "f2", "g1", "c5", "b6", "a7", "c3", "b2", "a1"],
      Bishop.find_moves(4,100))
	end
end
