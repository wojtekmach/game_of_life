require_relative 'game'

def Game(*lines)
  GameLoader.new.load(*lines)
end

class GameLoader
  def self.load_from_str(str)
    new.load(*str.split("\n"))
  end

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
