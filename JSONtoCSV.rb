#This script takes in a JSON file as an argument and spits out a CSV converted file
require 'rubygems'
require 'json'
raise Exception, 'you must provide a json file' unless ARGV[0]

json = JSON.parse(File.open(ARGV[0]).read)

h = Hash[*json]

sortedJSON = h.sort_by { |k, v| k }
#sortedJSON = sortedJSON.sort_by { |k, v| v }.reverse

# Create an output file and write to it
File.open('output.csv', 'w') do |f2|
  # use "\n" for two lines of text
sortedJSON.each_with_index do |x, xi| 
  x.each_with_index do |y, yi| 
    f2.print "#{y}"
        if yi == 0 
          f2.print "," 
        end    
  end 
 f2.puts
end

end # necessary to close file
