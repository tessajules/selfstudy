# https://www.interviewcake.com/question/ruby/shuffle?section=greedy&course=fc1

def shuffle_not_in_place(nums)
  shuffled = []

  while nums.length > 0
    rand_i = rand(0..nums.length-1)
    p rand_i
    shuffled << nums[rand_i]
    nums.delete_at(rand_i)
  end

  shuffled
end

# p shuffle_not_in_place([0,1,2,3])
# p shuffle_not_in_place([0,1,2])

def shuffle_in_place(nums)
  prepended_count = 0

  while prepended_count < nums.length
    rand_i = rand(prepended_count..nums.length-1)
    num_to_prepend = nums[rand_i]
    nums.delete_at(rand_i)
    nums.insert(prepended_count, num_to_prepend)
    prepended_count += 1
  end

  nums
end

p shuffle_in_place([0,1,2,3])
p shuffle_in_place([0,1,2])
