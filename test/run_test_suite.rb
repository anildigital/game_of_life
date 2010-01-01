require 'test_helper'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

# require all "_test.rb" files
Dir[File.dirname(__FILE__) + "/*_test.rb"].each do |file|
    require file
end

class GameOfLife_Tests
   def self.suite
     suite = Test::Unit::TestSuite.new("Game of Life Test Suite")
     suite << CellTest.suite
     suite << GridTest.suite
     suite << UniverseTimeTest.suite        
     suite << UniverseTest.suite     
     return suite
   end
 end
 
Test::Unit::UI::Console::TestRunner.run(GameOfLife_Tests)