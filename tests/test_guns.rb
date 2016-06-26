require './lib/guns.rb'
require 'test/unit'

class TestGuns < Test::Unit::TestCase
  def test_example
    assert_equal(1 + 1, 2)
  end

  def test_version
    assert_equal("0.1.0", Guns::VERSION)
  end
end
