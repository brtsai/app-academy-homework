class Map
  def initialize
    @ivar = []
  end

  def lookup(key)
    @ivar.each do |entry|
      return entry if entry[0] == key
    end
    nil
  end

  def remove(key)
    entry = lookup(key)
    @ivar.delete(entry) unless entry.nil?
    nil
  end

  def assign(key, value)
    entry = lookup(key)
    unless entry.nil?
      entry[1] = value
    else
      @ivar << [key, value]
    end
    lookup(key)
  end

  def show
    @ivar
  end
end
