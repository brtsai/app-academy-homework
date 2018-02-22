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
  fishes = get_fishes(n)

  start_time = Time.now
  fishes.each { |fish| fish.length == fish.length }
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def linear_runtime_with_sample?(n, &prc)
  linear_run_time = simulate_o_n_time(n)
  proc_run_time = runtime_with_n_fishes(n, &prc)
  proc_run_time < linear_run_time
end

def simulate_o_n_log_n_time(n)
  fishes = get_fishes(n)

  start_time = Time.now
  fishes.sort
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def n_log_n_runtime_with_sample?(n, &prc)
  n_log_n_run_time = simulate_o_n_log_n_time(n)
  proc_run_time = runtime_with_n_fishes(n, &prc)
  proc_run_time < n_log_n_run_time
end

def simulate_o_n_n_time(n)
  fishes = get_fishes(n)

  start_time = Time.now
  fishes.each do |fish|
    fishes.each do |other_fish|
      fish.length == other_fish.length
    end
  end
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def n_n_runtime_with_sample?(n, &prc)
  n_n_run_time = simulate_o_n_n_time(n)
  proc_run_time = runtime_with_n_fishes(n, &prc)
  proc_run_time < n_n_run_time
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
        clever_proc = method(:clever_octopus)
        expect(linear_runtime_with_sample?(10, &clever_proc)).to be(true)
      end
    end

    context "for a hundred fishes" do
      it "finds the longest fish in O(n) time" do
        clever_proc = method(:clever_octopus)
        expect(linear_runtime_with_sample?(100, &clever_proc)).to be(true)
      end
    end

    context "for a thousand fishes" do
      it "finds the longest fish in O(n) time" do
        clever_proc = method(:clever_octopus)
        expect(linear_runtime_with_sample?(1000, &clever_proc)).to be(true)
      end
    end

  end

  describe "#dominant_octopus" do
    
    it "finds the longest fish" do
      expect(dominant_octopus(fishes)).to eq('fiiiissshhhhhh')
    end
    context "for 10 fishes" do
      it "finds the longest fish in O(nlog(n)) time" do
        dom_proc = method(:dominant_octopus)
        expect(n_log_n_runtime_with_sample?(10, &dom_proc)).to be(true)
      end
    end

    context "for a hundred fishes" do
      it "finds the longest fish in O(nlog(n)) time" do
        dom_proc = method(:dominant_octopus)
        expect(n_log_n_runtime_with_sample?(100, &dom_proc)).to be(true)
      end
    end

    context "for a thousand fishes" do
      it "finds the longest fish in O(nlog(n)) time" do
        dom_proc = method(:dominant_octopus)
        expect(n_log_n_runtime_with_sample?(1000, &dom_proc)).to be(true)
      end
    end

  end

  describe "#sluggish_octopus" do

    it "finds the longest fish" do
      expect(sluggish_octopus(fishes)).to eq('fiiiissshhhhhh')
    end
    context "for 10 fishes" do
      it "finds the longest fish in O(n^2) time" do
        slug_proc = method(:sluggish_octopus)
        expect(n_n_runtime_with_sample?(10, &slug_proc)).to be(true)
      end
    end

    context "for a hundred fishes" do
      it "finds the longest fish in O(n^2) time" do
        slug_proc = method(:sluggish_octopus)
        expect(n_n_runtime_with_sample?(100, &slug_proc)).to be(true)
      end
    end

    context "for a thousand fishes" do
      it "finds the longest fish in O(n^2) time" do
        slug_proc = method(:sluggish_octopus)
        expect(n_n_runtime_with_sample?(1000, &slug_proc)).to be(true)
      end
    end

  end

end
