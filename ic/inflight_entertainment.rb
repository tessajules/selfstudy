# brute force - time: O(n^2), space: O(1)
def fits?(flight_length, movie_lengths)
  movie_lengths.each_with_index do |_, i|
    movie_lengths.each_with_index do |_, j|
      next if i == j
      return true if movie_lengths[i] + movie_lengths[j] == flight_length
    end
  end
  return false
end

p 'solution 1'
p fits?(5, [4,1]) # true
p fits?(5, [3,1]) # false
p fits?(5, [0,1]) # false

# time: O(n), space: O(n)
def fits?(flight_length, movie_lengths)
  seen_lengths = {}
  movie_lengths.each do |movie_length|
    diff = flight_length - movie_length
    return true if seen_lengths[diff]
    seen_lengths[movie_length] = true
  end
  false
end

p 'solution 2'
p fits?(5, [4,1]) # true
p fits?(5, [3,1]) # false
p fits?(5, [0,1]) # false

# BONUS 1

# What if we wanted the movie lengths to sum to something close to the flight length (say, within 20 minutes)?
def fits?(flight_length, buffer, movie_lengths)
  seen_lengths = {}
  acceptable_flight_lengths = Array((flight_length - buffer)...(flight_length+buffer+1))
  movie_lengths.each do |movie_length|
    acceptable_flight_lengths.each do |flight_length|
      diff = flight_length - movie_length
      return true if seen_lengths[diff]
      seen_lengths[movie_length] = true
    end
  end
  false
end

p 'BONUS 1 solution 1'
p fits?(10, 2, [4,1]) # false
p fits?(10, 2, [3,1]) # false
p fits?(10, 2, [0,10]) # true
p fits?(10, 2, [3,10]) # false
p fits?(10, 2, [3,9]) # true
