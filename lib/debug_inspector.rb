if File.exists?("debug_inspector.so")
  require 'debug_inspector.so'
else
  raise LoadError, "Cannot find debug_inspector.so: Are you sure you're running MRI 2.0?"
end
