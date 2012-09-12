require_relative '../lib/game_printer'

describe GamePrinter do
  let(:game) { Game.new }
  let(:printer) { GamePrinter.new(game) }

  specify '#print' do
    printer.print.should ==
      "        \n" \
      "        \n" \
      "        \n" \
      "        \n" \
      "        \n" \
      "        \n" \

    game.set(0, 0)
    game.set(1, 1)
    game.set(3, 1)
    game.set(2, 2)

    printer.print.should ==
      "x       \n" \
      " x x    \n" \
      "  x     \n" \
      "        \n" \
      "        \n" \
      "        \n" \
  end 
end
