require 'test_helper'

class UniverseTimeTest < Test::Unit::TestCase
  
  def setup
    @universe_time = UniverseTime.new
  end
  
  def test_initialize
    assert_not_nil @universe_time
  end
  
  def test_time_count
    @universe_time.tick
    assert_equal 1, @universe_time.time_count
  end
  
  def test_time_count_two_times
    @universe_time.tick.tick
    assert_equal 2, @universe_time.time_count
  end
  
  def test_time_count_two_times
    @universe_time.tick.tick.tick.tick
    assert_equal 4, @universe_time.time_count
  end
  
  def test_observer_behaviour
    obj = Object.new
    obj.instance_eval do 
      def count
        @count
      end
    end
    obj.count
    
    obj.instance_eval do
      def update
        @count = 5
      end
    end 
    
    @universe_time.add_observer(obj)
    @universe_time.tick
    assert_equal 5, obj.count 
  end
  
end