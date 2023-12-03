module Ex1
  class WordAndNumbers
    def execute(line)
      results = []

      results << forward_scan(line)
      results << backward_scan(line)

      results.compact
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

    def forward_scan(line)
      buffer = ''

      line.split('').each do |letter|
        number = detect_number(letter)
        return number unless number.nil?

        buffer += letter
        result = detect_word_forward(buffer)

        return result if result.is_a? Integer
        buffer = result if result.is_a? String
      end

      nil
    end

    def backward_scan(line)
      buffer = ''

      line.reverse.split('').each do |letter|
        number = detect_number(letter)
        return number unless number.nil?

        buffer += letter
        result = detect_word_backwards(buffer.reverse)

        return result if result.is_a? Integer
        buffer = result.reverse if result.is_a? String
      end

      nil
    end

    def detect_number(letter)
      return letter.to_i if letter.match? /[0-9]/
      nil
    end

    def detect_word_forward(buffer)
      possible_numbers = numbers_starting_with(buffer)

      if possible_numbers.size == 1 && buffer == possible_numbers[0]
        return NUMBERS[buffer]
      end

      if possible_numbers.size == 0
        while possible_numbers.size == 0 && buffer.size > 0
          buffer = buffer[1..]
          possible_numbers = numbers_starting_with(buffer)
        end

        return buffer
      end

      nil
    end

    def detect_word_backwards(buffer)
      possible_numbers = numbers_ending_with(buffer)

      if possible_numbers.size == 1 && buffer == possible_numbers[0]
        return NUMBERS[buffer]
      end

      if possible_numbers.size == 0
        while possible_numbers.size == 0 && buffer.size > 0
          buffer = buffer[0..-2]
          possible_numbers = numbers_ending_with(buffer)
        end

        return buffer
      end

      nil
    end

    def numbers_starting_with(text)
      NUMBERS.keys.filter { |k| k.start_with?(text) }
    end

    def numbers_ending_with(text)
      NUMBERS.keys.filter { |k| k.end_with?(text) }
    end
  end
end