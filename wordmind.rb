require 'CSV'

Dir["./lib/*.rb"].each {|file| require file}

display_header_animation(8, 0.1, 88)
dictionary = WMDictionary.new()
first_run = true

loop do
  if (first_run)
    input = 1
    first_run = false
  else
    puts "1) New game"
    puts "2) Exit"

    input = gets.chomp.to_i
  end

  case input
  when 1
    puts "Letters:"
    letters = gets.chomp.upcase

    dictionary.add_letters(letters)
    dictionary.load_dictionary

    new_game = Game.new(letters, dictionary)

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
