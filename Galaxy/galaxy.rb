#! /usr/bin/ruby
require_relative "bin/Actions"
require_relative "res/Resources"

exit_at_end = false
use_input = false
input_path = ""

exit = false

resources = Resources.new
actions = Actions.new

ARGV.each do |s|
  if s.include? "-h" || "--help"
    puts "\n" + resources.description
    puts "\nCreated by: " + resources.creator
    puts resources.helpArgs
  elsif s.include? "-i" || "--input"
    index = ARGV.find_index(s) + 1
    if(ARGV[index] == "")
      puts "No path defined.\nQuitting"
      exit = true

    else
      use_input = true
      input_path = ARGV[index]
    end
  end
  if s.include? "-e" || "--exit"
    exit_at_end = use_input
  end
end

puts "\n\t--    Insert 'exit' to end. 'help' to help?   --"

until exit
  # Read document first
  if use_input
    File.open(input_path) do |file|
      file.each_line do |s|
        tokens = actions.tokenize(s)
        exit = actions.galaxy(tokens)
      end
    end
    break if exit_at_end
    break if exit
    use_input = false
  end
  # Maybe start user input
  puts "\nWaiting input:"
  tokens = actions.tokenize(STDIN.gets)
  exit = actions.galaxy(tokens)
end
