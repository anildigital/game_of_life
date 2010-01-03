require 'test_helper'

class GridTest < Test::Unit::TestCase

  def setup
    @seed_file_block = File.dirname(__FILE__) + "/fixtures/seed_block.txt"
    @seed_file_blinker = File.dirname(__FILE__) + "/fixtures/seed_blinker.txt"
    @seed_file_bloat = File.dirname(__FILE__) + "/fixtures/seed_bloat.txt"   
    @seed_file_toad = File.dirname(__FILE__) + "/fixtures/seed_toad.txt"     
  end

  def teardown
  end

  # Basic grid initialization test for all types of valid seed files

  def test_initialize_cell_grid_block_pattern
    grid = Grid.new(@seed_file_block)
    output_str = "XX\nXX\n"
    assert_equal output_str, grid.to_s
  end

  def test_initialize_cell_grid_blinker_pattern
    grid = Grid.new(@seed_file_blinker)
    output_str = "-X-\n-X-\n-X-\n"
    assert_equal output_str, grid.to_s
  end

  def test_initialize_cell_grid_bloat_pattern
    grid = Grid.new(@seed_file_bloat)
    output_str = "XX-\nX-X\n-X-\n"
    assert_equal output_str, grid.to_s
  end

  def test_initialize_cell_grid_toad_pattern
    grid = Grid.new(@seed_file_toad)
    output_str = "----\n-XXX\nXXX-\n----\n"
    assert_equal output_str, grid.to_s
  end 

  def test_cell_grid_block_pattern_after_one_tick
    grid = Grid.new(@seed_file_block)
    grid.grow
    output_str = "XX\nXX\n"
    assert_equal output_str, grid.to_s
  end

  def test_cell_grid_bloat_pattern_after_one_tick
    grid = Grid.new(@seed_file_bloat)
    output_str = "XX-\nX-X\n-X-\n"
    grid.grow
    assert_equal output_str, grid.to_s
  end

  def test_cell_grid_blinker_pattern_after_one_tick
    grid = Grid.new(@seed_file_blinker)
    output_str = "---\nXXX\n---\n"
    grid.grow
    assert_equal output_str, grid.to_s
  end

  def test_cell_grid_toad_pattern_after_one_tick
    grid = Grid.new(@seed_file_toad)
    output_str = "--X-\nX--X\nX--X\n-X--\n"
    grid.grow
    assert_equal output_str, grid.to_s
  end

end