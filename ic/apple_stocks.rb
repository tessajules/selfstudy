# https://www.interviewcake.com/question/ruby/stock-price?section=greedy&course=fc1

def get_max_profit(stocks)
  buy = stocks[0]
  sell = stocks[1]
  sell_index = 1

  # find highest possible sell price, while keeping track of the lowest price to the left of it
  stocks.each_with_index do |stock, i|
    next if i == 0 || i == 1 # skip first two since already assigned
    if stock > sell
      sell = stock
      sell_index = i
    end
  end

  # find lowest possible buy price, which is the lowest price left of the sell price
  stocks.each_with_index do |stock, i|
    break if i == sell_index
    buy = stock if stock < buy
  end

  sell - buy
end

# try in one iteration
def get_max_profit(stocks)
  min_price = stocks[0]
  biggest_diff = stocks[1] - min_price

  # keep track of biggest difference, and smallest price
  stocks.each_with_index do |stock, i|
    next if i == 0 # skip first
    curr_diff = stock - min_price
    biggest_diff = curr_diff if curr_diff > biggest_diff

    min_price = stock if stock < min_price
  end

  biggest_diff
end


# tests

def run_tests
  desc = 'price goes up then down'
  actual = get_max_profit([1, 5, 3, 2])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'price goes down then up'
  actual = get_max_profit([7, 2, 8, 9])
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'price goes up all day'
  actual = get_max_profit([1, 6, 7, 9])
  expected = 8
  assert_equal(actual, expected, desc)

  desc = 'price goes down all day'
  actual = get_max_profit([9, 7, 4, 1])
  expected = -2
  assert_equal(actual, expected, desc)

  desc = 'price stays the same all day'
  actual = get_max_profit([1, 1, 1, 1])
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'error with empty prices'
  assert_raises(desc) {
    get_max_profit([])
  }

  desc = 'error with one price'
  assert_raises(desc) {
    get_max_profit([1])
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
