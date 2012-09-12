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

    coords = []
    coords << [x - 1, y - 1]
    coords << [x - 1, y]
    coords << [x - 1, y + 1]
    coords << [x, y - 1]
    coords << [x, y + 1]
    coords << [x + 1, y - 1]
    coords << [x + 1, y]
    coords << [x + 1, y + 1]

    coords.each do |i, j|
      count += 1 if alive?(i, j)
    end

    count
  end
end
