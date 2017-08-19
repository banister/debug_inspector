require File.dirname(__FILE__) + '/test_helper'

class BasicTest < MiniTest::Test
  def test_version
    assert(DebugInspector::VERSION)
  end

  def test_backtrace_locations
    RubyVM::DebugInspector.open do |dc|
      assert dc.backtrace_locations.size > 0
    end
  end

  def test_frame_binding
    RubyVM::DebugInspector.open do |dc|
      assert_equal self, dc.frame_binding(1).eval("self")
    end
  end

  def test_frame_class
    RubyVM::DebugInspector.open do |dc|
      assert_equal self.class, dc.frame_class(1)
    end
  end
end
