class WMDictionary
  attr_reader :words

  def initialize(letters)
    @letters = Array.new()
    @words = Array.new()

    letters.each_char do |char|
      @letters << char
    end
  end

  def display_members
    @words.each do |word|
      puts word
    end
  end

  def load_dictionary
    # Load dictionary
    puts "Loading dictionary..."

    CSV.foreach(File.expand_path("..", Dir.pwd) + "/wordmind/data/dictionary.csv") do |row|
      new_word = row[0].gsub(/[^0-9a-z]/i, '')
      first_letter = new_word[0]

      if ((@letters.uniq.include? first_letter) && (new_word.size <= @letters.size))
        @words << row[0].gsub(/[^0-9a-z]/i, '')
      end
    end

    @words = @words.uniq

    puts "Dictionary load complete. (" + @words.size.to_s + " words)"
  end
end
