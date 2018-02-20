class Board
  attr_accessor :cups, :player_one, :player_two
  # @cups[0] and @cups[6] are player stores
  def initialize(name1, name2)
    @player_one = name1
    @player_two = name2
    @cups = Array.new(14) { [] }
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

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Cup doesn't exist" if start_pos < 0 || start_pos > 13
    raise "Cup is a goal cup" if start_pos == 6 || start_pos == 13
    raise "Cup is empty" if @cups[start_pos].length == 0
    
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      contents = empty_cup(start_pos)
      curr_pos = start_pos
      until contents.empty?
        

        curr_pos = (curr_pos + 1) % 14
      end
    end
  end

  def empty_cup(start_pos)
    contents = @cups[start_pos]
    @cups[start_pos] = []
    contents
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
