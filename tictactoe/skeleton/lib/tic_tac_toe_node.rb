require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def node
    self
  end

  def losing_node?(evaluator)
    return false if board.over? && (board.winner == evaluator || board.winner == nil)
    return true if board.over?
    if self.next_mover_mark == evaluator
      self.children.all?{|child| child.losing_node?(evaluator)} 
    else
      self.children.any?{|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    return true if board.over? && board.winner == evaluator
    return false if board.over?
    if self.next_mover_mark == evaluator
      self.children.any?{|child| child.winning_node?(evaluator)} 
    else
      self.children.all?{|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    board.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        pos = [i, j]
        # debugger
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = next_mover_mark
          if next_mover_mark == :x
            next_mover_mark = :o
          else
            next_mover_mark = :x
          end
          child = TicTacToeNode.new(new_board, next_mover_mark, pos)
          children << child
        end
      end
    end
    return children
  end

end
