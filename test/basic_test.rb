require_relative "test_helper"
class BasicTest < MiniTest::Test
  def test_version
    assert(RubyVM::DebugInspector::VERSION)
  end

  def test_backtrace_locations
    RubyVM::DebugInspector.open do |dc|
      assert dc.backtrace_locations.size > 0
      dc.backtrace_locations.each{|e| assert_instance_of Thread::Backtrace::Location, e}
    end
  end

  def test_frame_binding
    RubyVM::DebugInspector.open do |dc|
      assert_equal self, dc.frame_binding(1).eval("self")
      assert_equal __method__, dc.frame_binding(1).eval("__method__")
    end
  end

  def test_frame_class
    RubyVM::DebugInspector.open do |dc|
      assert_equal self.class, dc.frame_class(1)
    end
  end

  def test_frame_iseq
    RubyVM::DebugInspector.open do |dc|
      assert_equal __FILE__, dc.frame_iseq(1).path
    end
  end
end
