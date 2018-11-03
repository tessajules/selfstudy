# https://www.interviewcake.com/question/ruby/recursive-string-permutations?course=fc1&section=dynamic-programming-recursion

require 'set'

def get_permutations(str)
  # base case
  return Set.new([str]) if str.length <= 1

  # recursive case
  perm_all_but_last = get_permutations(str[0..-2])
  last_char = str[-1]

  permutations = Set.new
  perm_all_but_last.each do |permutation|
    (0..permutation.length).each do |i|
      permutations.add(permutation[0...i] + last_char + permutation[i..-1])
    end
  end

  permutations
end

p get_permutations('cat')
