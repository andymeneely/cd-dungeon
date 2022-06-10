require 'tty-prompt'
require_relative 'descriptions'

class Delver
  include Descriptions

  def initialize
    @prompt = TTY::Prompt.new
  end

  def run
    dir = @prompt.select('Where to begin?') do |menu|
      menu.choice 'Home', ENV["HOME"]
      menu.choice 'The Root of All Things', '/'
      menu.choice 'The Land of Meta', __dir__
    end
    still_delving = true
    while still_delving 
      dir = delve(dir)
    end
  end

  def delve_dir(dir)
    Dir.chdir(dir)
    puts describe_dir(dir)
    monsters = []
    npcs = []
    Dir.glob("*").each do |f|
      npcs << f
      # npcs << f if f == 'README.md'
      
      # monsters << f if File.extname(f) == 'README.md'
    end
    puts "NPCS: #{npcs}"
    new_dir = @prompt.select('NPCs?') do |menu|
      npcs.each do |npc|
        menu.choice npc,npc
      end
      menu.choice 'Leave', '..'
    end
    return new_dir
  end

  def delve(dir)
    return delve_dir(dir) if File.directory? dir     
    puts "NOT A DIRECTORY"
    return '.'
  end

end