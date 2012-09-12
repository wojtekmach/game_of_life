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

  def run
    to_unset = []
    to_set = []

    @cells.each do |coords, _|
      x, y = coords.split('-').map(&:to_i)

      if neighbours_num(x, y) < 2
        to_unset << [x, y]
      end

      if neighbours_num(x, y) > 3
        to_unset << [x, y]
      end
    end

    (0..100).each do |x|
      (0..100).each do |y|
        if !alive?(x, y) && neighbours_num(x, y) == 3
          to_set << [x, y]
        end
      end
    end

    to_unset.each { |x, y| unset(x, y) }
    to_set.each { |x, y| set(x, y) }
  end
end
