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
end
