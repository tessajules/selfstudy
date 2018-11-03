# https://www.interviewcake.com/question/ruby/product-of-other-numbers?section=greedy&course=fc1

# with division
def get_products_of_all_ints_except_at_index(nums)
  prods = [1] * nums.length
  full_product = 1
  index_with_0 = nil

  nums.each_with_index do |num, i|
    if num == 0
      return [0] * nums.length if !index_with_0.nil? # there are two zeroes in arr, so all products are 0
      index_with_0 = i
      next
    end

    full_product = full_product * num
  end

  if !index_with_0.nil?
    arr_of_0s = [0] * nums.length
    arr_of_0s[index_with_0] = full_product
    return arr_of_0s
  end

  nums.map { |num| full_product / num }
end

# without division, brute force O(n^2)
def get_products_of_all_ints_except_at_index(nums)
  prods = []

  nums.each_with_index do |num1, i|
    prod = 1
    nums.each_with_index do |num2, j|
      next if i == j
      prod = prod * num2
    end

    prods[i] = prod
  end

  prods
end

# without division, O(2n) time and O(3n) space
def get_products_of_all_ints_except_at_index(nums)
  raise 'input must be array of two ints or more' unless nums.length > 1

  # walk forward over nums and store product before i in prods_from_left
  left_i = 0
  last_prod_on_left = 1
  prods_from_left = [1] * nums.length

  # walk backward over nums and store product after i in prods_from_right
  right_i = nums.length - 1
  last_prod_on_right = 1
  prods_from_right = [1] * nums.length

  while left_i < nums.length
    left_num = nums[left_i]
    right_num = nums[right_i]

    if left_i == 0
      last_prod_on_left = left_num
      last_prod_on_right = right_num
      left_i += 1
      right_i -= 1
      next
    end

    prods_from_left[left_i] = last_prod_on_left
    last_prod_on_left = last_prod_on_left * left_num

    prods_from_right[right_i] = last_prod_on_right
    last_prod_on_right = last_prod_on_right * right_num

    left_i += 1
    right_i -= 1
  end

  # create new array with products except at the current index
  # by multiplying value of prods_from_left and prods_from_right at the current index
  prods_except_at_index = [1] * nums.length
  prods_from_left.each_with_index do |prod_from_left, i|
    prods_except_at_index[i] = prod_from_left * prods_from_right[i]
  end

  prods_except_at_index
end

# without division, O(2n) time and O(n) space
def get_products_of_all_ints_except_at_index(nums)
  raise 'input must be array of two ints or more' unless nums.length > 1

  # walk forward over nums and store last_prod_on_left at current index of prods_except_at_index,
  # then calculate the new last_prod_on_left using current num
  left_i = 0
  last_prod_on_left = 1

  prods_except_at_index = [1] * nums.length

  # multiply running values of prods left of current index
  while left_i < nums.length
    left_num = nums[left_i]

    if left_i == 0
      last_prod_on_left = left_num
      left_i += 1
      next
    end

    prods_except_at_index[left_i] = last_prod_on_left
    last_prod_on_left = last_prod_on_left * left_num

    left_i += 1
  end

  # walk backward over nums and store last_prod_on_right at current index of prods_except_at_index
  # then calculate the new last_prod_on_right using current num
  # at the same time, multiply prods_except_at_index value at current index by the last prod_on_right
  # which will give you the product of all other numbers except that current index
  right_i = nums.length - 1
  last_prod_on_right = 1
  while right_i >= 0
    right_num = nums[right_i]

    if right_i == nums.length - 1
      last_prod_on_right = right_num
      right_i -= 1
      next
    end

    prods_except_at_index[right_i] = last_prod_on_right * prods_except_at_index[right_i]
    last_prod_on_right = last_prod_on_right * right_num

    right_i -= 1
  end

  prods_except_at_index
end

# tests

def run_tests
  desc = 'short array'
  actual = get_products_of_all_ints_except_at_index([1, 2, 3])
  expected = [6, 3, 2]
  assert_equal(actual, expected, desc)

  desc = 'longer array'
  actual = get_products_of_all_ints_except_at_index([8, 2, 4, 3, 1, 5])
  expected = [120, 480, 240, 320, 960, 192]
  assert_equal(actual, expected, desc)

  desc = 'array has one zero'
  actual = get_products_of_all_ints_except_at_index([6, 2, 0, 3])
  expected = [0, 0, 36, 0]
  assert_equal(actual, expected, desc)

  desc = 'array has two zeros'
  actual = get_products_of_all_ints_except_at_index([4, 0, 9, 1, 0])
  expected = [0, 0, 0, 0, 0]
  assert_equal(actual, expected, desc)

  desc = 'one negative number'
  actual = get_products_of_all_ints_except_at_index([-3, 8, 4])
  expected = [32, -12, -24]
  assert_equal(actual, expected, desc)

  desc = 'all negative numbers'
  actual = get_products_of_all_ints_except_at_index([-7, -1, -4, -2])
  expected = [-8, -56, -14, -28]
  assert_equal(actual, expected, desc)

  desc = 'error with empty array'
  assert_raises(desc) {
    get_products_of_all_ints_except_at_index([])
  }

  desc = 'error with one number'
  assert_raises(desc) {
    get_products_of_all_ints_except_at_index([1])
  }
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

def assert_raises(desc)
  begin
    yield
    puts "#{desc} ... FAIL"
  rescue
    puts "#{desc} ... PASS"
  end
end

run_tests()
