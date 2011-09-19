# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stringfu/version"

Gem::Specification.new do |s|
  s.name        = "stringfu"
  s.version     = Stringfu::VERSION
  s.authors     = ["Eric Wu"]
  s.email       = ["me@eywu.com"]
  s.homepage    = "http://stringfu.com"
  s.summary     = %q{Manipulating words like a grandmasta}
  s.description = %q{Extending String with methods to stem, count, and clean words}

  s.rubyforge_project = "stringfu"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
