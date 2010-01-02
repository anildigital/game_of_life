class Life # Represents things which has birth and death
  
  attr_accessor :is_alive  # Represents alive or dead
  
  def next_state   # Next state of life when time changes (tick)
    puts "Called abstract method next state"
  end
  
end