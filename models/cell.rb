require File.dirname(__FILE__) + '/life'

class Cell < Life

  attr_reader :neighbours

  def initialize
    @is_alive = false
    @neighbours = []
  end

  # returns the number of alive neighbors this cell has
  def number_of_alive_neighbours
    alive_neighbours = @neighbours.find_all { |cell| cell.is_alive }
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
    # Initialize it with cell's previous state
    nxt_state = state

    # kill the cell due to lonelyness or overcrowdedness
    nxt_state = DEAD if is_alive && (number_of_alive_neighbours < 2 or number_of_alive_neighbours > 3)

    # give birth to new cell when there are exactly 3 alive neighbours and current state is dead
    nxt_state = ALIVE if !(is_alive) && number_of_alive_neighbours == 3
    
    nxt_state
  end

end