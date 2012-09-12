class Game
  def initialize
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

  def neighbours_num(x, y)
    count = 0

    if alive?(x, y + 1)
      count += 1
    end

    if alive?(x + 1, y + 1)
      count += 1
    end

    count
  end
end
