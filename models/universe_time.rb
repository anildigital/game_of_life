class UniverseTime # Time class is reserved so using UniverseTime
  
  attr_accessor :time_count
  attr_reader :universe
  
  def initialize(universe)
    @universe = universe
  end
  
  def tick
    @universe.grid.grow
  end
  
end