# https://www.interviewcake.com/question/ruby/nth-fibonacci?course=fc1&section=dynamic-programming-recursion
class Fib
  def fib(n)
    # base cases
    return 0 if n == 0
    return 1 if n == 1
    # recursive case, memoized
    @already_summed[n-1] ||= fib(n - 1)
    @already_summed[n-2] ||= fib(n - 2)
    @already_summed[n-1] + @already_summed[n-2]
  end

  def initialize(n)
    @already_summed = {}
    @f = fib(n)
  end

  def num
    @f
  end
end

p Fib.new(0).num  # => 0
p Fib.new(1).num  # => 1
p Fib.new(2).num  # => 1
p Fib.new(3).num  # => 2
p Fib.new(4).num  # => 3
p Fib.new(5).num  # => 5
p Fib.new(6).num  # => 8
p Fib.new(7).num  # => 13
p Fib.new(8).num  # => 21
p Fib.new(9).num  # => 34
p Fib.new(10).num  # => 55
