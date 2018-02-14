require "rspec"
require "recursion"

#:O Bryan can use rspec
describe "sum_to" do
  describe "passes given tests" do
    it "sums 5" do
      expect(sum_to(5)).to eq(15)
    end
    it "sums 1" do
      expect(sum_to(1)).to eq(1)
    end
    it "sums 9" do
      expect(sum_to(9)).to eq(45)
    end
    it "returns nil on negative numbers" do
      expect(sum_to(-8)).to eq(nil)
    end
  end
end

describe "add_numbers" do
  describe "passes given tests" do
    it "adds positive numbers" do
      expect(add_numbers([1,2,3,4])).to eq(10)
    end
    it "adds a single element array" do
      expect(add_numbers([3])).to eq(3)
    end
    it "works on arrays with negative numbers" do
      expect(add_numbers([-80,34,7])).to eq(-39)
    end
    it "works on empty arrays" do
      expect(add_numbers([])).to eq(nil)
    end
  end
end

describe "gamma_function" do
  describe "passes given tests" do
    it "returns nil for negative factorials" do
      expect(gamma_fnc(0)).to eq(nil)
    end
    it "works for the base case" do
      expect(gamma_fnc(1)).to eq(1)
    end
    it "works for 4" do
      expect(gamma_fnc(4)).to eq(6)
    end
    it "works for slighly larger values" do
      expect(gamma_fnc(8)).to eq(5040)
    end
  end
end

describe "ice_cream_shop" do
  describe "passes given tests" do
    it "returns false if desired flavour isn't in the selection" do
      expect(ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')).to eq(false)
    end
    it "returns true if desired flavour is in the selection" do
      expect(ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')).to eq(true)
    end
    it "returns false if desired flavour isn't in the selection" do
      expect(ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')).to eq(false)
    end
    it "returns true if desired flavour is the only flavour in the selection" do
      expect(ice_cream_shop(['moose tracks'], 'moose tracks')).to eq(true)
    end
    it "returns false if the selection is empty" do
      expect(ice_cream_shop([], 'honey lavender')).to eq(false)
    end
    
  end
end

describe "reverse" do
  describe "passes given tests" do
    it "reverses house" do
      expect(reverse("house")).to eq("esuoh")
    end
    it "reverses dog" do
      expect(reverse("dog")).to eq("god")
    end
    it "reverses atom" do
      expect(reverse("atom")).to eq("mota")
    end
    it "reverses q" do
      expect(reverse("q")).to eq("q")
    end
    it "reverses id" do
      expect(reverse("id")).to eq("di")
    end
    it "reverses an empty string" do
      expect(reverse("")).to eq("")
    end
  end
end
