#Written by Bryan Tsai 12 Feb 2018

class Fragment
  attr_reader :fragment, :dictionary

  def initialize(fragment = "", dictionary)
    @fragment = fragment
    @dictionary = dictionary
  end

  def to_s
    @fragment
  end

  def length
    @fragment.length
  end

  def is_valid?
    possible_words = @dictionary
    (0...self.length).each do |index|
      possible_words = possible_words.select do |word|
        word.length > index ? word[index] == self[index] : false
      end
      return false if possible_words.length == 0
    end
    true
  end

  def is_valid_addition?(char)
    clone = deep_copy
    clone << char
    clone.is_valid?
  end

  def <<(char)
    @fragment << char
  end

  def [](index)
    @fragment[index]
  end

  def deep_copy
    Marshal.load(Marshal.dump(self))
  end

  def is_word?
    @dictionary.include?(@fragment)
  end

  def reset!
    @fragment = ""
  end

end
