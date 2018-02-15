require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts @seq
  end

  def require_sequence

  end

  def add_random_color
    random_colour = COLORS.shuffle[0]
    @seq << random_colour
  end

  def round_success_message
    puts "You live to guess another turn."
  end

  def game_over_message
    puts "Yu gonplei ste odon"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
