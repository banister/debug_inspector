require "mkmf"

def fake_makefile
  File.open(File.join(File.dirname(__FILE__), "Makefile"), "w") {|f|
    f.puts %[install:\n\techo "This Ruby not supported by/does not require debug_inspector.\n"]
  }
end

def mri_2_or_3?
  defined?(RUBY_ENGINE) && RUBY_ENGINE == "ruby" &&
    RUBY_VERSION =~ /^[23]/
end

  
if mri_2_or_3?
  require 'mkmf'
  create_makefile('debug_inspector')
else
  fake_makefile
end
