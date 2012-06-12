# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zemanta/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Oto Brglez"]
  gem.email         = ["otobrglez@gmail.com"]
  gem.description   = %q{Ruby client for Zemanta}
  gem.summary       = %q{This GEM provides Ruby client and comand-line tool for Zemanta API.}
  gem.homepage      = "https://github.com/otobrglez/zemanta"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zemanta"
  gem.require_paths = ["lib"]
  gem.version       = Zemanta::VERSION

  gem.has_rdoc      = false

  gem.add_dependency "httparty"
  # gem.add_dependency "nokogiri"

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'growl'
  gem.add_development_dependency 'spork', '~> 1.0rc'
end
