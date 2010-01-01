require 'test_helper'

class UniverseTest < Test::Unit::TestCase
  def test_initialize_universe
    universe = Universe.new
    assert_equal nil, universe.grid
    assert_not_equal nil, universe.universe_time
  end
end