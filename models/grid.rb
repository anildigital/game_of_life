class Grid

  attr_reader :contents # 2D array of cells

  def initialize(seed_file)
    setup_grid(seed_file)
  end

  def [](index)
    @contents[index]
  end

  def to_s
    str = ""
    for each_cells_row in @contents
      for each_cell in each_cells_row
        str << each_cell.state
      end
      str << "\n"
    end
    str
  end

  def grow 
    # Initialize Successor Grid Contents
    successor_contents = Array.new(@columns) { Array.new(@rows) { Cell.new } }

    # Populate Successor Grid Contents which captures next state of cells    
    for row in 0...@rows
      for column in 0...@columns
        cell = @contents[row][column]
        successor_contents[row][column].state = cell.next_state
      end
    end

    # Change the current state of contents cell to the successor state
    for row in 0...@rows
      for column in 0...@columns
        cell = successor_contents[row][column]
        @contents[row][column].state = cell.state
      end
    end
  end


  alias_method :update, :grow # aliasing as observer needs to respond to 'update' method


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
    init_contents(@rows, @columns)

    # Loop through seed data and setup grid contents
    row = 0
    for each_line in seed_data
      column = 0
      each_line.chomp.each_char do |chr|
        cell = @contents[row][column] # Take out the Cell to set it's state
        cell.state = chr
        @contents[row][column] = cell
        column += 1
      end
      row += 1
    end
  end


end