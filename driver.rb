require_relative 'csv_reader'
require_relative 'commands/author_search_command'
require_relative 'commands/isbn_search_command'
require_relative 'commands/quit_command'

data_source = CsvReader.new(ARGV[0])
data_source.loadData

commands = [
	AuthorSearchCommand.new(data_source),  
	ISBNSearchCommand.new(data_source),
	QuitCommand.new(data_source)
]	
last_command = commands.size() -1

quit = false
puts
while !quit 
	commands.each_index do |index| 
		puts " #{index+1} #{commands[index].title}"
    end
    print "Which option? "  
	option = STDIN.gets.chomp.to_i
	option -= 1     # Adjust for array index 
	# puts "\e[H\e[2J"   # Clear screen (Unix/Mac only)
	if (0..last_command) === option
	   commands[option].input
	   commands[option].execute
	   20.times { print '-'}
	   puts
	 else
	    puts 'Not a valid opyion.'
	 end 
	 quit = true if option == last_command
end