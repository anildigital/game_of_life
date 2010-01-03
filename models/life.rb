class Life # Represents things which has has state, alive or dead
  
  ALIVE = "X"
  DEAD = "-"
  
  attr_accessor :state  # Represents alive or dead
  
  def is_alive
    @state == ALIVE
  end
  
  
  def is_alive=(is_alive)
    @state = (is_alive ? ALIVE : DEAD)
  end
  
end