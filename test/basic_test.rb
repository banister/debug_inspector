require "test_helper"

class BasicTest < Minitest::Test
  def setup
    @offset = DebugInspector.open do |dc|
      dc.backtrace_locations.index do |loc|
        # Since Ruby 3.4, a label includes the method owner if there is one.
        # See also: https://bugs.ruby-lang.org/issues/19117
        loc.path == __FILE__ and %w[setup BasicTest#setup].include?(loc.label)
      end
    end
  end

  def test_version
    assert(DebugInspector::VERSION)
  end

  def test_legacy_name
    if RUBY_ENGINE == "ruby"
      if RubyVM.respond_to?(:deprecate_constant)
        warning = /warning: constant RubyVM::DebugInspector is deprecated/
      else
        warning = ''
      end

      assert_output('', warning) do
        assert_same DebugInspector, RubyVM::DebugInspector
      end
    else
      assert !defined?(RubyVM::DebugInspector)
    end
  end

  def test_backtrace_locations
    DebugInspector.open do |dc|
      assert dc.backtrace_locations.size > 0
      dc.backtrace_locations.each{|e| assert_instance_of Thread::Backtrace::Location, e}
    end
  end

  def test_frame_binding
    DebugInspector.open do |dc|
      assert_equal self, dc.frame_binding(@offset).eval("self")
      assert_equal __method__, dc.frame_binding(@offset).eval("__method__")
    end
  end

  def test_frame_class
    DebugInspector.open do |dc|
      assert_equal self.class, dc.frame_class(@offset)
    end
  end

  def test_frame_iseq
    DebugInspector.open do |dc|
      if RUBY_ENGINE == "ruby"
        assert_equal __FILE__, dc.frame_iseq(@offset).path
      else
        assert_nil dc.frame_iseq(@offset)
      end
    end
  end
end
