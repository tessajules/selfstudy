# reverse the words in place

# 'cake pound steal' => 'steal pound cake'

# https://www.interviewcake.com/question/ruby/reverse-words?section=array-and-string-manipulation&course=fc1

# O(n) time, O(n) space
def reverse_words(words_string)
  reversed = []
  words_string.split(' ').each do |word|
    reversed = [word] + reversed
  end

  p reversed.join(' ')
end

# reverse_words('one two three')
# reverse_words('cake pound steal')

# O(n) time, O(1) space
def reverse_words(words_string)
  left_index = 0
  right_index = words_string.length - 1

  while left_index < right_index
    left_char = words_string[left_index]
    words_string[left_index] = words_string[right_index]
    words_string[right_index] = left_char

    left_index += 1
    right_index -= 1
  end

  left_index = 0
  right_index = 0
  moving_index = 0
  while moving_index < words_string.length
    if words_string[moving_index] == ' ' || moving_index == words_string.length - 1
      right_index = words_string[moving_index] == ' ' ? moving_index - 1 : moving_index
      while left_index < right_index
        left_char = words_string[left_index]
        words_string[left_index] = words_string[right_index]
        words_string[right_index] = left_char

        left_index += 1
        right_index -= 1
      end

      left_index = moving_index + 1
      right_index = 0
    end
    moving_index += 1
  end

  p words_string
end

reverse_words('one two three four five six seven eight')
reverse_words('cake pound steal')
