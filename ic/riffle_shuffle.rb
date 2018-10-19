# https://www.interviewcake.com/question/ruby/single-riffle-check?section=array-and-string-manipulation&course=fc1

# Determine if shuffled cards are product of single riffle

def single_riffle?(shuffled_deck)
  # if product of a single riffle, then either
  # - the bottom of the shuffled deck should be the same as the bottom of the first or second half of an unshuffled deck
  unshuffled_deck_first_half = Array(1..26)
  unshuffled_deck_second_half = Array(27..52)

  while shuffled_deck.length > 0
    if shuffled_deck[shuffled_deck.length-1] == unshuffled_deck_first_half[unshuffled_deck_first_half.length-1]
      unshuffled_deck_first_half.pop(1)
      shuffled_deck.pop(1)
      next
    elsif shuffled_deck[shuffled_deck.length-1] == unshuffled_deck_second_half[unshuffled_deck_second_half.length-1]
      unshuffled_deck_second_half.pop(1)
      shuffled_deck.pop(1)
      next
    end
    return false

  return true
end
p single_riffle?(Array(1..52))
