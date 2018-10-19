# https://www.interviewcake.com/question/ruby/top-scores?section=hashing-and-hash-tables&course=fc1
# given a highest score, sort an array of ints lowest to highest in less than O(nlgn) time

unsorted_scores = [37, 89, 41, 65, 91, 53]
HIGHEST_POSSIBLE_SCORE = 100

# O(n) space/time with hash
def sort_scores_hash(unsorted_scores, highest_possible_score)
  score_counts = {}
  unsorted_scores.each do |score|
    score_counts[score] = 0 unless score_counts[score]
    score_counts[score] += 1
  end

  sorted_scores = []
  i = HIGHEST_POSSIBLE_SCORE
  while i >= 0
    unless score_counts[i]
      i = i - 1
      next
    end

    score_counts[i].times { sorted_scores << i }
    i = i - 1
  end

  sorted_scores
end


p sort_scores_hash([37, 89, 91, 41, 65, 91, 91, 53], HIGHEST_POSSIBLE_SCORE) # should return [91, 89, 65, 53, 41, 37]

# O(n) space/time with array
def sort_scores_arr(unsorted_scores, highest_possible_score)
  score_counts = [0] * (highest_possible_score + 1)

  unsorted_scores.each do |score|
    score_counts[score] += 1
  end

  sorted_scores = []

  i = HIGHEST_POSSIBLE_SCORE

  while i >= 0
    count = score_counts[i]
    unless count > 0
      i = i - 1
    end
    count.time { sorted_scores << i }
    i = i - 1
  end

  sorted_scores
end

p sort_scores_arr([37, 89, 91, 41, 65, 91, 91, 53], HIGHEST_POSSIBLE_SCORE) # should return [91, 89, 65, 53, 41, 37]
