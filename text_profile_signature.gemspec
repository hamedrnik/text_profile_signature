# -*- encoding: utf-8 -*-
require File.expand_path('../lib/text_profile_signature', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "text_profile_signature"
  gem.version       = TextProfileSignature::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Hamed Ramezanian Nik"]
  gem.email         = ["hamed.r.nik@gmail.com"]
  gem.summary       = "A fuzzy hash of text generator for Deduplication"
  gem.description   = "A fuzzy hash of text generator for Deduplication."
  gem.homepage      = "https://github.com/iCEAGE/text_profile_signature"
  gem.license       = "LGPL-3.0"

  gem.files         = `git ls-files | grep -Ev '^(myapp|examples)'`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency  'unicode', '~> 0.4.4.2'

  gem.add_development_dependency 'rake', '~> 11.1', '>= 11.1.2'
  gem.add_development_dependency 'minitest', '~> 5.9'
end
