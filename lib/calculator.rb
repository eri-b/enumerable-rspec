class Calculator
  def add(*a)
    a.inject(0){|sum,x| sum + x }
  end

  def multiply(*a)
    a.inject(1){|product,x| product*x }
  end
end
