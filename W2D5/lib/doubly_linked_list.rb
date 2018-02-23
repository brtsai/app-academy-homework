class DoublyLinkedList
  attr_reader :front, :back

  def initialize
    @front = nil
    @back = nil
  end

  def push(el)
    node = Node.new(:value => el)

    if empty?
      @front = node
    else
      @back.right = node
    end
    @back = node

    node
  end

  def shift
    raise "List is empty" if empty?
    first = @front
    next_node = @front.right
    unless next_node.nil?
      next_node.left = nil
    else #There was only 1 element in the list
      @back = next_node
    end
    @front = next_node
  end

  def delete(node)
    node.suicide!
  end

  def empty?
    front.nil? && back.nil?
  end

  def count
    count = 0
    curr = front
    until curr.nil?
      curr = curr.right
      count += 1
    end
    count
  end
end

class Node
  attr_accessor :left, :right, :value
  
  def initialize(init_hash)
    @value = init_hash[:value]
    @left = init_hash[:left]
    @right = init_hash[:right]
    unless left.nil?
      raise "Left link is not a node" unless left.is_a?(Node)
    end
    unless right.nil?
      raise "Right link is not a node" unless right.is_a?(Node)
    end
  end

  def suicide!
    unless @right.nil?
      @right.left = @left
    end
    unless @left.nil?
      @left.right = @right
    end
  end
end
