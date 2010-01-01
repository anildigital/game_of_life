require 'test_helper'

class GridTest < Test::Unit::TestCase

  def setup
    @seed_file_block = seed_file_block = File.dirname(__FILE__) + "/fixtures/seed_block.txt"
    @seed_file_blinker = File.dirname(__FILE__) + "/fixtures/seed_blinker.txt"
    @seed_file_bloat = File.dirname(__FILE__) + "/fixtures/seed_bloat.txt"   
    @seed_file_toad = File.dirname(__FILE__) + "/fixtures/seed_toad.txt"     
  end

  def teardown
  end

  # Basic grid initialization test for all types of valid seed files

  def test_initialize_cell_grid_block_pattern
    grid = Grid.new(@seed_file_block)
    assert_equal true, grid[1][1].is_alive
    assert_equal true, grid[1][0].is_alive 

    assert_raise NoMethodError do 
      grid[0][3].is_alive
    end  
  end

  def test_initialize_cell_grid_blinker_pattern
    grid = Grid.new(@seed_file_blinker)

    # for simplicity not used array 
    assert_equal false, grid[0][0].is_alive
    assert_equal true, grid[0][1].is_alive
    assert_equal false, grid[0][2].is_alive
    assert_equal false, grid[1][0].is_alive 
    assert_equal true, grid[1][1].is_alive
    assert_equal false, grid[1][2].is_alive
    assert_equal false, grid[2][0].is_alive
    assert_equal true, grid[2][1].is_alive 
    assert_equal false, grid[2][2].is_alive    

    assert_raise NoMethodError do 
      grid[0][3].is_alive
    end
  end

  def test_initialize_cell_grid_bloat_pattern
    grid = Grid.new(@seed_file_bloat)

    # for simplicity, not used array 
    assert_equal true, grid[0][0].is_alive
    assert_equal true, grid[0][1].is_alive
    assert_equal false, grid[0][2].is_alive
    assert_equal true, grid[1][0].is_alive 
    assert_equal false, grid[1][1].is_alive
    assert_equal true, grid[1][2].is_alive
    assert_equal false, grid[2][0].is_alive
    assert_equal true, grid[2][1].is_alive 
    assert_equal false, grid[2][2].is_alive    

    assert_raise NoMethodError do 
      grid[0][3].is_alive
    end
  end

  def test_initialize_cell_grid_toad_pattern

    grid = Grid.new(@seed_file_toad)

    # for simplicity not used array to test
    assert_equal false, grid[0][0].is_alive
    assert_equal false, grid[0][1].is_alive
    assert_equal false, grid[0][2].is_alive
    assert_equal false, grid[0][3].is_alive 

    assert_equal false, grid[1][0].is_alive
    assert_equal true, grid[1][1].is_alive
    assert_equal true, grid[1][2].is_alive
    assert_equal true, grid[1][3].is_alive

    assert_equal true, grid[2][0].is_alive
    assert_equal true, grid[2][1].is_alive
    assert_equal true, grid[2][2].is_alive
    assert_equal false, grid[2][3].is_alive

    assert_raise NoMethodError do 
      grid[0][4].is_alive
    end
  end 

  def test_cell_grid_block_pattern_after_one_tick
    seed_file_block = File.dirname(__FILE__) + "/fixtures/seed_block.txt"
    grid = Grid.new(seed_file_block)
    grid.grow
    output_str = "XX\nXX\n"
    assert_equal output_str, grid.to_s
  end

  def test_cell_grid_bloat_pattern_after_one_tick
    seed_file_bloat = File.dirname(__FILE__) + "/fixtures/seed_bloat.txt"
    grid = Grid.new(seed_file_bloat)
    output_str = "XX-\nX-X\n-X-\n"
    grid.grow
    assert_equal output_str, grid.to_s
  end

  def test_cell_grid_blinker_pattern_after_one_tick
    seed_file_block = File.dirname(__FILE__) + "/fixtures/seed_blinker.txt"
    grid = Grid.new(seed_file_block)
    output_str = "---\nXXX\n---\n"
    grid.grow
    assert_equal output_str, grid.to_s
  end

  def test_cell_grid_toad_pattern_after_one_tick
    seed_file_toad = File.dirname(__FILE__) + "/fixtures/seed_toad.txt"
    grid = Grid.new(seed_file_toad)
    output_str = "--X-\nX--X\nX--X\n-X--\n"
    grid.grow
    assert_equal output_str, grid.to_s
  end

end