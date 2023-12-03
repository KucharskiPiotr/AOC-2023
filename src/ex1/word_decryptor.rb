require_relative 'decryptor'

module Ex1
  class WordDecryptor < Ex1::Decryptor
    protected

    def remove_letters(line)
      results = []
      buffer = ''

      line.split('').each do |letter|
        if letter.match? /[0-9]/
          buffer = ''
          results << letter.to_i
          next
        end

        buffer += letter
        possible_numbers = numbers_starting_with(buffer)

        if possible_numbers.size == 0
          buffer = buffer[1..]
          next
        end

        if possible_numbers.size == 1 && buffer == possible_numbers[0]
          results << NUMBERS[buffer]
          buffer = ''
          next
        end
      end

      results
    end

    private

    NUMBERS = {
      'one' => 1,
      'two' => 2,
      'three' => 3,
      'four'  => 4,
      'five' => 5,
      'six' => 6,
      'seven' => 7,
      'eight' => 8,
      'nine' => 9,
    }

    def numbers_starting_with(text)
      NUMBERS.keys.filter { |k| k.start_with?(text) }
    end
  end
end