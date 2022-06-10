require 'tty-prompt'
class Delver

  def initialize
    @prompt = TTY::Prompt.new
  end

  def run
    dir = @prompt.select('Where to begin?') do |menu|
      menu.choice 'Home', ENV["HOME"]
      menu.choice 'The Root of All Things', '/'
      menu.choice 'The Land of Meta', __dir__
    end
    while delve(dir)
    end
  end

  def describe(dir)
    puts dir
    monsters = []
    npcs = []
    Dir.children(dir).each do |f|
      npcs << f if File.basename(f) == 'README.md'
      # monsters << f if File.extname(f) == 'README.md'
    end
    puts npcs
    # dir = @prompt.select('NPCs?') do |menu|
    #   npcs.each do |npc|
    #     menu.choice npc,npc
    #   end
    # end

  end

  def delve(dir)
    Dir.chdir(dir)
    describe(dir)
    return true
  end
end