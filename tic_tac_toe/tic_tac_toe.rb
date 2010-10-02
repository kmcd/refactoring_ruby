# TODO: Replace Open Secret with Board
class String
  def occupied?
    self == '-'
  end
  
  def free?
    !occupied?
  end
end

class Game
  NO_MOVE = -1
  BOARD_POSITIONS = (0..8)
  attr_accessor :board
  
  def initialize(s, position=nil, player=nil)
    @board = s.dup
    @board[position] = player unless position == nil
  end

  def best_move_for(player)
    BOARD_POSITIONS.each do |move|
      if board[move,1].occupied?
        game = play(move, player)
        return move if game.winner() == player
      end
    end

    BOARD_POSITIONS.each {|move| return move if board[move,1].occupied? }
    
    return NO_MOVE
  end

  def play(move, player)
    Game.new(board, move, player)
  end

  def winner
    if board[0,1].free? && board[0,1] == board[1,1] &&
        board[1,1] == board[2,1]
      return board[0,1]
    end
    if board[3,1].free? && board[3,1] == board[4,1] &&
        board[4,1] == board[5,1]
      return board[3,1]
    end
    if board[6,1].free? && board[6,1] == board[7,1] &&
        board[7,1] == board[8,1]
      return board[6,1]
    end
    return '-'
  end
end
