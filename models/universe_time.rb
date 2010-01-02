require 'observer'
class UniverseTime # Represents UniverseTime  (Purposely haven't used original Time class)
  
  attr_reader :time_count # Time counter which changes upon discrete time tick
  
  include Observable
  
  def initialize
    @time_count = 0
  end
  
  def tick
    @time_count += 1
    changed
    notify_observers
    self
  end
  
end