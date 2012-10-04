# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pbl/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Akira Maeda"]
  gem.email         = ["glidenote@gmail.com"]
  gem.description   = %q{show pinboard list on command line}
  gem.summary       = %q{show pinboard list on command line}
  gem.homepage      = "https://github.com/glidenote/pbl"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pbl"
  gem.require_paths = ["lib"]
  gem.version       = Pbl::VERSION

  gem.add_dependency 'pinboard'
  gem.add_dependency 'pit'
  gem.add_dependency 'colored'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rb-fsevent'
end
