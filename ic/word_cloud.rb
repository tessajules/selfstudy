# https://www.interviewcake.com/question/ruby/word-cloud?section=hashing-and-hash-tables&course=fc1

class WordCloud
  ALPHABET = alphabet = {
    'a' => 'a',
    'b' => 'b',
    'c' => 'c',
    'd' => 'd',
    'e' => 'e',
    'f' => 'f',
    'g' => 'g',
    'h' => 'h',
    'i' => 'i',
    'j' => 'j',
    'k' => 'k',
    'l' => 'l',
    'm' => 'm',
    'n' => 'n',
    'o' => 'o',
    'p' => 'p',
    'q' => 'q',
    'r' => 'r',
    's' => 's',
    't' => 't',
    'u' => 'u',
    'v' => 'v',
    'w' => 'w',
    'x' => 'x',
    'y' => 'y',
    'z' => 'z',
    'A' => 'a',
    'B' => 'b',
    'C' => 'c',
    'D' => 'd',
    'E' => 'e',
    'F' => 'f',
    'G' => 'g',
    'H' => 'h',
    'I' => 'i',
    'J' => 'j',
    'K' => 'k',
    'L' => 'l',
    'M' => 'm',
    'N' => 'n',
    'O' => 'o',
    'P' => 'p',
    'Q' => 'q',
    'R' => 'r',
    'S' => 's',
    'T' => 't',
    'U' => 'u',
    'V' => 'v',
    'W' => 'w',
    'X' => 'x',
    'Y' => 'y',
    'Z' => 'z',
    "'" => "'",
  }

  def initialize(sentence)
    @sentence = sentence
    @cloud = generate
  end

  def to_h
    @cloud
  end

  def generate
    cloud = {}
    current_word = ''
    last_char = ''
    i = 0

    while i < @sentence.length
      char = @sentence[i]

      unless ALPHABET[char]
        last_char = char
        i += 1
        next
      end

      if ALPHABET[last_char].nil? && i != 0
        cloud[current_word] = 0 unless cloud[current_word]
        cloud[current_word] += 1
        current_word = ''
      end

      current_word += ALPHABET[char]

      last_char = char
      i += 1
    end

    cloud[current_word] = 0 unless cloud[current_word]
    cloud[current_word] += 1

    cloud
  end
end

p WordCloud.new('After beating the eggs, Dana read the next step:').to_h
p WordCloud.new("We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake.").to_h
p WordCloud.new("The bill came to five dollars.").to_h
