Game of Life
============


Info
----

This software is a simulation of "Game of Life". 

It models five classes 

1. Universe - Everything including life is a part of universe
2. Life - The things which has property of birth and death are part of life
3. UniverseTime - UniverseTime which represents time, it changes upon tick( discrete moment, like seconds we have in our Time)
4. Cell - Cell is a life, it gets birth and it has death. It also knows about it's neighbor cells. birth and death is depends of number of neighbours it has. It has two states live or dead.
5. Grid - Orthogonal grid of square cells.


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


