Dir[File.dirname(__FILE__) + "/models/*.rb"].each do |file|
    require file
end

endline = lambda { puts("______________________________\n\n\n")}

universe = Universe.new

puts "Block Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_block.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

endline.call

puts "Blinker Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_blinker.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

endline.call


puts "Bloat Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_bloat.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

endline.call


puts "Toad Pattern"
seed_file = File.dirname(__FILE__) + "/resources/seed_toad.txt"
universe.setup_life(seed_file)
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts universe.grid.to_s

endline.call