require 'CSV'

Dir["./lib/*.rb"].each {|file| require file}



display_header(88)

input = 1

loop do
  puts "1) New game"
  puts "2) Exit"

  input = gets.chomp.to_i

  case input
  when 1
    puts "Letters:"
    letters = gets.chomp

    # Load dictionary
    dictionary = WMDictionary.new(letters)

    new_game = Game.new(letters, dictionary)
    puts "Permutating..." + new_game.permutations.size.to_s

    new_game.show_possible_words
  when 2
    puts "Exiting..."
    input = -1
  else
    puts "Invalid menu option..."
  end

  if !(input.is_a? Integer)
    input = -1
  end

  break if !((0 < input) && (input < 4))
end
