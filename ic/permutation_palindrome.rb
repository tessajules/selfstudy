# https://www.interviewcake.com/question/ruby/permutation-palindrome?section=hashing-and-hash-tables&course=fc1

# Determine if any permutation of the input string is a palindrome

# # brute force approach - is buggy
# def permutation_is_palindrome?(str)
#   return true if is_palindrome?(str)
#
#   # first figure out how many permutations can exist for the input string
#   num_possible_permutations = 1
#   Array(1..str.length).each do |i|
#      # factorial of the length of the str is the # of possible permutations
#     num_possible_permutations = num_possible_permutations * i
#   end
#
#   # figure out all permutations of the string
#   seen_permuatations = {
#     str => true
#   }
#
#   pointer_index = 0
#
#   while seen_permuatations.length < num_possible_permutations
#     p seen_permuatations.length, num_possible_permutations
#     current_char = str[pointer_index]
#     str[pointer_index] = str[pointer_index+1]
#     str[pointer_index+1] = current_char
#
#     return true if is_palindrome?(str)
#
#     seen_permuatations[str] = true
#     if pointer_index+1 == str.length - 1
#       pointer_index = 0
#     else
#       pointer_index += 1
#     end
#
#   end
#
#   return false
# end

def is_palindrome?(str)
  left_i = 0
  right_i = str.length-1

  while left_i < right_i
    return false if str[left_i] != str[right_i]
    left_i += 1
    right_i -= 1
  end

  return true
end

# better solution, O(n) time & space
def permutation_is_palindrome?(str)
  char_count = {}
  pointer = 0
  while pointer < str.length
    char_count[str[pointer]] = 0 unless char_count[str[pointer]]
    char_count[str[pointer]] += 1
    pointer += 1
  end

  single_char_exists = false
  char_count.each do |k,v|
    next if v % 2 == 0 # even number of char in the string
    return false if single_char_exists
    single_char_exists = true
  end
  return true
end


require 'set'

# different solution using sets
def permutation_is_palindrome?(str)
  odd_chars = Set.new
  pointer = 0
  while pointer < str.length
    if odd_chars.include? str[pointer]
      odd_chars.delete str[pointer]
    else
      odd_chars.add str[pointer]
    end

    pointer += 1
  end

  odd_chars.length <= 1
end


p permutation_is_palindrome?('ciillafc')
