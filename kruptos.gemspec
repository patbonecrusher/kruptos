# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kruptos/version'

Gem::Specification.new do |gem|
  gem.name          = "kruptos"
  gem.version       = File.exist?('VERSION') ? File.read('VERSION') : Kruptos::VERSION
  gem.authors       = ["Pat Laplante"]
  gem.email         = ["pat@covenofchaos.com"]
  gem.description   = %q{Crypto ruby gem}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/patbonecrusher/kruptos"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.licenses 		= ["MIT"]

  gem.add_development_dependency 'rspec' 
  gem.add_development_dependency 'cli-colorize'
  gem.add_development_dependency 'rdoc', '>= 3.12'
  gem.add_development_dependency 'cucumber', '>= 1.0'
  gem.add_development_dependency 'bundler', '>= 1.0.0'
  gem.add_development_dependency 'simplecov'
end
