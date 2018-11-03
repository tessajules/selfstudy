# find duplicate files and return as array of path names with original, duplicate

require 'digest'
require 'set'

def find_duplicates
  # my strategy is to first traverse the file tree, then hash each file into a digest, store digests in a Set,
  # then add to array of duplicates if digest already in set
  duplicates = []
  seen_digests = {}
  Dir['dirs/**/*'].each do |f|
    next unless File.file?(f)
    sha256 = Digest::SHA256.file f

    if seen_digests[sha256.hexdigest]
      original = File.ctime(seen_digests[sha256.hexdigest]) < File.ctime(f) ? seen_digests[sha256.hexdigest] : f
      copy = File.ctime(seen_digests[sha256.hexdigest]) > File.ctime(f) ? seen_digests[sha256.hexdigest] : f
      duplicates << [original, copy]
    else
      seen_digests[sha256.hexdigest] = f
    end
  end

  duplicates
end

p find_duplicates
