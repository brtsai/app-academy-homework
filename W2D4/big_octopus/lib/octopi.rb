# Find longest fish in O(n^2) time
def sluggish_octopus(fishes)
  return "" if fishes.length < 1
  longest_fish = fishes[0]
  fishes.each do |fish|
    return fish if fishes.all? do |other_fish| 
      other_fish.length <= fish.length
    end
  end
end

def dominant_octopus(fishes)
  fishes.sort { |l,r| l.length <=> r.length }.last
end

def clever_octopus(fishes)
  return "" if fishes.length < 1
  longest_fish = fishes[0]
  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

# takes in an array of moves where each index corresponds to
# leg number
def slow_dance(move, tiles)
  tiles.each_with_index { |el, ind| return ind if el == move }
  nil
end

#takes in a hash of moves to leg numbers
def constant_dance(move, tiles)
  tiles[move]
end
