require './lib/enumerable'

RSpec.describe Enumerable do
  describe "#my_each" do
    it "cycles through an array and returns itself" do
      expect([0,4,5].my_each {|x| 2*x}).to eql([0,4,5])
    end
  end

  describe "#select" do
    it "selects portion of array based on condition" do
      expect([0,4,5].select {|x| x>2}).to eql([4,5])
    end
  end

  describe "#my_all?" do
    it "returns true if all values of array pass condition" do
      expect([3,4,5].my_all? {|x| x>2}).to eql(true)
    end
    it "returns false if one value of array fails condition" do
      expect([1,4,5].my_all? {|x| x>2}).to eql(false)
    end
  end

end
