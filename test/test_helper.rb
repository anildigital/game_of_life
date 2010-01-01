require 'rubygems'
require 'test/unit'
Dir[File.dirname(__FILE__) + "/../models/*.rb"].each do |file|
    require file
end