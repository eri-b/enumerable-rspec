module Enumerable

  def my_each
    for i in self do
      yield(i)
    end

    # original array
    self
  end

  def my_each_with_index
    for i in 0...self.length do
      yield(i, self[i])
    end

    # original array
    self
  end

  def my_select
    a = []
    self.my_each do |val|
      a.push(val) if yield(val)
    end

    # new array
    a
  end

  def my_all?
    a = []
    self.my_each do |val|
      a.push(val) if yield(val)
    end
    all = a.length == self.length

    # boolean
    all
  end

  def my_any?
    a = []
    self.my_each do |val|
      a.push(val) if yield(val)
    end
    any = a.length >= 1

    # boolean
    any
  end

  def my_none?
    a = []
    self.my_each do |val|
      a.push(val) if yield(val)
    end
    none = a.length == 0

    # boolean
    none
  end

  def my_count
    a = []
    self.my_each do |val|
      if block_given?
        a.push(val) if yield(val)
      else
        a.push(val)
      end
    end
    count = a.length

    # counts number that matches critera in block
    count
  end

  def my_map
    a = []
    self.my_each do |val|
      a.push(yield(val))
    end

    # returns updated array
    a
  end

  def my_inject
    prev = self[0]
    self.my_each_with_index do |i, val|
      next if i==0
      result = yield(prev, val)
      prev = result
    end

    #final result
    prev
  end

 end

# cannot be in enumerables module
 def multiply_els (arr)
   arr.my_inject do |prev,curr|
     prev * curr
   end
 end


# Tests

# 1
# puts [3,4,5].my_each {|x| x }

# 2
# puts [2,4,6].my_each_with_index { |index, value| }

# 3
# puts [3,6,9].my_select { |x| x > 4 }

# 4
# puts [3,6,9].my_all? { |x| x > 2 }

# 5
# puts [3,6,9].my_any? { |x| x > 5}

# 6
# puts [3,6,9].my_none? {|x| x > 10}

# 7
# puts [3,6,9].my_count {|x| x > 4}
# puts [3,6,9].my_count

#8
# puts [3,6,9].my_map {|x| x*2 }

# 9
# puts [3,14,12,4].my_inject {|prev, curr| prev + curr}

# 10
# puts multiply_els([2,4,5])

# 11
# my_proc = Proc.new do |x|
# x*6
# end
#
# puts [3,6,9].my_map(&my_proc)
