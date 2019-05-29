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

  describe "#my_count" do
    it "counts elements of array" do
      expect([0,4,5].count).to eql(3)
    end
    it "counts elements of array that satisfy condition" do
      expect([0,4,5].count {|x| x > 4 }).to eql(1)
    end
  end

  describe "#my_map" do
    it "returns updated array based on operation" do
      expect([0,4,5].my_map{|x| x*3}).to eql([0,12,15])
    end
  end

  describe "#my_inject" do
    it "returns sum of array" do
      expect([9,4,5].my_inject{|prev, cur| prev+cur}).to eql(18)
    end

    it "returns product of array" do
      expect([2,4,5].my_inject{|prev, cur| prev*cur}).to eql(40)
    end
  end

end
