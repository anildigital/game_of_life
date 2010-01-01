require 'test_helper'

class UniverseTest < Test::Unit::TestCase

  def setup
    @seed_file_block = seed_file_block = File.dirname(__FILE__) + "/fixtures/seed_block.txt"
    @seed_file_blinker = File.dirname(__FILE__) + "/fixtures/seed_blinker.txt"
    @seed_file_bloat = File.dirname(__FILE__) + "/fixtures/seed_bloat.txt"   
    @seed_file_toad = File.dirname(__FILE__) + "/fixtures/seed_toad.txt"    
    @universe = Universe.new 
  end

  def test_initialize_universe
    assert_equal nil, @universe.grid
    assert_not_equal nil, @universe.universe_time
  end

  def test_universe_setup_life
    @universe.setup_life(@seed_file_block)
    assert_equal Grid, @universe.grid.class
    assert_not_equal nil, @universe.universe_time
  end
  
  def teardown
    @universe = nil
  end

end