require 'rspec'
require 'octopi'
require_relative 'octopi_runtime_testers.rb'

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
