# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pbl/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Akira Maeda,Kohei Hasegawa"]
  gem.email         = ["glidenote@gmail.com"]
  gem.description   = %q{A command line tool for Pinboard to search your bookmarks.}
  gem.summary       = %q{A command line tool for Pinboard to search your bookmarks.}
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
  gem.add_dependency 'rake'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
end
