class Position
	attr_accessor :x, :y
	def initialize(x,y)
    raise InvalidInputError.new() unless x.between?(1,8) && y.between?(97,104)
    @x = x
    @y = y
  end

  def print
    "#{y.chr}#{x}"
  end

  def coordinate
    [x,y]
  end

  def self.get_random
    (1..8).to_a.product((97..104).to_a).sample(8).map{ |x,y| Position.new(x,y) }
  end

  def self.beautify(positions)
    positions.map{ |position| position.print }.join(" ")
  end

  def ==(target)
    x == target.x && y == target.y
  end

  def min_moves_to_reach_target(target, piece)
    current = self
    path = []
    path << current
    distance_parent = Array.new(8) { Array.new(8) { { distance: nil, parent: nil } } }
    distance_parent[target.x - 1][target.y - 97][:distance] = 0
    queue = []
    queue << target

    reached = false

    until reached
      position = queue.shift
      distance = 1
      Object.const_get(piece).find_moves(position).each do |move|
        if move == current
          reached = true
        end

        if distance_parent[move.x - 1][move.y - 97][:distance] == nil
          distance_parent[move.x - 1][move.y - 97][:distance] = distance_parent[position.x - 1][position.y - 97][:distance] + 1
          distance_parent[move.x - 1][move.y - 97][:parent] = position
          queue << move
        end
      end
    end

    smallest_distance = 63
    shortest_path = nil
    start = current
    until shortest_path == target
      Object.const_get(piece).find_moves(start).each do |move|
        if distance_parent[move.x - 1][move.y - 97][:distance] != nil && distance_parent[move.x - 1][move.y - 97][:distance] < smallest_distance
          smallest_distance = distance_parent[move.x - 1][move.y - 97][:distance]
          shortest_path = move
        end
      end
      path << shortest_path
      start = shortest_path
    end
    path
  end
end