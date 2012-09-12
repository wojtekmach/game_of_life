require_relative '../lib/game'

describe Game do
  let(:game) { Game.new }

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
  end
end
