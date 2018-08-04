class Game
  attr_reader :permutations

  def initialize(letter_string, dictionary)
    @dictionary = dictionary
    @permutations = get_permutations(letter_string)
    @possible_words = nil
  end

  def convert_character_array_to_string(character_array)
    output = ""

    character_array.each do |character|
      output = output + character
    end

    return output
  end

  def get_permutations(text)
    text_array = text.split('')
    permutations = Array.new()

    i = text_array.size

    loop do
      new_set = text_array.permutation(i)
      new_set = new_set.uniq

      new_set.each do |item|
        item = convert_character_array_to_string(item)
        permutations.push(item) unless item.length < 2
      end

      break unless i > -1

      i = i - 1
    end

    permutations = permutations.uniq

    return permutations
  end

  def show_possible_words
    new_possible_words = Array.new()
    performed_scan_operations = 0
    total_scan_operations = @permutations.size * @dictionary.words.size
    progress = 0
    progress_milestone_interval = 10

    @permutations.each do |permutation|
      new_valid_word = permutation

      if (@dictionary.words.include? new_valid_word)
        new_possible_words.push(new_valid_word) unless new_valid_word.eql? ""
      end

      performed_scan_operations = performed_scan_operations + 1
    end

    @possible_words = new_possible_words

    @possible_words.each do |possible_word|
      puts "#{possible_word} - #{@dictionary.get_definition(possible_word)}"
    end
  end
end
