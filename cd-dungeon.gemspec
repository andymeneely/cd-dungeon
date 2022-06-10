require_relative 'lib/cd/dungeon/version'

Gem::Specification.new do |spec|
  spec.name          = "cd-dungeon"
  spec.license       = "MIT"
  spec.version       = Cd::Dungeon::VERSION
  spec.authors       = ["Andy Meneely"]
  spec.email         = ["andy.meneely@gmail.com"]

  spec.summary       = 'cd dungeon/ roguelike'
  spec.description   = 'cd dungeon/ roguelike'
  spec.homepage      = "https://github.com/andymeneely/cd-dungeon"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/andymeneely/cd-dungeon"
  # spec.metadata["changelog_uri"] = "https://github.com/andymeneely/cd-dungeon"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'tty', '~> 0.10'
end
