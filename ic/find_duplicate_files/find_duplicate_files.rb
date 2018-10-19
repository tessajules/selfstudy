# find duplicate files and return as array of path names with original, duplicate

def find_duplicates()
  # my strategy is to first traverse the file tree, then hash each file into a digest, store digests in a Set,
  # then add to array of duplicates if digest already in set

  Dir['**/*'].each { |f| print f }
end
