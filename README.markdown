# StringFu

StringFu are some simple methods to manipulate strings in order for them to be cleaned up for Natural Language Processing (NLP).

## Install StringFu

    gem install stringfu

## Usage

    wtf = 'Charlie the Unicorn is a potty mouth. He\'ll say things like, @!@#% !@$%$[@#$^!)'

punc_strip will strip away all standard punctation.
  
    wtf.punc_strip  # => "Charlie the Unicorn is a potty mouth He'll say things like  "

punc_gsub will replace punctionation with spaces if given no arguments

    wtf.punc_gsub   # => "Charlie the Unicorn is a potty mouth  He'll say things like                    "

punc_gsub can also take arguments

    wtf.punc_gsub "?"   # => "Charlie the Unicorn is a potty mouth? He'll say things like? ????? ????????????"

ngrams will generate ngrams (unigrams, bigrams, trigrams, four-grams, etc.) for any string and returns an array of numbers corresponding to the ngrams

    ftw = "I choose Whoppie Goldberg for the Win!"
    ftw.ngrams  # => [1, 2, 3, 4, 5, 6, 7]
    
    ftw.unigrams  
    # => ["I", "choose", "Whoppie", "Goldberg", "for", "the", "Win!"]
    
    ftw.bigrams   
    # => ["I choose", "choose Whoppie", "Whoppie Goldberg", "Goldberg for", "for the", "the Win!"]
    
    ftw.trigrams  
    # => ["I choose Whoppie", "choose Whoppie Goldberg", "Whoppie Goldberg for", "Goldberg for the", "for the Win!"]
    
    ftw._4grams   
    # => ["I choose Whoppie Goldberg", "choose Whoppie Goldberg for", "Whoppie Goldberg for the", "Goldberg for the Win!"]

    ftw.ngrams 3..6   # => [3, 4, 5, 6]
    ftw.ngrams 2, 7, 3..4   # => [2, 3, 4, 7]

stemming a string will output an array of the Porter Stemmed words

    "ZOMG! I hearted installing headlights into used decepticons".stem
    # => ["zomg", "i", "heart", "instal", "headlight", "into", "use", "decepticon"]