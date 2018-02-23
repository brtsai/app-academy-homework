require 'rspec'
require 'lru_cache.rb'

RSpec.describe LRUCache do
  subject(:cache) { LRUCache.new(4) }

  describe "#count" do

    context "when the cache is empty" do
      it "returns the number of items in the LRU Cache" do
        expect(cache.count).to be(0)
      end
    end

    context "when the cache has something in it" do
      it "returns the number of items in the LRU Cache" do
        allow(cache.cache).to receive(:count) {1}
        expect(cache.count).to be(1)
      end
    end
  end 

  

end
