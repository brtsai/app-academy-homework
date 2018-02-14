#Written by Bryan Tsai 12 Feb 2018

require_relative 'player'
require_relative 'fragment'
require_relative 'fragment'

class Game
  attr_reader :players, :fragment, :dictionary, :ghosts
  def initialize (players, dictionary)
    @players = players
    @dictionary = dictionary
    @curr_player_index = 0
    @last_player_index = 0
    @fragment = Fragment.new(@dictionary)
    @ghosts = []
  end
  
  def number_of_players
    @players.size
  end

  def curr_player
    @players[@curr_player_index]
  end

  def curr_player_name
    @players[@curr_player_index].name
  end

  def last_player
    @players[@last_player_index]
  end

  def curr_player_died?
    @fragment.is_word?
  end

  def end_turn!
    @last_player_index = @curr_player_index
    @curr_player_index = (@curr_player_index + 1) % number_of_players
  end

  def next_letter
    curr_player.get_letter(@fragment, number_of_players)
  end

  def take_turn!
    @fragment << next_letter
    end_turn!
  end

  def next_round!
    bury_the_dead!
    @fragment.reset!
    @curr_player_index = 0
    @last_player_index = 0
  end

  def declare_round_loser
    last_player.lose_a_life!
    name = last_player.name
    word = @fragment.to_s
    lives_left = last_player.dead? ? "no" : last_player.lives
    lives = last_player.lives == 1 ? "life" : "lives"
    puts "#{name} has spelled #{word}"
    puts "#{name} has #{lives_left} #{lives} left"
    puts "At least #{name} knows how to spell #{word}"
  end

  def end_round!
    declare_round_loser
    next_round!
  end

  def game_over?
    number_of_players == 1
  end

  def fragment_is_word?
    @fragment.is_word?
  end

  def kill_player!(player)
    player.lose_a_life!
  end

  def have_a_funeral_for(player)
    puts "Alas poor #{player.name}! At least they could spell"
  end

  def bury_the_dead!
    @players.each do |player| 
      have_a_funeral_for(player) if player.dead?
      @ghosts << player if player.dead?  
    end
    @players.reject! { |player| player.dead? }
  end

  def self.start_new_game(*new_players)
    players = []
    new_players.each { |player| players << Player.new(player) }
    dictionary = []
    begin
      File.open('dictionary.txt').each do |line| 
        dictionary << line.chomp
      end
    rescue Exception => e
      puts "Error opening dictionary.txt: #{e.message}"
      return
    end
    game = Game.new(players, dictionary)

    until game.game_over?
      until game.fragment_is_word?
        game.take_turn!
      end
      game.end_round!
    end

    puts "#{game.curr_player_name} wins!"
  end

end
