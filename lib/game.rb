class Game
  attr_reader :permutations

  def initialize(letter_string, dictionary)
    @dictionary = dictionary
    @possible_words = Array.new()

    @permutations = letter_string.all_possible_permutations.uniq
    more_permutations = Array.new()

    @permutations.each do |permutation|
      new_string = ""

      permutation.each_char do |char|
        new_string = new_string + char unless char == permutation[0]
      end

      more_permutations << new_string
    end

    more_permutations.uniq.each do |new_permutation|
      @permutations << new_permutation
    end

    @permutations = @permutations.uniq
  end

  def show_possible_words
    puts "Letter permutations: #{@permutations.size}"
    puts "Dictionary words: #{@dictionary.words.size}"
    puts "Total permutations: #{@permutations.size * @dictionary.words.size}"

    puts "Proceed? y/n"

    input = gets.chomp

    if (input == "y")
      @permutations.each do |permutation|
        @dictionary.words.each do |dictionary_word|
          @possible_words << permutation unless !(dictionary_word.to_s.include? permutation)
          puts permutation unless !(dictionary_word.to_s.include? permutation)
        end
      end

      @possible_words.each do |possible_word|
        puts possible_word
      end
    else
      puts "Operation aborted."
    end
  end
end
