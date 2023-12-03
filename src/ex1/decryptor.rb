module Ex1
  class Decryptor
    def parse(line)
      numbers = remove_letters(line)
      numbers[0].to_i * 10 + numbers[-1].to_i
    end

    protected

    def remove_letters(line)
      line.gsub(/[a-zA-Z]/, '')
    end
  end
end
