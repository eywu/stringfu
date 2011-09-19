require "stringfu/version"

class String
  include Stringfu
end

module Stringfu
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
    # Wordify::HTML.ngrams 1  
    wordphrase = self.split

    if args.size == 0 
      args = [1..wordphrase.length]
    end

    args = args.map { |arg| Array(arg) }.flatten.uniq.sort # Inspired by http://www.rubyquiz.com/quiz4.html

    p args

    args.each do |num| 
      prefix = latinfy num
      self.instance_variable_set "@#{prefix}grams", []
      rounds = wordphrase.length - num + 1
      rounds.times do |iter| 
        self.instance_variable_get("@#{prefix}grams") << wordphrase[iter...(iter+num)].join(" ")
      end
      self.class.__send__(:attr_accessor, "#{prefix}grams".to_sym)    # Calls :attr_accessor to add new instance variable
      self.instance_variable_get("@#{prefix}grams")
    end
    wordphrase.length
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
