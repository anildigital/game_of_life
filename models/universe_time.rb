require 'observer'
class UniverseTime # Time class is reserved so using UniverseTime
  
  attr_accessor :time_count
  attr_reader :universe
  
  include Observable
  
  def initialize(universe)
    @time_count = 1
    @universe = universe
  end
  
  def tick
    @time_count += 1
    changed
    notify_observers
  end
  
end