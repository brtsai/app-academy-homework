require 'rspec'
require 'doubly_linked_list.rb'

RSpec.describe Node do
  describe "#initialize" do
    it "Sets the value of the node" do
      test_val = "value"
      node = Node.new(:value => test_val)
      expect(node.value).to be(test_val)
    end

    context "When given a left link" do
      it "Sets the left link of the node" do
        left_node = Node.new
        node = Node.new({:left => left_node})
        expect(node.left).to be(left_node)
      end
    end

    context "When given a left link" do
      it "Sets the left link of the node" do
        mock_node = double("Node", :class => Node.class)
        node = Node.new(:left =>  mock_node)
        expect(node.left).to be(mock_node)
      end

      it "Raises an error if the left link isn't a Node" do
        expect do
          Node.new(:left => "not a node")
        end.to raise_error("Left link is not a node")

      end
    end
    
    context "When given a right link" do
      it "Sets the right link of the node" do
        mock_node = double("Node", :class => Node)
        node = Node.new(:right =>  mock_node)
        expect(node.right).to be(mock_node)
      end

      it "Raises an error if the left link isn't a Node" do
        expect do
          Node.new(:right => "not a node")
        end.to raise_error("Right link is not a node")
      end
    end

  end


end

RSpec.describe DoublyLinkedList do
  


end
