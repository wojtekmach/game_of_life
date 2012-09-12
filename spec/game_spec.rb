require_relative '../lib/game'

describe Game do
  let(:game) { Game.new(100, 100) }

  specify '#alive?' do
    game.alive?(0, 0).should be_false
    game.set(0, 0)
    game.alive?(0, 0).should be_true
    game.unset(0, 0)
    game.alive?(0, 0).should be_false
  end
end
