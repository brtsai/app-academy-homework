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
    puts "Remember this sequence well, peasant!"
    add_random_color
    puts @seq
  end

  def require_sequence
    colour_being_guessed = 0
    puts "It is time for you to test your memory, and be judged!"
    until colour_being_guessed == @sequence_length
      player_guess = gets.chomp
      if player_guess != @seq[colour_being_guessed]
        @game_over = true
        break
      end
      colour_being_guessed += 1
    end
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

s = Simon.new
s.play
