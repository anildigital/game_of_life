require 'test/unit'

class Grid
  attr_accessor :contents
  attr_reader :rows
  attr_reader :columns

  def initialize(rows, columns)
    
    @contents = Array.new(columns) {Array.new(rows)}
    @rows = @contents.size
    @columns = @contents[0].size
    
    
    for row in 0...@rows
      for column in 0...@columns
        @contents[row][column] = [row, column]
      end
    end
  end

  def neighbours(row, column)
    if (row >= @rows) or (column >= @columns)
      raise StandardError, "Invalid input"
    end
    output_array = []
    for i in (row - 1)..(row + 1)   
      for j in (column - 1)..(column+1)
        if !((i == row) && (j == column))
          if (i >= 0) && (j >= 0)
            if (i <= (@rows - 1) && (j <= (@columns - 1)))
              output_array << [i, j]
            end
          end
        end
      end
    end
    return output_array.sort
  end

end


class TestNeighbours < Test::Unit::TestCase

  def test_neighbours
    grid = Grid.new(9, 9)
    assert_equal 9, grid.contents.size
    assert_equal 9, grid.contents[0].size    
  end

  def test_no_of_neighbours_2_2
    grid = Grid.new(9, 9)
    print grid.contents.inspect
    array = [[1, 1], [1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2], [3, 3]]
    assert_equal array, grid.neighbours(2, 2)
  end

  def test_no_of_neighbours_0_0
    grid = Grid.new(9, 9)
    array = [[0, 1], [1, 0], [1, 1]]
    assert_equal array, grid.neighbours(0, 0)
  end

  def test_no_of_neighbours_3_0
    grid = Grid.new(9, 9)
    array = [[2, 0], [2, 1], [3, 1], [4, 0], [4,1]]
    assert_equal array, grid.neighbours(3, 0)
  end

  def test_no_of_neighbours_0_7
    grid = Grid.new(9, 9)
    array = [[0, 6], [0, 8], [1, 6], [1, 7], [1, 8]]
    assert_equal array, grid.neighbours(0, 7)
  end

  def test_no_of_neighbours_0_8
    grid = Grid.new(9, 9)
    array = [[0, 7], [1, 7], [1, 8]]
    assert_equal array, grid.neighbours(0, 8)
  end
  
  def test_no_of_neighbours_1_8
    grid = Grid.new(9, 9)
    array = [[0, 7], [1, 7], [1, 8]]
    assert_equal array, grid.neighbours(0, 8)
  end
  
  def test_no_of_neighbours_8_8
    grid = Grid.new(9, 9)
    array = [[7, 7], [7, 8], [8, 7]]
    assert_equal array, grid.neighbours(8, 8)
  end
  
  def test_no_of_neighbours_8_0
    grid = Grid.new(9, 9)
    array = [[7, 0], [7, 1], [8, 1]]
    assert_equal array, grid.neighbours(8, 0)
  end
  
  def test_no_of_neighbours_invalid_input_9_9
    grid = Grid.new(9, 9)
    assert_raise StandardError do 
       grid.neighbours(9, 9)
    end
  end
  
  def test_no_of_neighbours_invalid_input_9_0
    grid = Grid.new(9, 9)
    assert_raise StandardError do 
       grid.neighbours(9, 0)
    end
  end
  
  def test_no_of_neighbours_invalid_input_0_9
    grid = Grid.new(9, 9)
    assert_raise StandardError do 
       grid.neighbours(0, 9)
    end
  end
  
end
