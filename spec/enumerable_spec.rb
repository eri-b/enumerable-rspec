require_relative '../lib/enumerable'

RSpec.describe Enumerable do
  describe "#my_each" do
    let(:arr) {[1,2,3,4,5]}
    it "cycles through an array and returns itself" do
      output = arr.my_each {|x| 2*x}
      result = arr.each {|x| 2*x}
      expect(output).to eql(result)
    end
  end

  describe "#my_select" do
    let(:arr) {[1,2,3,4,5]}
    it "selects portion of array based on condition" do
      output = arr.my_select {|x| x > 2}
      result = arr.select {|x| x > 2}
      expect(output).to eql(result)
      # expect([0,4,5].my_select {|x| x>2}).to eql([4,5])
    end
  end

  describe "#my_all?" do
    let(:arr) {[1,2,3,4,5]}
    it "returns true if all values of array pass condition" do
      output = arr.my_all? {|x| x > 0}
      result = arr.all? {|x| x > 0}
      expect(output).to eql(result)
      # expect([3,4,5].my_all? {|x| x>2}).to eql(true)
    end
    it "returns false if one value of array fails condition" do
      output = arr.my_all? {|x| x > 2}
      result = arr.all? {|x| x > 2}
      expect(output).to eql(result)
      # expect([1,4,5].my_all? {|x| x>2}).to eql(false)
    end
  end

  describe "#my_count" do
    let(:arr) {[1,2,3,4,5]}
    it "counts elements of array" do
      output = arr.my_count
      result = arr.count
      expect(output).to eql(result)
      # expect([0,4,5].count).to eql(3)
    end
    it "counts elements of array that satisfy condition" do
      output = arr.my_count {|x| x > 2}
      result = arr.count {|x| x > 2}
      expect(output).to eql(result)
      # expect([0,4,5].count {|x| x > 4 }).to eql(1)
    end
  end

  describe "#my_map" do
    let(:arr) {[1,2,3,4,5]}
    it "returns updated array based on operation" do
      output = arr.my_map {|x| x * 2}
      result = arr.map {|x| x * 2}
      expect(output).to eql(result)
      # expect([0,4,5].my_map{|x| x*3}).to eql([0,12,15])
    end
  end

  describe "#my_inject" do
    let(:arr) {[1,2,3,4,5]}
    it "returns sum of array" do
      output = arr.my_inject {|prev, cur| prev + cur}
      result = arr.inject {|prev, cur| prev + cur}
      # expect([9,4,5].my_inject{|prev, cur| prev+cur}).to eql(18)
    end

    it "returns product of array" do
      output = arr.my_inject {|prev, cur| prev * cur}
      result = arr.inject {|prev, cur| prev * cur}
      # expect([2,4,5].my_inject{|prev, cur| prev*cur}).to eql(40)
    end
  end

end
