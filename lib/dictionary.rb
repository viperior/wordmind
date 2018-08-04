class WMDictionary
  attr_reader :words

  def initialize()
    @definitions = Hash.new
    @letters = Array.new()
    @original_letter_count = nil
    @words = Array.new()
  end

  def add_letters(letters)
    letters = letters.gsub(/[^0-9a-z]/i, '').upcase
    @original_letter_count = letters.length
    letters = letters.split('')
    letters = letters.uniq
    @letters = letters
  end

  def display_members
    @words.each do |word|
      puts word
    end
  end

  def get_definition(word_text)
    return @definitions[word_text]
  end

  def load_dictionary
    # Load dictionary
    puts "Loading dictionary..."

    CSV.foreach(File.expand_path("..", Dir.pwd) + "/wordmind/data/dictionary.csv") do |row|
      current_word = row[0].gsub(/[^0-9a-z]/i, '').upcase
      definition = row[2]

      if (current_word.length > 1)
        first_letter = current_word[0]
      end

      if ((@letters.uniq.include? first_letter) && (current_word.length <= @original_letter_count) && (!words.include? current_word))
        @words << current_word
        @definitions[current_word] = definition
      end
    end

    @words = @words.uniq

    puts "Dictionary load complete. (" + @words.size.to_s + " words)"
  end
end
