# https://www.interviewcake.com/question/ruby/highest-product-of-3?section=greedy&course=fc1

def highest_product_of_3(nums)
  largest_three_positives = []
  smallest_two_negatives = []

  nums.each_with_index do |num|
    if num > 0
      if largest_three_positives.length < 3
        largest_three_positives << num
      else
        largest_three_positives = [largest_three_positives[0], largest_three_positives[1], largest_three_positives[2], num].sort.reverse[0..-2]
      end
      next
    end

    if num < 0
      if smallest_two_negatives.length < 2
        smallest_two_negatives << num
      else
        smallest_two_negatives = [smallest_two_negatives[0], smallest_two_negatives[1], num].sort[0..-2]
      end
      next
    end
  end

  largest_product = largest_three_positives[0] * largest_three_positives[1] * largest_three_positives[2]

  if smallest_two_negatives.length == 2
    prod_of_negs = smallest_two_negatives[0] * smallest_two_negatives[1]
    largest_three_positives.each do |n|
      current_prod = prod_of_negs * n
      largest_product = current_prod if current_prod > largest_product
    end
  end

  largest_product
end

# tests

def run_tests
  desc = 'two negatives should be part of highest product'
  actual = highest_product_of_3([1, 10, -5, 1, -100])
  expected = 5000
  assert_equal(actual, expected, desc)


  desc = 'three positives should be part of highest product'
  actual = highest_product_of_3([1, 10, -5, 1, 100])
  expected = 1000
  assert_equal(actual, expected, desc)

  desc = 'two negatives should be part of highest product'
  actual = highest_product_of_3([-10, -10, 1, 3, 2])
  expected = 300
  assert_equal(actual, expected, desc)

  desc = 'two negatives should be part of highest product'
  actual = highest_product_of_3([-10, -1000000000000000, 1, 3, 2])
  expected = 30000000000000000
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

run_tests()
