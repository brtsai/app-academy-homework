require 'doubly_linked_list'

class LRUCache
    attr_reader :cache, :size, :lru_list

    def initialize(size = 10)
      @size = size
      @cache = {}
      @lru_list = DoublyLinkedList.new
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      node = Node.new
      @cache[el] = {:el => el, :node => node}
    end

    def show
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

end
