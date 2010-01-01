require File.dirname(__FILE__) + '/grid'
require File.dirname(__FILE__) + '/universe_time'

class Universe 

  attr_reader :grid
  attr_reader :universe_time
  
  def initialize
    @grid = nil
    @universe_time = UniverseTime.new(self)
  end

  def setup_life(seed_file)
    @grid = Grid.new(seed_file)
  end

end
