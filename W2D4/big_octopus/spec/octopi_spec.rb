require 'rspec'
require 'octopi'

def get_fishes(amount)
  fishes = []

  (0...amount).each do |i|
    fish = "f"
    (0..i).each { |unused| fish << "i" }
    fish << "sh"
    fishes << fish
  end

  fishes
end

def simulate_o_n_time(n)
  hundred_fishes = get_fishes(100)
  start_time = Time.now
  dummy = "0"
  hundred_fishes.each { |fish| fish == dummy }
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def runtime_with_n_fishes(n, &prc)
  fishes = get_fishes(n)
  start_time = Time.now
  prc.call(fishes)
  end_time = Time.now
  
  end_time - start_time
end



describe "Octopi" do
  let (:fishes) { ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] }
  
  describe "#clever_octopus" do
    it "finds the longest fish" do
      expect(clever_octopus(fishes)).to eq('fiiiissshhhhhh')
    end
    context "for 10 fishes" do
      it "finds the longest fish in O(n) time" do
        linear_run_time = simulate_o_n_time(10)
        clever_proc = method(:clever_octopus)
        clever_run_time = runtime_with_n_fishes(10, &clever_proc)
        expect(clever_run_time).to be < linear_run_time
      end
    end

    context "for a hundred fishes" do
      it "finds the longest fish in O(n) time" do
        linear_run_time = simulate_o_n_time(100)
        expect(clever_run_time).to be < linear_run_time
      end
    end

    context "for a thousand fishes" do
      it "finds the longest fish in O(n) time" do
        linear_run_time = simulate_o_n_time(1000)
        
        start_time = Time.now
        clever_octopus(thousands_of_fishes)
        end_time = Time.now
        clever_run_time = end_time - start_time

        expect(clever_run_time).to be < linear_run_time
      end
    end
  end

  describe "#dominant_octopus" do
    
    it "finds the longest fish" do
      expect(clever_octopus(fishes)).to eq('fiiiissshhhhhh')
    end
    context "for a small set of fishes" do
      it "finds the longest fish in O(n) time" do
        start_time = Time.now
        dummy = "0"
        fishes.each { |fish| fish == dummy }
        end_time = Time.now

        c = 2
        linear_run_time = c * (end_time - start_time)
        
        start_time = Time.now
        clever_octopus(fishes)
        end_time = Time.now
        clever_run_time = end_time - start_time

        expect(clever_run_time).to be < linear_run_time
      end
    end

    context "for a hundred fishes" do
      it "finds the longest fish in O(n) time" do
        hundred_fishes = get_fishes(100)
        start_time = Time.now
        dummy = "0"
        hundred_fishes.each { |fish| fish == dummy }
        end_time = Time.now

        c = 2
        linear_run_time = c * (end_time - start_time)
        
        start_time = Time.now
        clever_octopus(hundred_fishes)
        end_time = Time.now
        clever_run_time = end_time - start_time

        expect(clever_run_time).to be < linear_run_time
      end
    end

    context "for a thousand fishes" do
      it "finds the longest fish in O(nlog(n)) time" do
        thousands_of_fishes = get_fishes(1000)

        start_time = Time.now
        dummy = "0"
        thousands_of_fishes.each { |fish| fish == dummy }
        end_time = Time.now

        c = 2
        linear_run_time = c * (end_time - start_time)
        
        start_time = Time.now
        clever_octopus(thousands_of_fishes)
        end_time = Time.now
        clever_run_time = end_time - start_time

        expect(clever_run_time).to be < linear_run_time
      end
    end
  end

  describe "#sluggish_octopus" do
    

  end

end
