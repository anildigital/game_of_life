Dir[File.dirname(__FILE__) + "/models/*.rb"].each do |file|
    require file
end

universe = Universe.new

puts "Block Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_block.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

puts "\n\n"

puts "Blinker Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_blinker.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

puts "\n\n"


puts "Bloat Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_bloat.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

puts "\n\n"


puts "Toad Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_toad.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

puts "\n\n"