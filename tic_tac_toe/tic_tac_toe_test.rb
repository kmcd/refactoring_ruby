require 'test/unit'
require 'tic_tac_toe'

class GameTest < Test::Unit::TestCase

  def test_default_best_move_for
    game = Game.new("XOX" +
                    "OX-" +
                    "OXO")
    assert_equal(5, game.best_move_for('X'))

    game = Game.new("XOX" + 
                    "OXO" + 
                    "OX-")
    assert_equal(8, game.best_move_for('O'))

    game = Game.new("---" + 
                    "---" + 
                    "---")
    assert_equal(0, game.best_move_for('X'))

    game = Game.new("XXX" + 
                    "XXX" + 
                    "XXX")
    assert_equal(-1, game.best_move_for('X'))
  end

  def test_find_winning_best_move_for
    game = Game.new("XO-" + 
                    "XX-" + 
                    "OOX")
    assert_equal(5, game.best_move_for('X'))
  end

  def test_win_conditions
    game = Game.new("---" + 
                    "XXX" + 
                    "---")
    assert_equal('X', game.winner())
  end
end
