# https://www.interviewcake.com/question/ruby/cake-thief?course=fc1&section=dynamic-programming-recursion

def max_haul(cakes, capacity, haul=0, max=0, last_value=0)
  if capacity < 0
    real_haul = haul - last_value
    return real_haul if real_haul > max
    return max
  end

  if capacity == 0
    return haul if haul > max
    return max
  end

  cakes.each do |cake|
    if cake[0] == 0
      next if cake[1] <= 0  # skip so we don't infinitely add this nonexistent cake
      return Float::INFINITY  # we have a cake with value we can add infinitely
    end
    max = max_haul(cakes, capacity - cake[0], haul + cake[1], max, cake[1])
  end

  max
end

p max_haul([[1,1]], 2) #2
p max_haul([[2, 1]], 9) #4
p max_haul([[4, 4], [5, 5]], 9) #9
p max_haul([[4, 4], [5, 5]], 12) #12
p max_haul([[2, 3], [3, 6], [5, 1], [6, 1], [7, 1], [8, 1]], 7) #12
p max_haul([[51, 52], [50, 50]], 100) #100
p max_haul([[0, 0], [2, 1]], 7) #3
p max_haul([[1, 2]], 0) #0
p max_haul([[0, 5]], 5) #infinity
