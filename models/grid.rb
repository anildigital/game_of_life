class Grid

  attr_reader :contents # 2D array of cells
  attr_reader :rows
  attr_reader :columns

  def initialize(seed_file)
    setup_grid(seed_file)
  end

  def [](index)
    @contents[index]
  end

  def <<(cell)
    @contents << cell
  end

  def >>(cell)
    @contents.delete(cell)
  end

  def to_s
    str = ""
    for each_cells_row in @contents
      for each_cell in each_cells_row
        if each_cell.is_alive
          str << "X"
        else
          str << "-"
        end
      end
      str << "\n"
    end
    str
  end

  def grow 

    # Initialize Successor Grid Contents
    successor_contents = Array.new rows
    for row in 0...rows
      successor_contents[row] = Array.new columns
      for column in 0...columns
        cell = Cell.new
        successor_contents[row][column] = cell
      end
    end

    # Populate Successor Grid Contents which captures next state of cells
    i = 0
    for each_row in @contents
      j = 0
      for each_cell in each_row
        successor_contents[i][j].is_alive = each_cell.next_state.is_alive
        j += 1
      end
      i += 1
    end

    # Change the current state of contents cell to the successor state
    i = 0
    for each_row in successor_contents
      j = 0
      for each_cell in each_row
        @contents[i][j].is_alive = each_cell.is_alive
        j += 1
      end
      i += 1
    end

  end


  # Private methods

  private

  def init_contents(rows, columns)
    @contents = Array.new rows
    for row in 0...rows
      @contents[row] = Array.new columns
      for column in 0...columns
        cell = Cell.new
        @contents[row][column] = cell
        if row > 0
          cell.add_neighbour @contents[row-1][column]
          cell.add_neighbour @contents[row-1][column+1] if column <= columns - 2
        end
        if column > 0
          cell.add_neighbour @contents[row][column-1]
          cell.add_neighbour @contents[row-1][column-1] if row > 0
        end
      end
    end
    @contents
  end


  # Setup grid contents for the seed file passed. Set cell states accordingly.
  def setup_grid(seed_file)

    # Read the seed file
    file_object = File.open(seed_file)
    seed_data = file_object.readlines
    file_object.close

    @columns = seed_data[0].chomp.length
    @rows = seed_data.size

    # Init grid contents for rows and columns
    @contents = init_contents(@rows, @columns)

    i = 0
    for each_line in seed_data
      j = 0
      each_line.chomp.each_char do |chr|
        cell_state = determine_cell_state(chr) # dead or alive
        cell = @contents[i][j] # Take out the Cell to set it's state
        cell.is_alive = cell_state
        @contents[i][j] = cell
        j += 1
      end
      i += 1
    end

  end


  # helper to determine cell state
  def determine_cell_state(chr)
    cell_states_hash = {"X" => true, "-" => false}
    cell_state = cell_states_hash[chr]
    cell_state
  end

end