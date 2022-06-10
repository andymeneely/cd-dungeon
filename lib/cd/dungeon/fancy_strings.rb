module FancyStrings
  refine String do

    def to_header
      bar = '-' * self.size
      <<~EOS
        +-#{bar }-+
        | #{self} |
        +-#{bar }-+
        #{bar}
      EOS
    end
    
  end
end