require_relative '00_tree_node.rb'

class KnightPathFinder
  attr_accessor :visited_positions, :pos

  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
    @board = Array.new(8) do
      Array.new(8) { PolyTreeNode.new}
    end
  end

  def fill_board
    board.each_with_index do |array, i|
      array.each_with_index do |el, j|

      end
    end

  end

  def new_move_positions(pos)

  end

  def build_move_tree

  end

  def self.valid_moves(pos)
    moves = []
    # moves - visited_positions

    moves << [pos[0] -2,pos[1]-1]
    moves << [pos[0] -2,pos[1]+1]
    moves << [pos[0] -1,pos[1]-2]
    moves << [pos[0] -1,pos[1]-2]
    moves.concat(moves.map {|pos| pos.reverse})

    moves
  end


end


knight1 = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([0,0])
