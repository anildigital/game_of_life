Game of Life
============

Info
----

This software is a simulation of "Game of Life". 

It models five classes 

1. Life - Abstract class for the things that has property of live and death.
2. Cell - Concrete class Cell which inherits from life. Tt has state live or death . It also knows about it's neighbor cells. Birth and death is depends of number of neighbours the cell has. 
3. Grid - Grid class which represents orthogonal grid of square cells.
4. Universe - This class models Universe which has grid and universe_time. Initializing Universe initializes grid which has life in the form of cells. Universe has instance of universe_time.
5. UniverseTime - UniverseTime which is responsible for tick. A tick is a discrete moment of time like 'second'.


How to run
----------

Run the file named "run_game_of_life.rb" with ruby command which you can find in root folder.

$ruby run_game_of_life.rb 
OR 
$ ./run_game_of_life.rb 


If you want to use your own seed file then use "run_gol_with_seed_file.rb" program

$./run_gol_with_seed_file.rb resources/seed_blinker_your.txt


Run Tests
---------

Run file named run_test_suite.rb with ruby command which you can find in tests folder.

$ cd test
$ ruby run_test_suite.rb


Directory Structure
-------------------

models    => Contains model classes
test      => Contains tests 
resources => Input seed file. For using those info see how to run section
tests/fixtures => Fixtures used in tests


Brief Introduction of Design
-----------------------------

See "Brief Introduction of Design.doc" in root folder

