# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_beautifier/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby_beautifier"
  gem.version       = RubyBeautifier::VERSION
  gem.authors       = ["Pratik Khadloya"]
  gem.email         = ["tispratik@gmail.com"]
  gem.description   = %q{This gem is for beautifiying ruby code. It uses tradional regular expression parsing.}
  gem.summary       = %q{Shell script based ruby beautifier}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rspec'
end
