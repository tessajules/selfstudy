# reverse string
# https://www.interviewcake.com/question/ruby/reverse-string-in-place?course=fc1&section=array-and-string-manipulation

# O(n) time, O(n) space
def reverse_string(str)
  reversed_str = ''
  str.each do |char|
    reversed_str = char + reversed_str
  end
end

p reverse_string('apple') # should be eppla
p reverse_string('banana') # should be ananab
p reverse_string('abba') # should be abba
