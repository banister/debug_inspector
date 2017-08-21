begin
  require 'bundler/setup'
rescue LoadError
  # Bundler is missing. This should happen rarely (eg while running tests from Fedora package).
  # See https://github.com/banister/debug_inspector/pull/16 for more details.
  $LOAD_PATH.push File.expand_path(File.join("..", "lib"), File.dirname(__FILE__))
  warn "WARN: Bundler is not being used."
end
require 'minitest'
require 'minitest/autorun'
require 'debug_inspector'
