# What is the runtime of the below code?
def foo(int_arr)
  sum = 0
  product = 1

  (0...int_arr.length).each do |i|
    product *= int_arr[i]
  end

  p "#{sum}, #{product}"
end

foo([1,2])

# Answer: O(N) - the fact that we iterate twice through the array doesn't matter
