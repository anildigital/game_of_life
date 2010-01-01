require 'test_helper'

class CellTest < Test::Unit::TestCase

  def setup
    @cell = Cell.new
  end
  
  def teardown
    @cell = nil
  end
  
  def test_cell_initialize
    assert_equal true, @cell.is_alive
  end

  def test_add_neighbour
    assert_equal 0, @cell.number_of_neighbours
    new_cell = Cell.new
    @cell.add_neighbour(new_cell)
    assert_equal 1, @cell.number_of_neighbours
    assert_equal 1, new_cell.number_of_neighbours
    new_cell_2 = Cell.new
    @cell.add_neighbour(new_cell_2)
    assert_equal 2, @cell.number_of_neighbours
  end

  def test_add_same_neighbour_multiple_times
    new_cell = Cell.new
    @cell.add_neighbour(new_cell)
    @cell.add_neighbour(new_cell)
    assert_equal 1, @cell.number_of_neighbours
  end

  def test_initial_neighbours_blank
    assert_equal [], @cell.neighbours
  end
  
  def test_number_of_live_neighbours
    cell1 = Cell.new
    cell2 = Cell.new
    cell1.add_neighbour(cell2)
    assert_equal 1, cell1.number_of_alive_neighbours 
  end
  
  def test_next_state_for_cell_for_overcrowdedness
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(4)
    for each_cell in cells
      @cell.add_neighbour(each_cell)
    end
    assert_equal 4, @cell.number_of_alive_neighbours 
    assert_equal true, @cell.is_alive # current state    
    assert_equal false, @cell.next_state.is_alive # next state
  end
  
  def test_next_state_for_cell_for_lonelyness
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(1)
    for each_cell in cells
      @cell.add_neighbour(each_cell)
    end
    assert_equal 1, @cell.number_of_alive_neighbours 
    assert_equal true, @cell.is_alive # current state
    assert_equal false, @cell.next_state.is_alive # next state
  end
  
  def test_next_state_for_cell_for_two_alive_neighbours
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(2)
    for each_cell in cells
      @cell.add_neighbour(each_cell)
    end
    assert_equal 2, @cell.number_of_alive_neighbours 
    assert_equal true, @cell.is_alive # current state
    assert_equal true, @cell.next_state.is_alive # next state
  end
  
  def test_next_state_for_cell_for_birth
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(3)
    for each_cell in cells
      @cell.add_neighbour(each_cell)
    end
    @cell.is_alive = false
    assert_equal 3, @cell.number_of_alive_neighbours 
    assert_equal false, @cell.is_alive # current state
    assert_equal true, @cell.next_state.is_alive # next state
  end
  
  
  # Helper methods used in tests
  
  def cell_factory(number)
    cells = []
    number.times do 
      cells << Cell.new
    end
    cells
  end

end