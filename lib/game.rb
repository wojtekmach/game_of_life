class Game
  def initialize
    @cells = {}
  end

  def alive?(x, y)
    @cells["#{x}-#{y}"] == 1
  end

  def set(x, y)
    @cells["#{x}-#{y}"] = 1

    @min_x = x if !@min_x || x < @min_x
    @max_x = x if !@max_x || x > @max_x
    @min_y = y if !@min_y || y < @min_y
    @max_y = y if !@max_y || y > @max_y
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

    @min_x ||= 0
    @max_x ||= 0
    @min_y ||= 0
    @max_y ||= 0

    ((@min_x - 1)..(@max_x + 1)).each do |x|
      ((@min_y - 1)..(@max_y + 1)).each do |y|
        if !alive?(x, y) && neighbours_num(x, y) == 3
          to_set << [x, y]
        end
      end
    end

    to_unset.each { |x, y| unset(x, y) }
    to_set.each { |x, y| set(x, y) }
  end
end
