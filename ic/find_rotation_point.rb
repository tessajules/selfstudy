# https://www.interviewcake.com/question/ruby/find-rotation-point?course=fc1&section=sorting-searching-logarithms

def find_rotation_point(words)
  first_value = words[0]

  return 0 if first_value < words[-1]
  
  # boundaries
  floor = 0
  ceiling = words.length - 1
  half_index = (ceiling - floor)/2

  loop do
    if words[half_index] > first_value # rotation_point is to the right
      floor = half_index
    elsif words[half_index] < words[half_index - 1] # we are at the rotation_point; return the current half_index
      return half_index
    elsif words[half_index] < first_value # rotation point is to the left
      ceiling = half_index
    end

    half_index = floor + (ceiling - floor)/2
  end
end

words = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage'
]

p find_rotation_point(words)

words = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'yetrograde',
    'yupplant',
    'zndulate',
    'zxenoepist',
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage'
]

p find_rotation_point(words)

words = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'yupplant',
    'zndulate',
    'zxenoepist',
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage'
]

p find_rotation_point(words)

words = [
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'yetrograde',
    'yupplant',
    'zndulate',
    'zxenoepist',
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'karpatka',
    'othellolagkage'
]

p find_rotation_point(words)

words = [
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'karpatka',
    'othellolagkage',
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'yetrograde',
    'yupplant',
    'zndulate',
    'zxenoepist'
]

p find_rotation_point(words)
