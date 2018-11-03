# https://www.interviewcake.com/question/ruby/nth-fibonacci?course=fc1&section=dynamic-programming-recursion
def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  num_before_last = 0
  last_num = 1

  fib_num = 0

  m = 2

  while m <= n
    fib_num = num_before_last + last_num
    num_before_last = last_num
    last_num = fib_num
    m += 1
  end

  fib_num
end
p fib(0)  # => 0
p fib(1)  # => 1
p fib(2)  # => 1
p fib(3)  # => 2
p fib(4)  # => 3
p fib(5)  # => 5
p fib(6)  # => 8
p fib(7)  # => 13
p fib(8)  # => 21
p fib(9)  # => 34
p fib(10)  # => 55
