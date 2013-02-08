require 'rbconfig'

if File.exists?(File.expand_path(File.dirname(__FILE__), "debug_inspector.#{RbConfig::CONFIG["DLEXT"]}"))
  require 'debug_inspector.so'
else
  raise LoadError, "Cannot find debug_inspector.so: Are you sure you're running MRI 2.0?"
end
