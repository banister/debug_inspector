require_relative "test_helper"
class BasicTest < MiniTest::Test
  def test_version
    assert(DebugInspector::VERSION)
  end
end
