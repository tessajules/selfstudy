# https://www.interviewcake.com/question/ruby/find-duplicate-optimize-for-space?course=fc1&section=sorting-searching-logarithms

# O(1) space, O(n) time
def find_duplicate_space(nums)
  current_num = nums[0]

  loop do
    potential_duplicate = nums[current_num] # check the number at the index represented by the current_num
    return current_num if current_num == potential_duplicate # return the current_num if it matches the value at the index (is duplicate)
    nums[current_num] = current_num
    current_num = potential_duplicate
  end
end

# O(1) space, O(nlgn) time
def find_duplicate_space(nums)
  # sort nums first (lgn), then check for dups by iterate over (n)
  last_seen = 0
  nums.sort!.each do |num|
    return num if last_seen == num
    last_seen = num
  end
end

# TODO:  do this again - don't understand!!
# O(1) space, O(nlgn) time, do not destroy input
def find_duplicate_space(nums)
  floor = 0
  ceiling = nums.length - 1

  while floor < ceiling
    possible_distinct_count_first_half = 0
    possible_distinct_count_second_half = 0
    count_first_half = 0
    count_second_half = 0

    middle_i = floor + (ceiling - floor)

    (floor..middle_i-1).each do |i|
      possible_distinct_count_first_half += 1

      count_first_half += 1 if nums[i] >= nums[floor] && nums[i] <= nums[middle_i-1]
    end

    (middle_i..ceiling).each do |i|
      possible_distinct_count_second_half += 1
      count_second_half += 1 if nums[i] <= nums[ceiling] && nums[i] >= nums[middle_i]
    end

    if count_first_half > possible_distinct_count_first_half
      ceiling = middle_i
    elsif count_second_half < possible_distinct_count_second_half
      floor = middle_i
    end
  end

  return nums[floor]
end

p find_duplicate_space([2,7,9,4,3,7,8,1,9,5])
p find_duplicate_space([5,5,7,4,3,7,8,3,9,2])
p find_duplicate_space([8,6,7,3,4,4,4,8,6,2])
