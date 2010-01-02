require File.dirname(__FILE__) + '/grid'
require File.dirname(__FILE__) + '/universe_time'

class Universe  # The Universe which has a grid and an universe time

  attr_reader :grid
  attr_reader :universe_time
  
  def initialize
    @grid = nil
    @universe_time = UniverseTime.new
  end

  def setup_life(seed_file)
    @grid = Grid.new(seed_file)
    @universe_time.add_observer(@grid)
  end

end
