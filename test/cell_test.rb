require 'test_helper'

class CellTest < Test::Unit::TestCase

  def setup
    @cell = Cell.new
    @cell.is_alive = true  # set current cell state as alive
  end
  
  def teardown
    @cell = nil
  end
  
  def test_cell_initial_state
    assert_equal true, @cell.is_alive
  end
  
  def test_initial_neighbours_blank
    assert_equal [], @cell.neighbours
  end

  def test_add_neighbour
    new_cell = Cell.new
    new_cell.is_alive = true
    @cell.add_neighbour(new_cell)
    assert_equal 1, @cell.number_of_alive_neighbours
  end
  
  def test_add_neighbours
    test_add_neighbour
    new_cell = Cell.new
    new_cell.is_alive = true
    @cell.add_neighbour(new_cell)
    assert_equal 2, @cell.number_of_alive_neighbours
  end

  def test_add_same_neighbour_multiple_times
    new_cell = Cell.new
    new_cell.is_alive = true
    @cell.add_neighbour(new_cell)
    @cell.add_neighbour(new_cell)
    assert_equal 1, @cell.number_of_alive_neighbours
  end
  
  def test_number_of_live_neighbours
    cells = cell_factory(3, true)
    cells[1].is_alive = false
    cells.each { |cell|  @cell.add_neighbour cell }
    assert_equal 2, @cell.number_of_alive_neighbours 
  end
  
  def test_next_state_for_cell_for_overcrowdedness
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(4, true)
    cells.each {|cell| @cell.add_neighbour(cell) }
    assert_equal 4, @cell.number_of_alive_neighbours 
    assert_equal Cell::ALIVE, @cell.state # current state    
    assert_equal Cell::DEAD, @cell.next_state # next state
  end
  
  def test_next_state_for_cell_for_lonelyness
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(1, true)
    cells.each {|cell| @cell.add_neighbour(cell) }
    assert_equal 1, @cell.number_of_alive_neighbours 
    assert_equal Cell::ALIVE, @cell.state # current state
    assert_equal Cell::DEAD, @cell.next_state # next state
  end
  
  def test_next_state_for_cell_for_two_alive_neighbours
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(2, true)
    cells.each {|cell| @cell.add_neighbour(cell) }
    assert_equal 2, @cell.number_of_alive_neighbours 
    assert_equal Cell::ALIVE, @cell.state # current state
    assert_equal Cell::ALIVE, @cell.next_state # next state
  end
  
  def test_next_state_for_cell_for_birth
    @cell.is_alive = false # Set current cell state as dead
    assert_equal 0, @cell.number_of_alive_neighbours
    cells = cell_factory(3, true)
    cells.each {|cell| @cell.add_neighbour(cell) }
    assert_equal 3, @cell.number_of_alive_neighbours 
    assert_equal Cell::DEAD, @cell.state # current state
    assert_equal Cell::ALIVE, @cell.next_state # next state
  end
  
  
  # Helper methods used in tests
  
  def cell_factory(number, is_alive=false)
    cells = []
    number.times do 
      cell = Cell.new
      cell.is_alive = is_alive
      cells << cell
    end
    cells
  end

end