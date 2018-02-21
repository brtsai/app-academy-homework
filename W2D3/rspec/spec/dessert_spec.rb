require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "chef", :titleize => "Walter White") }
  let(:d) { Dessert.new("Cake", 1, chef) }
  describe "#initialize" do
    it "sets a type" do
      expect(d.type).to eq("Cake")
    end

    it "sets a quantity" do
      expect(d.quantity).to eq(1)
    end


    it "starts ingredients as an empty array" do
      expect(d.ingredients).to eq([])
    end


    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("Cake", "1", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      d.add_ingredient("crack")
      expect(d.ingredients).to eq(["crack"])
    end
  end

  describe "#mix!" do
  it "shuffles the ingredient array" do
      ingredients = ["ephedrine", "pseudoephedrine", "red phosphorus",
      "hydriodic acid", "lye", "Hydrogen chloride"]
      ingredients.each do |ingredient|
        d.add_ingredient(ingredient)
      end
      d.mix!
      expect(d.ingredients).not_to eq(ingredients)
      expect(d.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      d.eat(1)
      expect(d.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ d.eat(2) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(d.serve.include?("Walter White")).to eq(true)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(d)
      d.make_more
    end
  end
end
