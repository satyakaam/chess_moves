require 'optparse'
require './lib/pieces/knight'
require './lib/pieces/bishop'
require './lib/pieces/queen'
require './lib/pieces/rock'
require './lib/input_validator'
require './lib/invalid_input_error'
require './lib/farthest_tile'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: ruby chessercise.rb [options]'

    opts.on('--piece piece', 'piece') do |p|
      options[:piece] = p.upcase
    end

    opts.on('--position position', 'position') do |p|
      options[:position] = p
    end

    opts.on('--target', 'target') do |p|
      options[:target] = true
    end
end.parse!

begin
	input = InputValidator.new(options[:piece],options[:position],options[:target])
	if options[:target] == true
		target = FarthestTile.find_tile(input.position)
    opposing_pieces = Position.get_random
    puts "The farthest tile would be #{target.print}"
    puts "The opposing pieces are on following positions"
    puts Position.beautify(opposing_pieces)
    puts "The shortest path from #{input.position.print} to #{target.print} is as bellow"
    puts Position.beautify(input.position.min_moves_to_reach_target(target, input.piece))
	else
		puts "Possible moves for #{options[:piece]} from position #{options[:position]}"
		puts Position.beautify(Object.const_get(input.piece).find_moves(input.position))
	end
rescue InvalidInputError => e
	puts e
end