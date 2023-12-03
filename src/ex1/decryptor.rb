module Ex1
  class Decryptor
    def parse(line)
      numbers = line.gsub(/[a-zA-Z]/, '')
      numbers[0].to_i * 10 + numbers[-1].to_i
    end
  end
end
