# -*- encoding: utf-8 -*-
require_relative "lib/rubyvm/debug_inspector/version"

Gem::Specification.new do |s|
  s.name    = "debug_inspector"
  s.version = RubyVM::DebugInspector::VERSION
  s.authors = ["John Mair (banisterfiend)"]
  s.email = ["jrmair@gmail.com"]
  s.homepage = "https://github.com/banister/debug_inspector"
  s.summary = "A Ruby wrapper for the MRI 2.0 debug_inspector API"
  s.description = s.summary
  s.files         = `git ls-files`.split("\n")
  s.platform = Gem::Platform::RUBY
  s.extensions = ["ext/rubyvm/debug_inspector/extconf.rb"]
  s.license = 'MIT'
  s.add_development_dependency 'minitest', '~> 5.10'
end
