require File.dirname(__FILE__) + '/life'

class Cell < Life

  attr_reader :neighbours

  def initialize
    @is_alive = true
    @neighbours = []
  end

  # Public methods
  public

  # returns total number of neighbours
  def number_of_neighbours
    @neighbours.size
  end

  # returns the number of alive neighbors this cell has
  def number_of_alive_neighbours
    alive_neighbours = @neighbours.find_all {|cell| cell.is_alive}
    alive_neighbours.size
  end

  # add neighbour to the cell
  def add_neighbour(cell)
    if !(@neighbours.include?(cell))
      @neighbours << cell
      cell.neighbours << self
    end
  end

  # next_state 
  def next_state

    cloned_cell = self.clone # Use cloned cell as it would be next state of cell

    # kill the cell due to lonelyness
    cloned_cell.is_alive = false if is_alive && number_of_alive_neighbours < 2

    # kill the cell due overcrowdedness
    cloned_cell.is_alive = false if is_alive && number_of_alive_neighbours > 3

    # give birth to new cell when there are exactly 3 alive neighbours and current state is dead
    cloned_cell.is_alive = true if !(is_alive) && number_of_alive_neighbours == 3


    cloned_cell
  end

end