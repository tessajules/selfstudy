# https://www.interviewcake.com/question/ruby/coin?course=fc1&section=dynamic-programming-recursion

def num_combos(num, denominations)
  p num, denominations
  # base case
  return 0 if denominations.empty?

  running_sum = 0
  (0..num).each do |n|
    if running_sum + denominations[0] < num
      running_sum += denominations[0]
      return num_combos(num, denominations[1..-1])
    elsif running_sum == num
      return 1
    else
      return 0
    end
  end
end

p num_combos(4, [3,2,1])
