require_relative 'fancy_strings'

module Descriptions
  using FancyStrings
  
  def describe_dir(dir)
    return dir.to_header
  end

end
