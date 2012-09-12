require_relative '../lib/game_loader'

describe 'GameLoader' do
  let(:loader) { GameLoader.new }

  specify '.load_from_str creates a game from a str' do
    game = GameLoader.load_from_str(
      "        \n" \
      " x x    \n" \
      "  x     \n" \
      " x x    \n" \
      "        \n" \
      "        \n" \
      "        \n" \
      "        \n")

    game.alive?(0, 0).should be_false
    game.alive?(1, 1).should be_true
    game.alive?(3, 1).should be_true
    game.alive?(2, 2).should be_true
    game.alive?(1, 3).should be_true
    game.alive?(3, 3).should be_true
  end

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
