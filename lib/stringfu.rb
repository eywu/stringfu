require "stringfu/version"

STOP = ["a", "able", "about", "across", "after", "all", "almost", "also", "am", "among", "an", "and", "any", "are", "as", "at", "be", "because", "been", "but", "by", "can", "cannot", "could", "dear", "did", "do", "does", "either", "else", "ever", "every", "for", "from", "get", "got", "had", "has", "have", "he", "her", "hers", "him", "his", "how", "however", "i", "if", "in", "into", "is", "it", "its", "just", "least", "let", "like", "likely", "may", "me", "might", "most", "must", "my", "neither", "no", "nor", "not", "of", "off", "often", "on", "only", "or", "other", "our", "own", "rather", "said", "say", "says", "she", "should", "since", "so", "some", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "tis", "to", "too", "twas", "us", "wants", "was", "we", "were", "what", "when", "where", "which", "while", "who", "whom", "why", "will", "with", "would", "yet", "you", "your"]

class String
  include StringFu
end

module StringFu
  def punc_strip
    self.gsub(/[!@#\$%^&*;:,<.>?\/|+=\[\]"{}()_-]/,'').gsub(/^'/,'')
  end

  def punc_strip!
    replace(self.gsub(/[!@#\$%^&*;:,<.>?\/|+=\[\]"{}()_-]/,'').gsub(/^'/,''))
  end

  def punc_sub pattern=' '
    self.sub(/[!@#\$%^&*;:,<.>?\/|+=\[\]"{}()_-]/,pattern).sub(/^'/,pattern)
  end

  def punc_sub! pattern=' '
    replace(self.sub(/[!@#\$%^&*;:,<.>?\/|+=\[\]"{}()_-]/,pattern).sub(/^'/,pattern))
  end

  def punc_gsub pattern=' '
    self.gsub(/[!@#\$%^&*;:,<.>?\/|+=\[\]"{}()_-]/,pattern).gsub(/^'/,pattern)
  end

  def punc_gsub! pattern=' '
    replace(self.gsub(/[!@#\$%^&*;:,<.>?\/|+=\[\]"{}()_-]/,pattern).gsub(/^'/,pattern))
  end

  def ngrams *args
    wordphrase = self.split

    if args.size == 0 
      args = [1..wordphrase.length]
    end
  
    # Inspired by http://www.rubyquiz.com/quiz4.html
    args = args.map { |arg| Array(arg) }.flatten.uniq.sort
    args = args.select { |arg| arg <= wordphrase.length and arg > 0 }  

    args.each do |num| 
      prefix = latinfy num
      self.instance_variable_set "@#{prefix}grams", []
      rounds = wordphrase.length - num + 1
      rounds.times do |iter| 
        self.instance_variable_get("@#{prefix}grams") << wordphrase[iter...(iter+num)].join(" ")
      end
      # Calls :attr_accessor to add new instance variable
      self.class.__send__(:attr_accessor, "#{prefix}grams".to_sym)
      self.instance_variable_get("@#{prefix}grams")
    end
    args
  end

  private
  def latinfy num
    prefix = {1 => "uni", 2 => "bi", 3 => "tri"}
    if prefix.has_key? num 
      prefix[num]
    else
      "_#{num}"
    end
  end
end
