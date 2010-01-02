#!/usr/bin/ruby

Dir[File.dirname(__FILE__) + "/models/*.rb"].each do |file|
    require file
end

universe = Universe.new

seed_file = ARGV[0]

if !(ARGV[0])
  puts "Please pass path of seed file in command"
  exit(0)
end

begin
  universe.setup_life(seed_file)
rescue Exception => e
  if [Errno::ENOENT, Errno::EISDIR].include?(e.class)
    puts "Invalid seed file"
    exit(0)
  else
    raise $!
  end
end

puts "Input\n"
puts universe.grid.to_s
puts "\n"
universe.universe_time.tick
puts "Output\n"
puts universe.grid.to_s

puts("______________________________\n\n\n")