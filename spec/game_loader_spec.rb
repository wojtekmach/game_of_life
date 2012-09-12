require_relative '../lib/game_loader'

describe 'GameLoader' do
  let(:loader) { GameLoader.new }

  specify '#load creates a game from list of lines' do
    game = loader.load(
      '        ',
      ' x x    ',
      '  x     ',
      ' x x    ',
      '        ',
      '        ',
      '        ',
      '        ',
    )

    game.alive?(0, 0).should be_false
    game.alive?(1, 1).should be_true
    game.alive?(3, 1).should be_true
    game.alive?(2, 2).should be_true
    game.alive?(1, 3).should be_true
    game.alive?(3, 3).should be_true
  end
end
