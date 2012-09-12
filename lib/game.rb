class Game
  attr_reader :max_x, :max_y

  def initialize(max_x, max_y)
    @max_x, @max_y = max_x, max_y
    @cells = {}
  end

  def alive?(x, y)
    @cells["#{x}-#{y}"] == 1
  end

  def set(x, y)
    @cells["#{x}-#{y}"] = 1
  end

  def unset(x, y)
    @cells.delete "#{x}-#{y}"
  end
end
