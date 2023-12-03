module Ex1
  class Decryptor
    def parse(line)
      numbers = remove_letters(line)
      result = numbers[0].to_i * 10 + numbers[-1].to_i

      result
    end

    protected

    def remove_letters(line)
      line.gsub(/[a-zA-Z]/, '')
    end
  end
end
