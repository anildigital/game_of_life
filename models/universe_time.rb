require 'observer'
require 'singleton'
class UniverseTime # Represents UniverseTime  (Purposely haven't used original Time class)
  
  attr_reader :time_count # Time counter which changes upon discrete time tick
  
  include Observable # When time changes (tick), those objects subscribed to this event get notified.
  
  include Singleton # Considering Time as singleton gives single instance of Time for all universes created
  
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