require_relative 'game'

class GameLoader
  def load(*lines)
    game = Game.new

    lines.each_with_index do |line, y|
      line.split(//).each_with_index do |char, x|
        game.set(x, y) if char == 'x'
      end
    end

    game
  end
end
