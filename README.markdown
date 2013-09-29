# stringfu

stringfu is a ruby gem with some simple methods to manipulate strings in order for them to be cleaned up for Natural Language Processing (NLP).

## Install stringfu

    gem install stringfu

### Dependencies

UEA Stemmer for Porter Stemming: https://github.com/ealdent/uea-stemmer

    gem install uea-stemmer

## Usage

    wtf = 'Charlie the Unicorn is a potty mouth. He\'ll say things like, @!@#% !@$%$[@#$^!)'

punc_strip will strip away all standard punctation.
  
    wtf.punc_strip  # => "Charlie the Unicorn is a potty mouth He'll say things like  "

punc_gsub will replace punctionation with spaces if given no arguments

    wtf.punc_gsub   # => "Charlie the Unicorn is a potty mouth  He'll say things like                    "

punc_gsub can also take arguments

    wtf.punc_gsub "?"   # => "Charlie the Unicorn is a potty mouth? He'll say things like? ????? ????????????"

ngrams will generate ngrams (unigrams, bigrams, trigrams, four-grams, etc.) for any string and returns the max number of ngrams.

    ftw = "I choose Whoppie Goldberg for the Win!"
    ftw.ngrams  # => 7
    
    ftw.unigrams
    ftw._1grams
    # => ["I", "choose", "Whoppie", "Goldberg", "for", "the", "Win!"]
    
    ftw.bigrams
    ftw._2grams
    # => ["I choose", "choose Whoppie", "Whoppie Goldberg", "Goldberg for", "for the", "the Win!"]
    
    ftw.trigrams
    ftw._3grams
    # => ["I choose Whoppie", "choose Whoppie Goldberg", "Whoppie Goldberg for", "Goldberg for the", "for the Win!"]
    
    ftw._4grams   
    # => ["I choose Whoppie Goldberg", "choose Whoppie Goldberg for", "Whoppie Goldberg for the", "Goldberg for the Win!"]

    ftw.ngrams 3..6   # => [3, 4, 5, 6]
    ftw.ngrams 2, 7, 2..4   # => [2, 3, 4, 7]

stemming a string will output an array of the Porter Stemmed words

    "ZOMG! I hearted installing headlights into used decepticons".stem
    # => ["zomg", "i", "heart", "instal", "headlight", "into", "use", "decepticon"]
    
## Todo

* ngrams
 * add option to make punctation it's own -gram
 * add option to -gramify individual words into characters / syllables
 * add parts of speech (POS) integration to drop types (noun, adj, verbs) from ngrams
* stemming
 * add pluralize and singularize methods
 * add parts of speech (POS) integration so you can pluarlize and singularize just nouns (NN, NNS, NNP)
