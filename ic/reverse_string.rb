# reverse string in place
# https://www.interviewcake.com/question/ruby/reverse-string-in-place?course=fc1&section=array-and-string-manipulation

# O(n) time, O(n) space
def reverse_string_in_place(str)
  last_index = str.length # start off as one more than last index

  (0...str.length).each do |i|
    last_index = last_index - 1 # keep track of corresponding later char
    current_char = str[i]
    later_char = str[last_index]

    next if i == last_index || i < last_index

    # swap them in str
    str[i] = later_char
    str[last_index] = current_char
  end

  p str
end

# reverse_string_in_place('apple') # should be eppla
# reverse_string_in_place('banana') # should be ananab
# reverse_string_in_place('abba') # should be abba


# O(n) time, O(1) space
def reverse_string_in_place(str)
  beginning_index = 0
  last_index = str.length - 1


  while beginning_index < last_index
    current_char = str[beginning_index]
    later_char = str[last_index]

    # swap them in str
    str[beginning_index] = later_char
    str[last_index] = current_char

    last_index = last_index - 1
    beginning_index = beginning_index + 1
  end

  p str
end

reverse_string_in_place('apple') # should be eppla
reverse_string_in_place('banana') # should be ananab
reverse_string_in_place('abba') # should be abba
