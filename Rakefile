require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
  t.warning = true
  t.verbose = true
end

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("rubyvm/debug_inspector") do |ext|
  ext.lib_dir = "lib"
end

task :default => [:clobber, :compile, :test]
