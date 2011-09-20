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

ngrams will generate ngrams for any string and returns an array of numbers corresponding to the ngrams
    wtf.ngrams  # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    
    wtf.unigrams  # => ["Charlie", "the", "Unicorn", "is", "a", "potty", "mouth.", "He'll", "say", "things", "like,", "@!@#%", "!@$%$[@\#$^!)"]
    wtf.bigrams   # => ["Charlie the", "the Unicorn", "Unicorn is", "is a", "a potty", "potty mouth.", "mouth. He'll", "He'll say", "say things", "things like,", "like, @!@#%", "@!@#% !@$%$[@\#$^!)"]

    wtf.ngrams 2..5   # => [2, 3, 4, 5]
