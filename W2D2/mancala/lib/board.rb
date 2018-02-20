class Board
  attr_accessor :cups, :player_one, :player_two
  # @cups[0] and @cups[6] are player stores
  def initialize(name1, name2)
    @player_one = name1
    @player_two = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...6).each do |index|
      (0...4).each do |unused|
        @cups[index] << :stone
      end
    end
    (7...13).each do |index|
      (0...4).each do |unused|
        @cups[index] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Cup doesn't exist" if start_pos < 0 || start_pos > 13
    raise "Cup is a goal cup" if start_pos == 6 || start_pos == 13
    raise "Cup is empty" if @cups[start_pos].length == 0
    
    true
  end

  def valid_player_cup(pos, name)
    return false if name == @player_one && pos == 13
    return false if name == @player_two && pos == 7
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      hand = empty_cup(start_pos)
      curr_pos = start_pos
      
      until hand.empty?
        curr_pos = (curr_pos + 1) % 14
        next unless valid_player_cup(curr_pos, current_player_name)
        stone = hand.pop
        @cups[curr_pos] << stone
      end
    end
    render
    next_turn(curr_pos)
  end

  def empty_cup(start_pos)
    hand = []
    cup = @cups[start_pos]
    until cup.empty?
      hand << cup.pop
    end
    hand
  end
  
  def is_a_point_store(cup_index)
    return true if cup_index == 6 || cup_index == 13
    false
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if is_a_point_store(ending_cup_idx)
    return ending_cup_idx if @cups[ending_cup_idx].size > 1
    :switch
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end
  
  def player_one_side_empty?
    (0...6).each do |cup_index|
      return false unless @cups[cup_index].empty?
    end
    true
  end

  def player_two_side_empty?
    (6...13).each do |cup_index|
      return false unless @cups[cup_index].empty?
    end
    true
  end

  def one_side_empty?
    player_one_side_empty? || player_two_side_empty?
  end

  def player_one_points
    @cups[6].count
  end

  def player_two_points
    @cups[13].count
  end

  def winner
    return :draw if player_one_points == player_two_points
    return @player_one if player_one_points > player_two_points
    @player_two
  end
end
