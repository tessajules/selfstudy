def num_steps_to_1(n)
  # base case
  return 0 if n == 1

  # recursive cases
  if n % 2 == 0
    return 1 + num_steps_to_1(n/2)
  else
    return 1 + num_steps_to_1(3*n + 1)
  end
end

p num_steps_to_1(1)
p num_steps_to_1(2)
p num_steps_to_1(3)
p num_steps_to_1(4)
p num_steps_to_1(5)
p num_steps_to_1(6)
p num_steps_to_1(7)
p num_steps_to_1(8)
p num_steps_to_1(15)
