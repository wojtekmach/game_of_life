require_relative 'game'

class GamePrinter
  def initialize(game)
    @game = game
  end

  def print
    s = ''
    (0..5).each do |y|
      (0...8).each do |x|
        s << (@game.alive?(x, y) ? 'x' : ' ')
      end
      s << "\n"
    end
    s
  end
end
