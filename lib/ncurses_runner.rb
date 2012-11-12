require 'ncurses'

class NcursesRunner
  def initialize(game)
    @game = game

    @rows = 100
    @cols = 100
    @wait = 0.01
  end

  def run
    Ncurses.initscr
    Ncurses.nl()
    Ncurses.noecho()
    Ncurses.curs_set(0)
    Ncurses.stdscr.nodelay(true)

    begin
      win = Ncurses.stdscr

      while true
        each_pixel do |x, y|
          win.mvaddstr(y, x, " ")
          win.mvaddstr(y, x, @game.alive?(x, y) ? 'x' : ' ')
        end

        win.refresh

        sleep @wait

        @game.run
      end
    ensure
      Ncurses.curs_set(1)
      Ncurses.endwin()
    end
  end

  private
  
  def each_pixel
    (0..@rows).each do |y|
      (0...@cols).each do |x|
        yield x, y
      end
    end
  end
end
