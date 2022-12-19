require_relative '00_tree_node.rb'

class KnightPathFinder

    attr_reader :root_node
    
    def self.valid_moves(pos)

        result = [[po]]
        

    end

    def initialize(pos)
        @considered_positions = pos
        @root_node = PolyTreeNode.new(pos)
    end
        
    def new_move_positions(pos)
        valid_moves(pos).select { || }
    end

    def build_move_tree
    end

end