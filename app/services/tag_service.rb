require 'lingua/stemmer'

module TagService
  extend self


  def parse(text)
    stemmer = Lingua::Stemmer.new

    words = text.downcase.split(' ')
    words = words - ['a', 'the', 'self', 'use', 'you', 'want']
    words = words.select {|word| word.length > 2}

    stem_map = Hash.new('')

    out = words.reduce(Hash.new(0)) do |hash, item| 
      # Stem the words.
      stemmed = stemmer.stem(item)
      stem_map[stemmed] = item if item != stemmed && item.length > stem_map[stemmed].length
      hash[stemmed] += 1
      hash
    end

    out = out.sort_by { |key, value| -value }
    out = out[0...5]
    out = out.map { |item, score| [item, score, stem_map[item].length>0 ? stem_map[item] : item ] } 

    p out 
    p '\n'
    p stem_map
    p Math.exp(1) # 2.7
    p Math.exp(0) # 1
    p Math.exp(-0.5) # 0.60
    p Math.exp(-1) # 0.367
    # To normalize the values to be between 0 and -1, we need a boundary value,
    # which is the number of months elapsed. The older the record, the less the
    # recency score. So we add a time-decay algorithm into it. Take the
    # created_at - now, if it is more than 12 months, just set the minimum
    # value of -1. Else, find the difference and divide it by 12, the result
    # should be a -tive value between 0 and -1, 0 being the recent ones in the
    # current month.
    # Simplest way to explain, in 2018, the words 'a' and 'b' occurs 100 and
    # 180 times respectively. In year 2019, the word 'a' occur 50 times. If we
    # just naively sum the number, 'a' will have score of 150, and 'b' will
    # have a score of 180. If we apply time decay/recency, then we can penalize
    # the items in the year 2018 by half. So the final ones will be 'a'
    # occuring 100 times, and b occuring 90 times.
  end

end

# Need multiple documents, each with created at date.
text = 'Use self in each method definition if you want the methods to be defined only in the singleton class of the module (where the methods defined using self live). Omit self and extend self if you want the methods of the module to be defined as instance methods and singleton methods at the same time.'
service = TagService
service.parse(text)
