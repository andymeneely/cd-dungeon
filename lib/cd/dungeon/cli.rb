require 'thor'
require_relative 'delver'

module Cd
  module Dungeon
    # Handle the application command line parsing
    # and the dispatch to various command objects
    #
    # @api public
    class CLI < Thor
      # Error raised by this runner
      Error = Class.new(StandardError)

      desc 'version', 'cd-dungeon version'
      def version
        require_relative 'version'
        puts "v#{Cd::Dungeon::VERSION}"
      end
      map %w(--version -v) => :version

      desc 'delve', 'cd-dungeon delve'
      def delve
        
        Delver.new.run
      end


    end
  end
end
