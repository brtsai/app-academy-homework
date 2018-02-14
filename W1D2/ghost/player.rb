#Written by Bryan Tsai 12 Feb 2018

class Player
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 5
  end

  def get_letter(fragment, number_of_players)
    puts "It's #{@name}'s turn to add a letter to \"#{fragment.to_s}\""
    get_next_letter
    until fragment.is_valid_addition?(@given_letter)
      puts "Sorry, but #{fragment.to_s}#{@given_letter} isn't a word"
      puts "Please try a different letter"
      get_next_letter
    end
    puts "#{@name} chose #{@given_letter} for \"#{fragment.to_s}\""
    @given_letter
  end

  def get_next_letter
    @given_letter = gets.chars[0]
  end

  def lose_a_life!
    @lives -= 1
  end

  def dead?
    @lives < 1
  end
end
