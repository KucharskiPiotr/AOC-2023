require_relative 'decryptor'

module Ex1
  class WordDecryptor < Ex1::Decryptor
    protected

    def remove_letters(line)
      results = []
      buffer = ''

      # First go from left, then from right
      line.split('').each do |letter|
        if letter.match? /[0-9]/
          buffer = ''
          results << letter.to_i
          break
        end

        buffer += letter
        possible_numbers = numbers_starting_with(buffer)

        if possible_numbers.size == 1 && buffer == possible_numbers[0]
          results << NUMBERS[buffer]
          buffer = ''
          break
        end

        if possible_numbers.size == 0
          while possible_numbers.size == 0 && buffer.size > 0
            buffer = buffer[1..]
            possible_numbers = numbers_starting_with(buffer)
          end
          next
        end
      end

      line.reverse.split('').each do |letter|
        if letter.match? /[0-9]/
          buffer = ''
          results << letter.to_i
          break
        end

        buffer += letter
        possible_numbers = numbers_ending_with(buffer.reverse)

        if possible_numbers.size == 1 && buffer.reverse == possible_numbers[0]
          results << NUMBERS[buffer.reverse]
          buffer = ''
          break
        end

        if possible_numbers.size == 0
          while possible_numbers.size == 0 && buffer.size > 0
            buffer = buffer[1..]
            possible_numbers = numbers_ending_with(buffer.reverse)
          end
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

    def numbers_ending_with(text)
      NUMBERS.keys.filter { |k| k.end_with?(text) }
    end

    def forward_scan(result, letter)

    end
  end
end