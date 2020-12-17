require 'rbconfig'
dlext = RbConfig::CONFIG['DLEXT']
begin
  require_relative "debug_inspector.#{dlext}"
  # If the above require fails, we don't want to define any constants.
  require_relative "rubyvm/debug_inspector/version"
rescue LoadError
end
