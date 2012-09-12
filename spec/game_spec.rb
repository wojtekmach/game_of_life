require_relative '../lib/game'

describe Game do
  let(:game) { Game.new }

  specify '#==' do
    game1 = Game.new
    game2 = Game.new

    game1.should == game2

    game1.set(0, 0)
    game1.should_not == game2

    game2.set(0, 0)
    game1.should == game2
  end

  specify '#alive?' do
    game.alive?(0, 0).should be_false
    game.set(0, 0)
    game.alive?(0, 0).should be_true
    game.unset(0, 0)
    game.alive?(0, 0).should be_false
  end

  specify '#neighbours_num' do
    game.neighbours_num(0, 0).should == 0

    game.set(0, 1)
    game.neighbours_num(0, 0).should == 1

    game.set(1, 1)
    game.neighbours_num(0, 0).should == 2

    game.set(-1, -1)
    game.neighbours_num(0, 0).should == 3
  end

  describe '#run' do
    specify 'Any live cell with fewer than two live neighbours dies, as if caused by under-population.' do
      game.run
      game.alive?(0, 0).should be_false

      game.set(0, 0)
      game.set(1, 1)
      game.run
      game.alive?(0, 0).should be_false

      game.set(0, 0)
      game.set(0, 1)
      game.set(1, 1)
      game.run
      game.alive?(0, 0).should be_true
    end

    specify 'Any live cell with two or three live neighbours lives on to the next generation.' do
      game = Game.new
      game.set(0, 0)
      game.set(0, 1)
      game.set(1, 1)
      game.run
      game.alive?(0, 0).should be_true

      game = Game.new
      game.set(0, 0)
      game.set(0, 1)
      game.set(1, 0)
      game.set(1, 1)
      game.run
      game.alive?(0, 0).should be_true
    end

    specify 'Any live cell with more than three live neighbours dies, as if by overcrowding.' do
      game = Game.new
      game.set(1, 1)
      game.set(0, 0)
      game.set(0, 1)
      game.set(1, 0)
      game.set(1, 1)
      game.set(1, 2)
      game.run
      game.alive?(1, 1).should be_false
    end

    specify 'Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.' do
      game = Game.new
      game.alive?(0, 0).should be_false

      game.set(0, 1)
      game.set(1, 0)
      game.set(1, 1)
      game.run
      game.alive?(0, 0).should be_true
    end
  end
end
