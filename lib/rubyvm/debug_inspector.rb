require 'rbconfig'
dlext = RbConfig::CONFIG['DLEXT']
begin
  require "rubyvm/debug_inspector.#{dlext}"
rescue LoadError
end
